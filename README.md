1、yolov5模型（阉割版）训练

	1）下载yolov5源码
		a、git clone https://github.com/ultralytics/yolov5.git
		b、git reset --hard 69be8e738
		
	2）安装yolov5训练环境
		a、conda create --name yolov5 python=3.7.9 -y
		b、conda activate yolov5
		c、修改requirements.txt，删除coremltools、onnx、scikit-learn前的”#“，增加一行“onnx-simplifier”
		d、pip install -r requirements.txt
		
	3）修改训练参数和模型结构
		a、修改data/coco.yaml文件中类别数目、类别名、train/test/val的路径，按照自己的项目规划修改
		b、修改models/yolov5s.yaml文件中类别数目
		c、修改models/yolov5s.yaml中的网络结构，将focus层修改为卷积层，并设置stride为2
		
	4）启动模型训练
		python train.py --data data/coco.yaml  --cfg models/yolov5s.yaml --weights ''  --batch-size 64 --img-size 416 --noautoanchor
		
	5）模型导出
		python models/export.py --weights weights/last.pt
		
	6）模型简化
		python -m onnxsim weights/last.onnx  weights/simple.onnx
		
	7）一键安装见:
		InstallYolov5TrainEnv.sh
	
2、模型转换

	1）caffe环境安装
		a、conda create --name caffe python=3.7.9 -y
		b、conda activate caffe
		c、conda install caffe  openblas
		d、pip install pytorch==1.7.0 torchvision=0.8.0
		e、rm -rf ${CONDA_PREFIX}/include/caffe  ${CONDA_PREFIX}/lib/libcaffe*
		f、cd caffe-master
		g、make -j8
		h、make pycaffe -j8
		
	2）onnx转caffe
		a、cd yolov5_onnx2caffe
		b、使用根目录下的convertCaffe.py和_operators.py替换项目中的对应文件，
		c、修改convertCaffe.py的caffe_root路径到caffe-master的绝对路径
		d、修改convertCaffe.py中的152--154行，分别对应转换前的简化onnx路径，输出的prototxt和caffemodel路径
		e、python convertCaffe.py
		f、提取prototxt和caffemodel
		g、删除prototxt中的reshape和permute层，各有三个，在文件尾部
		h、修改prototxt文件中的图像输入大小，默认640，在文件头部
		
	3）一键安装见：
		InstallCaffeEnv.sh

3、海思模型转换
	按照海思提供的指导文档进行转换

4、海思代码修改
	（海思的SVP代码中提供了yolov3的sample，我们只需要在这个基础上进行修改即可）
	修改【sample_svp_nnie_software.c】,参照【hisi】目录下的图片进行修改

5、附件文件说明
	提供的last.pt是10分类的检测模型，对应的anchor值为：[3,3, 5,5, 9,8, 7,13, 13,12, 20,16, 26,27, 48,42, 98,98]
	

邮箱: 744263061@qq.com
