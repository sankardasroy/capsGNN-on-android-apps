import numpy as np
import pickle
import os
import math
import tensorflow as tf
from time import time
from dataset_utils.GraphDataset import GraphDataset
from config import settings, get_net_structure
from capsules_utils.GraphCap_net import CapsGNN_nets
from plot_functions import plot_prediction_accuracy
from sklearn import preprocessing

with open('data_plk/APKICFG/graph_embeddings.pkl', 'rb') as f:
    graphs_dataset = pickle.load(f)
    print("Load pickle file successfully!")


def run_data_session(datasetType, dataset, gd, GraphNet, sess, epoch, ratio):
    loss = 0;
    error = 0;
    loss_margin = 0;
    loss_regular = 0
    step = 0;
    is_oneEpoch_finish = 0;
    processed_graph_num = 0
    predictions = [];
    actual_probs = [];
    actual_labels = []
    t0 = time()
    while is_oneEpoch_finish == 0:
        attri_descriptors, adj_mats, label, reconstructs, is_oneEpoch_finish = gd.data_gen(
            dataset_index=dataset, batch_size=settings().batch_size)

        attri_descriptors = list(zip(*attri_descriptors))

        feed_dict = dict()
        for idx in range(len(attri_descriptors)):
            feed_dict[GraphNet.node_inputs[idx]] = attri_descriptors[idx]
        feed_dict[GraphNet.labels] = label
        feed_dict[GraphNet.adj_mats] = adj_mats
        feed_dict[GraphNet.reconstruct_value] = reconstructs

        if datasetType == 'train':
            feed_dict[GraphNet.if_train] = True
            _, loss_val, loss_regular_val, loss_margin_val, error_val, lr, not_equal = sess.run(
                [GraphNet.optimizer,
                 GraphNet.loss,
                 GraphNet.loss_regular,
                 GraphNet.loss_margin,
                 GraphNet.error,
                 GraphNet.learning_step,
                 GraphNet.not_equal],
                feed_dict=feed_dict)
            loss += loss_val;
            loss_regular += loss_regular_val
            loss_margin += loss_margin_val;
            error += error_val
            processed_graph_num += len(label)
        else:
            feed_dict[GraphNet.if_train] = False
            loss_val, pred, result, error_val = sess.run(
                [GraphNet.loss_margin,
                 GraphNet.prediction,
                 GraphNet.result,
                 GraphNet.error, ],
                feed_dict=feed_dict)
            loss += loss_val;
            error += error_val;
            predictions += pred.tolist()
            # print(result,len(result))
            null_count = 0
            for i, each in enumerate(result):
                for j, val in enumerate(each):
                    if math.isnan(val):
                        result[i][j] = float(0)
                        null_count += 1
            if null_count:
                print('Null Count: ', null_count)
            norm_result = preprocessing.normalize(result.tolist(), norm='l1')
            probs = norm_result[:, 1]  # get positive class probabilities
            actual_probs += probs.tolist()
            actual_labels += label

        step += 1

    epoch_time = time() - t0
    if datasetType == 'train':
        print("  ===> TRAIN  - loss: {:.6f} - error: {:.6f} - time: {:.2f} sec".format(loss_margin / step, error / (
                    1.0 * processed_graph_num), epoch_time))
        loss_error_record = ['\n', 'train : ', str(loss_margin / step), str(error / (1.0 * processed_graph_num)), '\n']
    elif datasetType == 'val':
        print("  ===> VAL    - loss: {:.6f} - error: {:.6f} - time: {:.2f} sec".format(loss / step,
                                                                                       error / (1.0 * len(dataset)),
                                                                                       epoch_time))
        plot_prediction_accuracy(actual_labels, predictions, actual_probs, ratio, epoch,'val-')
        loss_error_record = ['valid : ', str(loss / step), str(error / (1.0 * len(dataset))), '\n']
    elif datasetType == 'test':
        plot_prediction_accuracy(actual_labels, predictions, actual_probs, ratio, epoch)
        print("  ===> TEST at ratio {} - loss: {:.6f} - error: {:.6f} - time: {:.2f} sec".format(ratio, loss / step,
                                                                                                 error / (1.0 * len(
                                                                                                     dataset)),
                                                                                                 epoch_time))
        loss_error_record = ['test at ratio', str(ratio), ': ', str(loss / step), str(error / (1.0 * len(dataset))),
                             '\n']

    return loss_error_record


