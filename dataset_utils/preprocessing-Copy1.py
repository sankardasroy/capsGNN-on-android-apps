import argparse, os, shutil, scipy
import numpy as np
import networkx as nx
import scipy.sparse as sp
import pickle, random
from multiprocessing import Pool, cpu_count


graph_embedding_output = 'graph_embeddings.pkl'
# Define the graph node attributes
'''
Android API type:
    1: Android platform APIs, starts with 'Landroid'
    2: APIs from Java libraries, starts with 'Ljava'
    3: Third-party dependencies, starts with others like 'Lcom' ect.
'''
# NOTE: we only defined one attribute here, but we assume tokenized node has three attributes
attri_name = {
    'type': {
        'channel': 1,
        'if_input': True,
        'if_reconst': True
    }
}


def settings():
    parser = argparse.ArgumentParser("Data_Preprocessing")

    parser.add_argument("--dataset_input_dir", type=str, default="graph_dataset/APKICFG",
                        help="Where gml dataset is stored.")
    parser.add_argument("--output_data_dir", type=str, default="data_plk/", help="Where output dataset is stored.")
    parser.add_argument("--pickle_v", type=int, default=2, help="version of pickle.")

    return parser.parse_args()


class GraphDataset():
    def __init__(self, input_dir, extn, class_label_fname, dataset_output_dir, attri_dict):
        graphs_dataset = [os.path.join(input_dir, file) for file in os.listdir(input_dir) if file.endswith(extn)]
        self.attri_dict = attri_dict
        self.graph_to_label = {line.rstrip().split()[0]: int(line.rstrip().split()[1]) for line in
                               open(class_label_fname, 'r')}
        self.class_label_fname = class_label_fname
        self.num_classes = len(set(self.graph_to_label.values()))
        self.node_types = {}
        self.subword_types = {}
        self.node_attris = [{}, {}, {}] # we defined three attributes
        self.node_type_attri_map = {}
        self.scan(graphs_dataset)
        self.graphs_dataset = graphs_dataset
        self.dataset_output_dir = dataset_output_dir

    # Collect graph dataset information
    def scan(self, graphs_dataset):
        print('Scanning dataset ... ')
        id_to_attri_maps = []  # node has three attributes: class, method, para&retruntype
        attri_to_id_maps = []
        label_to_id_map = {}
        id_to_label_map = []
        
        degree_max = 0
        for label in self.graph_to_label.values():
            if label not in set(id_to_label_map):
                label_to_id_map[label] = len(label_to_id_map)
                id_to_label_map.append(label)

        for graph_idx, graph_file in enumerate(graphs_dataset):
            graph = nx.read_gml(graph_file, label='id')

            nodelist = list(graph)
            for node in nodelist:
                node_id = graph.nodes[node]['label']
                if node_id.endswith(';'):
                    node_id = node_id[:-1]
                apicall = node_id.split("_")[-1]
                try: 
                    classpath, method = apicall.split(';.')
                    mehtodname, para = method.split(':')
                    wordpieces = [classpath, mehtodname, para]
                except:
                    mehtodname = apicall
                    wordpieces = [apicall, apicall, apicall]

                if not (mehtodname == '<init>' or mehtodname == 'init'):
                    self.set_subword_type(wordpieces, apicall)
                    self.set_node_types(wordpieces)

            if (graph_idx+1)%500 == 0:
                print('Done: ',graph_idx+1)

        # add type attributes
        for idx, attri in enumerate(self.node_attris):
            id_to_attri_maps.append(list(self.node_attris[idx].values()))
            attri_to_id_maps.append(dict())
            attri_to_id_maps[idx] = {i: i for i in range(1, len(self.node_attris[idx]) + 1)}

        # Update GraphDaset instance attribute
        self.id_to_attri_maps = id_to_attri_maps
        self.attri_to_id_maps = attri_to_id_maps
        self.label_to_id_map = label_to_id_map
        self.id_to_label_map = id_to_label_map

        # make the test file dict
        self.test_file_dict = {}
        with open('dataset_utils/test_file_names.txt') as f:
            for each in f.readlines():
                self.test_file_dict[each.strip()] = True

    def print_status(self):
        print("Dataset Information:")
        print(" Graph number: {}".format(len(self.graphs_dataset)))
        print(" Attribute Info:")
        for list_idx, attri_list in enumerate(self.attri_to_id_maps):
            print("     Attri {} number: {}".format(list_idx + 1, len(self.attri_to_id_maps[list_idx])))
        print(" Number of Classes: {}".format(self.num_classes))

    
    def set_node_types(self, wordpieces):
        class_name, method_name, return_val = wordpieces[0], wordpieces[1], wordpieces[2]
        for idx, subword in enumerate(wordpieces):
            if subword not in self.node_attris[idx]:
                word_type = len(self.node_attris[idx]) + 1
                self.node_attris[idx][subword] = word_type


    def set_subword_type(self, wordpieces, apicall):
        node_subtypes = []
        for subword in wordpieces:
            if subword in self.subword_types:
                subword_type = self.subword_types[subword]
            else:
                subword_type = len(self.subword_types) + 1
                self.subword_types[subword] = subword_type 
            node_subtypes.append(subword_type)

        # set node type
        if apicall not in self.node_types:
            node_type = len(self.node_types) + 1
            self.node_types[apicall] = node_type
            self.node_type_attri_map[node_type] = tuple(node_subtypes)
       

    def get_nodetype(self, apicall):
        if apicall in self.node_types:
            nodetype = self.node_types[apicall]
        else:
            nodetype = 0

        return nodetype      
        

    def cfg_embedding(self, graph_file):
        fname = os.path.basename(graph_file)
        graph = nx.read_gml(graph_file, label='id')
        nodelist = list(graph)
        node_attri_recon = [[], [], []] # three attributes
        node_attri_input = [[], [], []]

        for node in nodelist:
            node_id = graph.nodes[node]['label']
            if node_id.endswith(';'):
                    node_id = node_id[:-1]
            apicall = node_id.split("_")[-1]
            try: 
                classpath, method = apicall.split(';.')
                mehtodname, para = method.split(':')
            except:
                mehtodname = apicall

            if mehtodname == '<init>' or mehtodname == 'init':
                graph.remove_node(node)  # remove node from graph
            else:
                nodetype = self.get_nodetype(apicall)
                nodetype_arr = list(self.node_type_attri_map[nodetype])

                for idx, subtype in enumerate(nodetype_arr):
                    node_attri_recon[idx].append(subtype)
                    node_attri_input[idx].append(subtype)

        if graph.size() > 0:
            adj_mat = nx.adjacency_matrix(graph).todense().astype(float)
            adj_mat += np.eye(adj_mat.shape[0], adj_mat.shape[1])
            adj_mat = sp.coo_matrix(adj_mat)

            # Since all three attributes need to reconstruct
            reconst_index = [0, 1, 2]
            input_index = [0, 1, 2]
        
            reconstruct_value = []; input_value = []
            for a_idx in reconst_index:  # index of attri that you want to reconstruct
                reconstruct_value += [node_attri_recon[a_idx].count(i) for i in range(len(self.attri_to_id_maps[a_idx]))]
                input_value.append(node_attri_input[a_idx]) # input_value can be done in the same loop since reconst_index and input_index are the same
        
            graph_label = self.graph_to_label[fname]

            # add the test_indicator flag
            indicator = 0
            if self.test_file_dict.get(fname):
                indicator = 1

            data_frame = {
                'adj_mat': adj_mat,
                'node_attri': input_value,
                'reconstruct': reconstruct_value,
                'label': graph_label,
                'filename': fname,
                'test': indicator
            }

            return data_frame
        

    def data_gen(self, pickle_v, save):
        print("Processing graph embedding ...")
        embeddings = []
        if save:
            shutil.copy(self.class_label_fname, self.dataset_output_dir+'.Labels')

        pool = Pool(processes=cpu_count())
        results = pool.map(self.cfg_embedding, self.graphs_dataset, 100)

        for graph in results:
            if graph is not None:
                embeddings.append(graph)

        ofname = os.path.join(self.dataset_output_dir, graph_embedding_output)
        with open(ofname, 'wb') as f:
            pickle.dump(embeddings, f, protocol=settings().pickle_v)

        pool.close()
        pool.join()
        del embeddings


def main():
    FLAGS = settings()
    dataset_input_dir = FLAGS.dataset_input_dir
    dataset_output_dir = os.path.join(FLAGS.output_data_dir, os.path.basename(dataset_input_dir))
    class_label_fname = FLAGS.dataset_input_dir + '.Labels'
    pickle_v = FLAGS.pickle_v

    if not os.path.exists(dataset_output_dir):
        os.mkdir(dataset_output_dir)

    gd = GraphDataset(dataset_input_dir, extn='gml', class_label_fname=class_label_fname,
                      dataset_output_dir=dataset_output_dir, attri_dict=attri_name)
    gd.print_status()
    gd.data_gen(pickle_v=pickle_v, save=True)
    print("Finish graph embedding.")


if __name__ == '__main__':
    main()