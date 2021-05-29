conda create --name  yolov5 python=3.7.9 -y
source activate
conda activate yolov5
pip install -r requirements.txt

git clone https://github.com/ultralytics/yolov5.git
cd yolov5
git reset --hard 69be8e738

python models/export.py --weights ../last.pt
python -m onnxsim ../last.onnx  ../simple.onnx
