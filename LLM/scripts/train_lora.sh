export CUDA_VISIBLE_DEVICES=0

deepspeed --master_port 29501 graphedit/train/train_lora.py \
    --model_name_or_path ./vicuna_7b_v1.5_16k  \
    --lora_r 8 \
    --lora_alpha 16 \
    --lora_dropout 0.05 \
    --data_path ../GNN/datasets/pubmed/pubmed_template_sample.json \
    --output_dir ./Pubmed_model \
    --num_train_epochs 2 \
    --fp16 True \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --evaluation_strategy "steps" \
    --eval_steps 10000  \
    --save_strategy "steps" \
    --save_steps 10000 \
    --save_total_limit 1 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_strategy "steps" \
    --logging_steps 1 \
    --tf32 True \
    --model_max_length 2048 \
    --q_lora False \
    --deepspeed ./playground/deepspeed_config_s3.json \
    --gradient_checkpointing True \
    --flash_attn False \
    --rl 1
