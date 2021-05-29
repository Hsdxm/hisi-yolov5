conda create --name caffe python=3.7.9 -y
source activate
conda activate caffe
conda install -y caffe  openblas 
pip install torch==1.7.0 torchvision==0.8.0 onnx
rm -rf ${CONDA_PREFIX}/include/caffe  ${CONDA_PREFIX}/lib/libcaffe*
cd caffe-master
make -j8
make pycaffe -j8

cd ..
git clone https://github.com/Wulingtian/yolov5_onnx2caffe.git
cp -rfv convertCaffe.py   yolov5_onnx2caffe/
cp -rfv _operators.py  yolov5_onnx2caffe/onnx2caffe/
cd yolov5_onnx2caffe
python convertCaffe.py
