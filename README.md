# QLoRA_RLHF

This repository contains code to fine-tune a Llama-7B-Uncensored model using the Vicuna 70k dataset using Quantised Low Rank Adapations (LoRA).

The Vicuna 70k dataset is a collection of user-generated conversations that were gathered from ShareGPT.com. The dataset contains a variety of topics, including casual conversation, storytelling, and problem-solving.

Quantised Low Rank Adapations (LoRA) is a technique for reducing the size of a large language model while maintaining its performance. LoRA works by quantizing the model's parameters and then applying low-rank approximations to the quantized parameters.

This repository provides a step-by-step guide to fine-tuning a Llama-7B-Uncensored model using the Vicuna 70k dataset using LoRA. The guide also includes instructions on how to evaluate the fine-tuned model.



python train.py configs/open_llama_7b_qlora_uncensored.yaml
