cd build
rm -rf CMake* bin third_party/ Makefile *.cmake
cmake -DCMAKE_TOOLCHAIN_FILE=../riscv-toolchain.cmake -DCMAKE_BUILD_TYPE=release .. \
  -DFFMPEG_DIR=/root/FFmpeg-n6.1.2/FFmpeg/ffmpeg_build
make -j8

# cd ..

# ./build/bin/funasr-onnx-offline \
# --model-dir ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/ \
# --vad-dir ~/.cache/modelscope/hub/models/iic/speech_fsmn_vad_zh-cn-16k-common-pytorch/ \
# --punc-dir ~/.cache/modelscope/hub/models/iic/punc_ct-transformer_cn-en-common-vocab471067-large/ \
# --wav-path ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/example/asr_example.wav

qemu-riscv64 ./build/bin/funasr-onnx-offline \
	--model-dir ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/ \
	--vad-dir ~/.cache/modelscope/hub/models/iic/speech_fsmn_vad_zh-cn-16k-common-pytorch/ \
	--punc-dir ~/.cache/modelscope/hub/models/iic/punc_ct-transformer_cn-en-common-vocab471067-large/ \
	--wav-path ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/example/asr_example.wav
