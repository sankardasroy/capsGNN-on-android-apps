import tensorflow as tf
import numpy as np 
from config import settings
import itertools
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.metrics import precision_score
from sklearn.metrics import precision_recall_curve
from sklearn.metrics import auc
from sklearn.metrics import roc_curve, roc_auc_score
from sklearn.metrics import recall_score
from sklearn.metrics import f1_score
from funcsigs import signature

save_fig_path = "./pred_figs/"


def plot_confusion_matrix(ratio, cm, classes,normalize=False,title='Confusion matrix',cmap=plt.cm.Blues,val=''):
    """
    This function prints and plots the confusion matrix.
    Normalization can be applied by setting `normalize=True`.
    """
    output = open(val+"output_at_ratio_{}.txt".format(ratio), "a")
    if normalize:
        cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
        print("\nNormalized confusion matrix")
    else:
        print('\nConfusion matrix, without normalization')
        print('\nConfusion matrix, without normalization', file=output)

    print(cm)
    print(cm, file=output)
    print('\n', file=output)
    print()
    output.close()

    plt.imshow(cm, interpolation='nearest', cmap=cmap)
    plt.title(title)
    plt.colorbar()
    tick_marks = np.arange(len(classes))
    plt.xticks(tick_marks, classes, rotation=45)
    plt.yticks(tick_marks, classes)

    fmt = '.2f' if normalize else 'd'
    thresh = cm.max() / 2.
    for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
        plt.text(j, i, format(cm[i, j], fmt),
                 horizontalalignment="center",
                 color="white" if cm[i, j] > thresh else "black")

    plt.ylabel('True label')
    plt.xlabel('Predicted label')
    plt.tight_layout()


def call_precision_recall_curve(truelabel,predictedlabel, actualprobs, ratio,val):
    
    output = open(val+"output_at_ratio_{}.txt".format(ratio), "a")
    # print(" === Word vector dimension is 20 ===", file=output)
    precision, recall, _ = precision_recall_curve(truelabel,actualprobs)
    au = auc(recall, precision)
    print("Area under graph "+str(au))
    print("Area under graph "+str(au), file=output)
    print("-------------------------------------------------")
    print("-------------------------------------------------", file=output)
    rec_score = recall_score(truelabel,predictedlabel,pos_label=1,average='binary')
    precise_score = precision_score(truelabel,predictedlabel,pos_label=1,average='binary')
    f1 = f1_score(truelabel,predictedlabel,pos_label=1, average='binary')
    print("Precision for Malicious apps "+str(precise_score))
    print("Precision for Malicious apps "+str(precise_score), file=output)
    print("Recall for Malicious apps "+str(rec_score))
    print("Recall for Malicious apps "+str(rec_score), file=output)
    print("F1-score for Malicious apps  " + str(f1))
    print("F1-score for Malicious apps  " + str(f1), file=output)
    print("-------------------------------------------------")
    print("-------------------------------------------------", file=output)
    rec_score = recall_score(truelabel,predictedlabel,pos_label=0,average='binary')
    precise_score = precision_score(truelabel,predictedlabel,pos_label=0,average='binary')
    f1 = f1_score(truelabel,predictedlabel,pos_label=0, average='binary')
    print("Precision for Benign apps "+str(precise_score))
    print("Precision for Benign apps "+str(precise_score), file=output)
    print("Recall for Benign apps "+str(rec_score))
    print("Recall for Benign apps "+str(rec_score), file=output)
    print("F1-score for Benign apps  " + str(f1))
    print("F1-score for Benign apps  " + str(f1), file=output)
    print()
    print("\n", file=output)
    output.close()
    
    #plot the no-skill line too
    positive_cases = sum(truelabel)/len(truelabel)
    plt.plot([0, 1], [positive_cases, positive_cases], linestyle='--')
    
    # In matplotlib < 1.5, plt.fill_between does not have a 'step' argument
    step_kwargs = ({'step': 'post'}
                   if 'step' in signature(plt.fill_between).parameters
                   else {})
    plt.step(recall, precision, color='b', alpha=0.2,
             where='post')
    plt.fill_between(recall, precision, alpha=0.2, color='b', **step_kwargs)

    plt.xlabel('Recall')
    plt.ylabel('Precision')
    plt.ylim([0.0, 1.05])
    plt.xlim([0.0, 1.0])
    plt.title('Precision-Recall curve')
    

def plot_ROC_curve(truelabel, actualprobs,val=''):
    false_positive_rate, true_positive_rate, threshold = roc_curve(truelabel, actualprobs)
    roc_auc = auc(false_positive_rate, true_positive_rate)
    #roc_auc2 = roc_auc_score(truelabel, actualprobs)
    print(val+"Area under ROC: {}".format(roc_auc))

    plt.title('Receiver Operating Characteristic')
    plt.plot(false_positive_rate, true_positive_rate, 'b', label = 'auc_ROC = %0.4f' % roc_auc)
    plt.legend(loc = 'lower right')
    plt.plot([0, 1], [0, 1], '--', c='orange')
    plt.xlim([0, 1])
    plt.ylim([0, 1.05])
    plt.ylabel('True Positive Rate')
    plt.xlabel('False Positive Rate')


def plot_prediction_accuracy(true_label,predict_labels, actrual_probs, ratio, epoch, val=''):
    #Get confusion matrix
    fig = plt.figure()
    cmatrix = confusion_matrix(true_label,predict_labels,labels=[1,0])
    plot_confusion_matrix(ratio, cmatrix, classes=['Malicious','Benign'],title='Confusion matrix',val=val)
    figname = val+"CapsGNN-Cmatrix_at_ratio_{}_epoch{}".format(ratio, epoch)
    plt.savefig(save_fig_path +figname + ".png")
    plt.close(fig)

    # Get Precision-recall curve
    fig2 = plt.figure()
    print("Actual prediction for malicious apps "+val+':')
    call_precision_recall_curve(np.asarray(true_label),np.asarray(predict_labels), np.asarray(actrual_probs), ratio,val)
    figname = val+"capsgnn_precision_recall_curve_at_ratio_{}_epoch{}".format(ratio, epoch)
    plt.savefig(save_fig_path + figname + ".png")
    plt.close(fig2)

    # Get ROC curve
    fig3 = plt.figure()
    plot_ROC_curve(np.asarray(true_label), np.asarray(actrual_probs),val)
    figname = val+"capsgnn_ROC_curve_at_ratio_{}_epoch{}".format(ratio, epoch)
    plt.savefig(save_fig_path + figname + ".png")
    plt.close(fig3)

