# cd build
# rm -rf CMake* bin third_party/ Makefile *.cmake
# cmake -DCMAKE_TOOLCHAIN_FILE=../riscv-toolchain.cmake -DCMAKE_BUILD_TYPE=release .. \
#   -DFFMPEG_DIR=/root/FFmpeg-n6.1.2/FFmpeg/ffmpeg_build
# make -j8

cd build_x86_64
rm -rf CMake* bin third_party/ Makefile *.cmake
cmake  -DCMAKE_BUILD_TYPE=release .. -DEN_X86=ON -DONNXRUNTIME_DIR=/root/onnxruntime-linux-x64-1.14.0 \
  -DFFMPEG_DIR=/root/ffmpeg-master-latest-linux64-gpl-shared
make -j8


# cd ..

# ./build/bin/funasr-onnx-offline \
# --model-dir ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/ \
# --vad-dir ~/.cache/modelscope/hub/models/iic/speech_fsmn_vad_zh-cn-16k-common-pytorch/ \
# --punc-dir ~/.cache/modelscope/hub/models/iic/punc_ct-transformer_cn-en-common-vocab471067-large/ \
# --wav-path ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/example/asr_example.wav

# strace -f -e openat 
qemu-riscv64 ./build/bin/funasr-onnx-offline \
	--vad-quant false --punc-quant false  --quantize false \
	--model-dir ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/ \
	--vad-dir ~/.cache/modelscope/hub/models/iic/speech_fsmn_vad_zh-cn-16k-common-pytorch/ \
	--punc-dir ~/.cache/modelscope/hub/models/iic/punc_ct-transformer_cn-en-common-vocab471067-large/ \
	--wav-path ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/example/asr_example.wav

qemu-riscv64 ./build/bin/funasr-onnx-offline \
--model-dir ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/ \
--wav-path ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/example/asr_example.wav

#  cat output.log | grep '\.so' | grep -v 'ENOENT' | awk -F'"' '{print $2}' | sort -u > so.log
# cat so.log | xargs -I '{}' cp -u '{}' libs_rv/
# export LD_LIBRARY_PATH=/root/test_funasr_0/libs_rv/

qemu-riscv64 ./build/bin/funasr-onnx-offline-vad \
--model-dir ~/.cache/modelscope/hub/models/iic/speech_fsmn_vad_zh-cn-16k-common-pytorch/ \
--wav-path ~/.cache/modelscope/hub/models/iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch/example/asr_example.wav