def main():
    FLAGS = settings()
    class_labels_fname = FLAGS.dataset_dir + '.Labels'

    net_structure = get_net_structure()
    layer_depth = len(net_structure['node_emb'])
    layer_width = net_structure['node_emb'][0]
    num_graph_capsules = net_structure['graph_emb'][0]

    graph_emb_size = FLAGS.graph_embedding_size
    node_emb_size = FLAGS.node_embedding_size

    reg_scale = FLAGS.reg_scale
    batch_size = FLAGS.batch_size
    max_epoch = FLAGS.epochs
    noise = FLAGS.noise
    x_fold = FLAGS.x_fold

    error_file_name = '_'.join(
        ['log', os.path.basename(FLAGS.dataset_dir), 'bs', str(batch_size), 'epoch', str(max_epoch), 'lr',
         str(FLAGS.learning_rate), 'dc', str(FLAGS.decay_step), 'noise', str(noise), 'layer-depth',
         str(layer_depth), 'layer-width', str(layer_width), 'node-dim', str(node_emb_size), 'graph-dim',
         str(graph_emb_size), 'graph-cap', str(num_graph_capsules), 'reg-scal', str(reg_scale), 'atten',
         str(FLAGS.Attention), 'coordinate', str(FLAGS.coordinate), 'iter', str(FLAGS.iterations)])

    gd = GraphDataset(graphs_dataset=graphs_dataset, class_label_fname=class_labels_fname)
    gd.print_status()

    GraphNet = CapsGNN_nets(
        node_attris=gd.attri_len,
        num_classes=gd.num_classes,
        learning_rate=FLAGS.learning_rate,
        node_embedding_size=FLAGS.node_embedding_size,
        graph_embedding_size=FLAGS.graph_embedding_size,
        iterations=FLAGS.iterations,
        net_structure=get_net_structure(),
        decay_step=FLAGS.decay_step,
        reg_scale=reg_scale,
        noise=noise,
        reconstruct_num=gd.reconstruct_num,
        coordinate=FLAGS.coordinate,
        if_Attention=FLAGS.Attention,
        lambda_val=FLAGS.lambda_val)

    error_write_out = ''

    # tf_config = tf.ConfigProto(allow_soft_placement=True, log_device_placement=True)
    tf_config = tf.compat.v1.ConfigProto(allow_soft_placement=True)
    testdata_ratios = ['-',1,0.342]
    valdata_ratios = [1, 0.115,0.342]
    train_test_split = gd.dataset_split(1 / x_fold, testdata_ratios)
    groups_dict = train_test_split[0]
    train_dataset = groups_dict['train']
    val_dataset = groups_dict['val']
    test_datasets = groups_dict['test']
    print("Dataset: train: {}, valid: {}".format(len(train_dataset), len(val_dataset)))
    for ratio, testdata in zip(testdata_ratios, test_datasets):
        print("ratio {}: test_dataset: {}".format(ratio, len(testdata)))

    with tf.compat.v1.Session(graph=GraphNet.graph, config=tf_config) as sess:
        init = tf.compat.v1.global_variables_initializer()
        sess.run(init)
        i=0
        for i in range(1, FLAGS.epochs + 1):
            loss_error_record = []
            print("Epoch: {}".format(i))
            train_loss_error_msg = run_data_session("train", train_dataset, gd, GraphNet, sess, i, "-")  # run train dataset
            loss_error_record.extend(train_loss_error_msg)
            if i % 1 == 0:  # REMOVE FALSE AND ADJUST THE datasetsplit function's val_ration=0 to do the validation. Also we need to tweak something in datasetsplit
                val_loss_error_msg = run_data_session("val", val_dataset, gd, GraphNet, sess, i,
                                                      "-")  # run validate dataset
                loss_error_record.extend(val_loss_error_msg)
            if i == FLAGS.epochs:
                for test_ratio, test_dataset in zip(testdata_ratios, test_datasets):
                    # print(test_ratio,test_dataset)
                    test_loss_error_msg = run_data_session("test", test_dataset, gd, GraphNet, sess, i,
                                                           test_ratio)  # run test dataset
                    # print('======================Below for train_dataset==========================')
                    # test_loss_error_msg = run_data_session("test", train_dataset, gd, GraphNet, sess, i, test_ratio)
                    loss_error_record.extend(test_loss_error_msg)

            error_write_out += ' '.join(loss_error_record)
            with open(error_file_name, 'w') as f:
                f.write(error_write_out)
        print('final test')
        count=0
        for each in gd.test_part:
            test_list = each
            test_lists = []
            for ratio in testdata_ratios:
                testlist_ratio = gd.gen_data_by_given_ratio(test_list, ratio)
                test_lists.append(testlist_ratio)

            test_datasets = test_lists
            for test_ratio, test_dataset in zip(testdata_ratios, test_datasets):
                print('Test ratio: ', test_ratio)
                test_loss_error_msg= run_data_session("test", test_dataset, gd, GraphNet, sess, 100+i+count, test_ratio)  # run test dataset -> 0=i
                count+=1
        val_lists = []
        for ratio in valdata_ratios:
            vallist_ratio = gd.gen_data_by_given_ratio(val_dataset, ratio)
            val_lists.append(vallist_ratio)
        count=0
        for val_ratio, val_dataset in zip(valdata_ratios, val_lists):
            print('Val Ratio: ', val_ratio)
            val_loss_error_msg= run_data_session("val", val_dataset, gd, GraphNet, sess, 100+count+FLAGS.epochs, val_ratio)
            count+=1


if __name__ == '__main__':
    main()
