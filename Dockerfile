# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-image-saver@1.16.0
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2511102355
RUN comfy node install --exit-on-fail efficiency-nodes-comfyui@1.0.8
RUN comfy node install --exit-on-fail ComfyLiterals
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.1.9
RUN comfy node install --exit-on-fail skimmed_cfg@1.0.0
RUN comfy node install --exit-on-fail comfyui_essentials@1.1.0
RUN comfy node install --exit-on-fail comfyui-custom-scripts@1.2.5
RUN comfy node install --exit-on-fail comfyui-impact-pack@8.25.1

# download models into comfyui
RUN comfy model download --url https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth --relative-path models/upscale_models --filename RealESRGAN_x2.pth
# RUN # Could not find URL for pony/ftasticVAE_v10.safetensors
# RUN # Could not find URL for Pony/realistic/cyberrealisticPony_v141.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
