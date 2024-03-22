## Introduction

This project is part of the Ecotrain project, which aims to develop an AI capable of interpreting image content captured by a camera at the front of the train. The Ecotrain project’s ambition is to launch France’s inaugural autonomous rail shuttle service by 2026.

In this research, our initial focus is on the triplets derived from the scene graph generation models, consisting of subject-relation-object, where each subject and object is associated with its bounding box. We first create a fundamental risk analysis model based on these triplets to demonstrate the feasibility of the overall method. 

## Environment Setup

[**RelTR: Relation Transformer for Scene Graph Generation**](https://github.com/yrcong/RelTR)

```
conda create -n reltr python=3.6
conda activate reltr
conda install pytorch==1.6.0 torchvision==0.7.0 cudatoolkit=10.1 -c pytorch
conda install matplotlib
```

[**Scene Graph Benchmark:**](https://github.com/KaihuaTang/Scene-Graph-Benchmark.pytorch)
Follow these [**instructions**](https://github.com/KaihuaTang/Scene-Graph-Benchmark.pytorch/blob/master/INSTALL.md) step by step to set up.

Then the command for the inference of custom images I used:
```
CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --master_port 10027 --nproc_per_node=1 tools/relation_test_net.py --config-file "configs/e2e_relation_X_101_32_8_FPN_1x.yaml" MODEL.ROI_RELATION_HEAD.USE_GT_BOX False MODEL.ROI_RELATION_HEAD.USE_GT_OBJECT_LABEL False MODEL.ROI_RELATION_HEAD.PREDICTOR CausalAnalysisPredictor MODEL.ROI_RELATION_HEAD.CAUSAL.EFFECT_TYPE TDE MODEL.ROI_RELATION_HEAD.CAUSAL.FUSION_TYPE sum MODEL.ROI_RELATION_HEAD.CAUSAL.CONTEXT_LAYER motifs TEST.IMS_PER_BATCH 1 DTYPE "float16" GLOVE_DIR /root/RP/glove MODEL.PRETRAINED_DETECTOR_CKPT /root/RP/causal_motif_sgdet OUTPUT_DIR /root/RP/causal_motif_sgdet TEST.CUSTUM_EVAL True TEST.CUSTUM_PATH /root/autodl-tmp/rs19_val_imgs_2 DETECTED_SGG_DIR /root/autodl-tmp/json_outputs_2
```
Replace the appropriate PATH with yours.


## Large files required

This [**link**](https://drive.google.com/drive/folders/1QhIkoua0EQTNxXU12htOwc00Ns_zwUsU?usp=sharing).

## My Report and presentation slides 

This [**link**](https://drive.google.com/drive/folders/1ispOIRBvPuf-7JkaCTuz-Z3xcKiqYyjH?usp=sharing).
