from funasr import AutoModel

model = AutoModel(model="fsmn-vad", device="cpu") # ct-punc, fsmn-vad, paraformer

res = model.export(quantize=True)

# # pip3 install -U funasr-onnx
# from funasr_onnx import Paraformer
# # model_dir = "iic/speech_paraformer-large_asr_nat-zh-cn-16k-common-vocab8404-pytorch"
# model_dir = "iic/speech_paraformer-large-vad-punc_asr_nat-zh-cn-16k-common-vocab8404-pytorch"
# model = Paraformer(model_dir, batch_size=1, quantize=True)

# # wav_path = ['cpp_onnx/wave/asr_example.wav']
# wav_path = ['../sherpa-ncnn/sherpa-ncnn-streaming-zipformer-zh-14M-2023-02-23/test_wavs/0.wav']

# result = model(wav_path)
# print(result)