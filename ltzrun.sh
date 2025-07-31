./build/bin/funasr-onnx-offline --model-dir ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/ \
--vad-dir ~/.cache/modelscope/hub/models/iic/speech_fsmn_vad_zh-cn-16k-common-pytorch/ \
--punc-dir ~/.cache/modelscope/hub/models/iic/punc_ct-transformer_cn-en-common-vocab471067-large/ \
--wav-path ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/example/asr_example.wav
