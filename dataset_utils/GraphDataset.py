import os,random,json 
import numpy as np
import networkx as nx
import pickle
from config import settings

class GraphDataset():
    def __init__(self,graphs_dataset,class_label_fname):
        self.graph_to_label = {line.rstrip().split('.')[0]:int(line.rstrip().split()[1]) for line in open(class_label_fname,'r')}
        self.num_classes = len(set(self.graph_to_label.values()))
        self.node_index = {}
        self.scan(graphs_dataset)
        self.graphs_dataset = graphs_dataset
        self.graph_read_index = 0
        self.test_part = [[],[]]

    def scan(self,graphs_dataset):
        graph = graphs_dataset[0]
        attri_len = [1] * len(graph['node_attri'])

        self.reconstruct_num = 0
        for graph_file in graphs_dataset:
            if graph_file is not None:
                for attri_idx in range(len(attri_len)):
                    node_attri = graph_file['node_attri'][attri_idx]
                    if max(node_attri) + 1 > attri_len[attri_idx]:
                        attri_len[attri_idx] = max(node_attri) + 1

        self.attri_len = attri_len
        self.reconstruct_num = len(graph['reconstruct'])

    def print_status(self):
        print("Dataset Information:")
        print(" Graph number: {}".format(len(self.graphs_dataset)))
        print(" Attribute Info:")
        for list_idx,attri_list in enumerate(self.attri_len):
            print("     Attri {} number: {}".format(list_idx,self.attri_len[list_idx]))
        print(" Number of Classes: {}".format(self.num_classes))

    def gen_data_by_given_ratio(self, datalist, ratio):
        benign = []; malicious = []
        for idx in datalist:
            if self.graphs_dataset[idx]['label'] == 1:
                malicious.append(idx)
            else:
                benign.append(idx)

        if ratio == '-':
            random.shuffle(datalist)
            return datalist
        else:
            mal_total = len(malicious); benign_total = len(benign)
            if mal_total / benign_total >= ratio:
                mal_num = int(benign_total * ratio)
                selected_mal = random.sample(malicious, mal_num)
                list_update = benign + selected_mal
            else:
                benign_num = int(mal_total / ratio)
                selected_benign = random.sample(benign, benign_num)
                list_update = selected_benign + malicious
            random.shuffle(list_update)

            return list_update

    def dataset_split(self, val_frac, malicious_ratios):
        # test dataset and validation dataset have same fraction
        val_frac=0.13
        train_frac = 1 - val_frac
        train_test_split = []
        graph_idx = list(range(len(self.graphs_dataset)))
        random.seed(settings().seed)  # make sure generate same train, validate, test data --> for evaluation purpose
        random.shuffle(graph_idx)  # Make sure each fold have different element order

        
        test_list = []
        test_dict = {}
        for i,each in enumerate(self.graphs_dataset):
            if int(each['test']) == 1:
                test_list.append(i)
                test_dict[i] = True
                
        # dividing test into two so that we can calculate model decay
        with open('dataset_utils/test_file_1.txt') as f:
            lines = f.readlines()
            print(len(lines))
            test_file_1 = [each.strip() for each in lines]
        with open('dataset_utils/test_file_2.txt') as f:
            lines = f.readlines()
            print(len(lines))
            test_file_2 = [each.strip() for each in lines]
        for each in test_list:
            if self.graphs_dataset[each]['filename'] in test_file_1:
                self.test_part[0].append(each)
                
            elif self.graphs_dataset[each]['filename'] in test_file_2:
                self.test_part[1].append(each)
        print(len(self.test_part[0]),len(self.test_part[1]))

        #division ends.
        
        graph_idx_temp = []
        for each in graph_idx:
            if not test_dict.get(each):
                graph_idx_temp.append(each)
        graph_idx = graph_idx_temp


        graph_malicious, graph_benign = [], []
        for idx in graph_idx:
            if self.graphs_dataset[idx]['label'] == 1:
                graph_malicious.append(idx)
            else:
                graph_benign.append(idx)

        train_list_b, val_list_b = np.split(graph_benign,
                                                   [int(train_frac * len(graph_benign))])
        train_list_m, val_list_m = np.split(graph_malicious,
                                                   [int(train_frac * len(graph_malicious))])
                                                    #int(val_frac * len(graph_idx))])
        train_list = np.concatenate((train_list_b, train_list_m))
        random.shuffle(train_list)
        val_list = np.concatenate((val_list_b, val_list_m))
        random.shuffle(val_list)
        dataset_stats = "Graph idx: "+str(len(graph_idx))+" Train List "+str(len(train_list))+" val list "+str(len(val_list))+" test_list: "+str(len(test_list))+" train_list_b: "+str(len(train_list_b))+" train_list_m: "+str(len(train_list_m))+'val_list_b: '+str(len(val_list_b))+" val_list_m: "+str(len(val_list_m))
        dataset_simplest_stats = 'len graph mal: '+str(len(graph_malicious))+"graph ben len "+str(len(graph_benign))
        print(dataset_simplest_stats)
        print(dataset_stats)
        with open('training_testing_numbers.txt','w') as f:
            f.write(dataset_stats)
            f.write(dataset_simplest_stats)
            
        test_lists = []
        for ratio in malicious_ratios:
            testlist_ratio = self.gen_data_by_given_ratio(test_list, ratio)
            test_lists.append(testlist_ratio)


        data = {
            'train': train_list.tolist(),
            'test': test_lists,
            'val': val_list.tolist()
        }
        # put data into array for cross validation purpose, if only one data, just return data
        train_test_split.append(data)

        return train_test_split

    def data_gen(self, dataset_index, batch_size=1):
        finish_epoch = 0  # flag, check if finish one epoch based on batch size
        index_start = self.graph_read_index
        index_end = min(self.graph_read_index + batch_size, len(dataset_index))
        self.graph_read_index += batch_size

        graph_idx = dataset_index[index_start:index_end]
        max_node_num = 0
        node_attris = [];adj_mats = [];labels = []; reconstructs = []
        for idx in graph_idx:
            graph = self.graphs_dataset[idx]
            node_attri = graph['node_attri']
            if len(node_attri[0]) > max_node_num:
                max_node_num = len(node_attri[0])

            node_attris.append(node_attri)
            reconstructs.append(graph['reconstruct'])
            adj_mat = np.array(graph['adj_mat'].todense())
            adj_mats.append(adj_mat)

            labels.append(graph['label'])
            #print('graph name: ',graph['filename'])
        for b_idx in range(len(labels)):
            for a_idx in range(len(node_attris[0])):
                # attributes padding
                node_attris[b_idx][a_idx] = node_attris[b_idx][a_idx] + [0] * (max_node_num - len(node_attris[b_idx][a_idx]))
            adj_mat_temp = np.zeros((max_node_num, max_node_num))
            adj_mat_temp[:adj_mats[b_idx].shape[0], :adj_mats[b_idx].shape[1]] = adj_mats[b_idx]
            adj_mats[b_idx] = adj_mat_temp


        if index_end == len(dataset_index):
            self.graph_read_index = 0
            finish_epoch = 1
        return node_attris, adj_mats, labels, reconstructs, finish_epoch
