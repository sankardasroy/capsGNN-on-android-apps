import argparse, os, shutil, scipy
import numpy as np
import networkx as nx
import scipy.sparse as sp
import pickle, random
from multiprocessing import Pool, cpu_count

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import scipy.stats as stats
import pylab as pl


def settings():
    parser = argparse.ArgumentParser("Data_Preprocessing")
    parser.add_argument("--dataset_input_dir", type=str, default="graph_gml/APKICFG",
                        help="Where gml dataset is stored.")
    parser.add_argument("--output_data_dir", type=str, default="data_plk/", help="Where output dataset is stored.")

    return parser.parse_args()


class GraphDataset():
    def __init__(self, input_dir, extn, class_label_fname, dataset_output_dir):
        graphs_dataset = [os.path.join(input_dir, file) for file in os.listdir(input_dir) if file.endswith(extn)]
        self.graph_to_label = {line.rstrip().split()[0]: int(line.rstrip().split()[1]) for line in
                               open(class_label_fname, 'r')}
        self.class_label_fname = class_label_fname
        self.num_classes = len(set(self.graph_to_label.values()))
        self.graphs_dataset = graphs_dataset
        self.dataset_output_dir = dataset_output_dir
        self.scan(graphs_dataset)
        

    # Collect graph dataset information
    def scan(self, graphs_dataset):
        print('Scanning dataset ... ')

        apk_apicalls = []
        benign_apps = []; malicious_apps = []
        for graph_idx, graph_file in enumerate(graphs_dataset):
            graph = nx.read_gml(graph_file, label='id')

            nodelist = list(graph)
            graph_file = graph_file.split('/')[-1]
            apklabel = self.graph_to_label[graph_file]

            apk_node_number = len(nodelist)
            apk_apicalls.append(apk_node_number)
            if apklabel == 0:
                benign_apps.append(apk_node_number)
            elif apklabel == 1:
                malicious_apps.append(apk_node_number)
            '''
            for node in nodelist:
                node_id = graph.node[node]['label']
                leftidx = node_id.rfind('signature') + 9  # add 9 to skip signature
                rightidx = node_id.rindex('kind')
                apicall = node_id[leftidx:rightidx]
            '''
        info_entry = []
        total_dataset_info = self.get_basic_data_info(apk_apicalls, "Total_dataset")
        info_entry.extend(total_dataset_info)
        benign_app_info = self.get_basic_data_info(benign_apps, "Benign_apps")
        info_entry.extend(benign_app_info)
        malicious_app_info = self.get_basic_data_info(malicious_apps, "Malicious_apps")
        info_entry.extend(malicious_app_info)

        figname = "dataset_basic_information.txt"
        ofname = os.path.join(self.dataset_output_dir, figname)
        with open(ofname, 'w') as f:
            for entry in info_entry:
                f.write(entry)

        self.plot_data_distribution(apk_apicalls, "total_apps")
        self.plot_data_distribution(benign_apps, "benign_apps")
        self.plot_data_distribution(malicious_apps, "malicious_apps")

    def get_basic_data_info(self, dataset, data_tag):
        if len(dataset) == 0:
            print("No empty dataset")
            return
        
        basic_info = []
        total_apps = len(dataset)
        apk_avg_api = sum(dataset) / total_apps
        print("{}: {}".format(data_tag, total_apps))
        basic_info.extend("{}: {}\n".format(data_tag, total_apps))
        print("App in {} has minimum api calls: {}".format(data_tag, min(dataset)))
        basic_info.extend("App in {} has minimum api calls: {}\n".format(data_tag, min(dataset)))
        print("App in {} has maximum api calls: {}".format(data_tag, max(dataset)))
        basic_info.extend("App in {} has maximum api calls: {}\n".format(data_tag, max(dataset)))
        print("{}, the average API calls in each apk: {}".format(data_tag, apk_avg_api))
        basic_info.extend("{}, the average API calls in each apk: {}\n\n".format(data_tag, apk_avg_api))

        return basic_info

    def plot_data_distribution(self, dataset, data_tag):
        fig1 = plt.figure()
        sns.distplot(dataset, kde=False, rug=True)

        figname = "{}_API-call_Frquency_Distribution.png".format(data_tag)
        ofname = os.path.join(self.dataset_output_dir, figname)

        plt.xlabel('API-call in an APK')
        plt.ylabel('Number of APKs')
        plt.title('API-call Histogram({})'.format(data_tag))
        plt.savefig(ofname)
        plt.close(fig1)

        fig2 = plt.figure()
        h = sorted(dataset)
        fit = stats.norm.pdf(h, np.mean(h), np.std(h))  
        pl.hist(h,density=True)    
        pl.plot(h,fit,'-o')

        figname = "{}_API-call_Distribution.png".format(data_tag)
        ofname = os.path.join(self.dataset_output_dir, figname)
        pl.xlabel('API-call in an APK')
        # plt.ylabel('Number of APKs')
        pl.title('API-call Normal Distribution({})'.format(data_tag))
        pl.savefig(ofname)
        pl.close(fig2)

def main():
    FLAGS = settings()
    dataset_input_dir = FLAGS.dataset_input_dir
    dataset_output_dir = FLAGS.output_data_dir
    class_label_fname = FLAGS.dataset_input_dir + '.Labels'

    gd = GraphDataset(dataset_input_dir, extn='gml', class_label_fname=class_label_fname,
                      dataset_output_dir=dataset_output_dir)


if __name__ == '__main__':
    main()
