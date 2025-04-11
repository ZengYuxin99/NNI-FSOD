# Near-boundary Noise Improved Few-shot Out-of-distribution Detection 

### Abstract
For machine learning models deployed in the open-world, the ability to detect out-of-distribution (OOD) data is crucial. Few-shot out-of-distribution detection (FSOD), which aims to quickly learn the ability to
recognize in-distribution (ID) samples and OOD data from a small number of training samples, has received much attention in recent years. Advanced FSOD methods improve OOD detection by performing prompt learning on
pre-trained multimodal models to quickly mine discriminative ID class knowledge. However, the models learned from “clean”training samples are less robust to test samples with background noise, and can easily misidentify ID data with background noise as OOD data, and vice versa. To tackle this problem, this paper proposes a Near-boundary Noise Improved Few-shot OOD Detection (NNI-FSOD) scheme. During training, NNI-FSOD
utilizes the powerful visual-text alignment capability of multimodal models to divide the image regions in the training samples into clean regions and noisy regions, and the noisy regions are used to tighten the distribution space of ID samples, so as to improve the OOD detection performance. During inference, NNI-FSOD further improves the ID classification and OOD detection performance of the model by complementing the knowledge of visual-textual class prototypes. Experimental results on multiple datasets demonstrate the remarkabe advantages of NNI-FSOD: on average, NNI-FSOD improves the FPR95 of the baseline method by 11.05%, the AUROC by 2.24%, and the ID ACC by 1.87%. Ultimately, NNI-FSOD outperforms the previous optimal method and establishes new state-of-the-art results.

### Mehotd
![Visualization_figure](figure/nni-fsod.png)
During training, NNI-FSOD utilizes the powerful visual-text alignment capability of multimodal models to divide the image regions in the training samples into clean regions and noisy regions, and the noisy regions are used to tighten the distribution space of ID samples, so as to improve the OOD detection performance. During inference, NNI-FSOD further improves the ID classification and OOD detection performance of the model by complementing the knowledge of visual-textual class prototypes.

### Datasets, Pretrained models
We use the same datasets and pre-training models as LoCoOp, please refer to：[LoCoOp](https://github.com/AtsuMiyai/LoCoOp)

### Training
```train
CUDA_VISIBLE_DEVICES=0 bash scripts/train.sh data imagenet vit_b16_ep50 end 16
```

### Inference 
```eval
CUDA_VISIBLE_DEVICES=0 bash scripts/eval.sh data imagenet vit_b16_ep50 1 output/imagenet/NNIFSOD/vit_b16_ep50_16shots/nctx16_cscFalse_ctpend/seed1
```

### Main results 
![Visualization_figure](figure/res1.png)
同先进算法的对比（w/ CLIP-B/16）

### Acknowledgment
This code base fully absorb the LoCoOp open source code library：[LoCoOp](https://github.com/AtsuMiyai/LoCoOp)。Heartfelt thanks to the authors of this paper!
