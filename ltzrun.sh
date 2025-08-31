# cd build
# rm -rf CMake* bin third_party/ Makefile *.cmake
# cmake -DCMAKE_TOOLCHAIN_FILE=../riscv-toolchain.cmake -DCMAKE_BUILD_TYPE=release .. \
#   -DFFMPEG_DIR=/root/FFmpeg-n6.1.2/FFmpeg/ffmpeg_build
# make -j8

cd build_x86_64
# rm -rf CMake* bin third_party/ Makefile *.cmake
cmake  -DCMAKE_BUILD_TYPE=debug .. -DEN_X86=ON -DONNXRUNTIME_DIR=/mnt/onnxruntime-linux-x64-1.14.0 \
  -DFFMPEG_DIR=/mnt/ffmpeg-master-latest-linux64-gpl-shared
# cmake  -DCMAKE_BUILD_TYPE=release .. -DEN_X86=ON -DONNXRUNTIME_DIR=/root/onnxruntime-linux-x64-1.14.0 \
#   -DFFMPEG_DIR=/root/ffmpeg-master-latest-linux64-gpl-shared
make -j
cd ../


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

./build_x86_64/bin/funasr-onnx-offline-vad \
--model-dir ../test_ltz/fsmn_vad/ \
--wav-path ../test_ltz/fsmn_vad/vad_example.wav
# ref result: 
# wav_default_id: [[70,2340],[2620,6200],[6480,23670],[23950,26250],[26780,28990],[29950,31430],[31750,37600],[38210,46900],[47310,49630],[49910,56460],[56740,59540],[59820,70450]]

./build_x86_64/bin/funasr-onnx-offline-punc \
--model-dir ../test_ltz/ct-transformer/ \
--txt-path ../test_ltz/ct-transformer/punc_example.txt
