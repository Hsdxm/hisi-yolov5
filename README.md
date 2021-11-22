step 1: 编译caffe
	cd 01.caffe
	make clean
	make -j8
	make pycaffe

step 2: 转换pt模型为onnx
	cd  02.yolov5
	python3 export.py --weights ../04.last.pt --train  --simplify  --opset 10 --img-size 320 640
	输出：../04.last.onnx


step 3: 转换onnx模型到caffe
	cd 03.onnx2caffe
	python3 convertCaffe.py ../04.last.onnx  ../04.output/output.prototxt  ../04.output/output.caffemodel
	输出: ../04.output/output.prototxt ../04.output/output.caffemodel

step 4:
	删除prototxt文件中的3个reshape层和3个permute层
