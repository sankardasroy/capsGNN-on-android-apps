# Android Vetting System by Applying CapsGNN

Android is an event-based/component-based system. 
By triggering different events, the control flow can be various, plus building component control flow graph could cause computational challenge. 
The graph we are using is based on highly precise inter-procedural control flow graph (**API-call nodes only**) of one app's components. 

The development of this vetting system's capsule graph neural network is based on:  
> Capsule Graph Neural Network.
> Zhang Xinyi, Lihui Chen.
> ICLR, 2019.
> [[CapsGNN]](https://github.com/XinyiZ001/CapsGNN)

### Package Version
```
tensorflow  1.15
```

### Usage

#### Steps for Preprocessing

- Store the data (.gml files) in the `graphs_dataset/APKICFG` folder.
- `graphs_dataset` folder should contain `APKICFG` folder and `APKICFG.Labels` file (contains labels for the graph).
-	To run the preprocessing code. You need to run preprocessing.py (inside dataset_utils) from that parent folder.

```
  $ python dataset_utils/preprocessing.py
```
-	Stores preprocessed file in the data_plk folder.

#### Training model

- Place name of the apps from 2018_q1 in `dataset_utils/test_file_1.txt`.
- Place name of the apps from 2018_q2 in `dataset_utils/test_file_2.txt`.
-	Place name of the apps from 2018_q1 and 2018_q2 to `dataset_utils/test_file_names.txt`.

All the hyperparameters can be set in `config.py`. Training a model by using default configs:
```
  $ python main.py
```

Training a model with specific epochs:
```
  $ python main.py --epochs 30
```

#### Configuration

* **dataset_dir:** string, location of the preprocessed graph files

* **seed:** int, initial value for random number generation
* **epochs:** int
* **batch_size:** int
* **x_fold:** int, UNUSED. This option defines how data is split between the training and validation sets but its value currently gets re-assigned before it is used in the code.

* **learning_rate:** float, learning rate for the optimizer.
* **decay_step:** int, how often the learning rate should be decreased, value corresponds to a number of training steps.

* **iterations:** int, number of iterations of dynamic routing to perform between primary and graph/class capsules.
* **Attention:** bool, whether or not to perform an attention step before dynamic routing.

* **node_emb_size:** int, size of the node embedding (vector output from the GCN section)
* **node_emb:** Array representing the structure of the GCN section. For example:`[3,3]` will be two layers, each with three channels. Must be set in `config.py`.  

* **graph_emb_size:** int, size of the graph embedding (size of the vector in each capsule)
* **graph_emb:** Array representing the structure of the graph capsule section. For example, `[3,2]` will be two layers, the first with three capsules and the second with two capsules. Must be set in `config.py`.
    * *Note:* The code has been modified to remove the graph capsule layer, so there are only the class capsules. Changing this setting from the default will probably not work without further changes.

* **lambda_val:** float, hyperparameter for computing margin loss.
* **reg_scale:** float, scaling factor for reconstruction loss. Loss is computed as `margin loss + (reconstruction loss * reg_scale)`. Reconstruction loss is added only for regularization, so it should have less effect on the total compared to margin loss.

* **noise:** float, amount of dropout regularization to apply in node embedding layer, value corresponds to the probability for each neuron to be zeroed out.

* **coordinate:** bool, whether or not to use coordinate addition. See the CapsGNN paper for more details.


