# 看速度
./build-qjl/bin/llama-bench \
  -m /Users/hyhang/Desktop/model/Qwen_base/Qwen3.5-2B-Q8_0.gguf \
  -ngl 999 \
  --qjl-k 0,1 \
  -p 512 \
  -n 128

# 单独看decode吞吐
./build-qjl/bin/llama-bench \
  -m /Users/hyhang/Desktop/model/Qwen_base/Qwen3_1_7B_Q8_0.gguf \
  -ngl 999 \
  --qjl-k 0 \
  -p 0 \
  -n 256 \
  -r 1


./build-qjl/bin/llama-bench \
  -m /Users/hyhang/Desktop/model/Qwen_base/Qwen3_1_7B_Q8_0.gguf \
  -ngl 999 \
  --qjl-k 1 \
  -p 0 \
  -n 256 \
  -r 1



# 只看KV/显存占用

./build-qjl/bin/llama-cli \
  -m  /Users/hyhang/Desktop/model/Qwen_base/Qwen3_1_7B_Q8_0.gguf  \
  -ngl 999 \
  --qjl-k 0 \
  -p "Hi" \
  -n 8 2>&1 | grep -E "KV buffer size|K \\(|V \\(|qjl_k"

./build-qjl/bin/llama-cli \
  -m  /Users/hyhang/Desktop/model/Qwen_base/Qwen3_1_7B_Q8_0.gguf  \
  -ngl 999 \
  --qjl-k 1 \
  -p "Hi" \
  -n 8 2>&1 | grep -E "KV buffer size|K \\(|V \\(|qjl_k"
