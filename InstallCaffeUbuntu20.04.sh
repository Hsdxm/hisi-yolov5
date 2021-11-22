 apt install -y vim git wget curl libgl1-mesa-glx openssh-server nfs-kernel-server nfs-common	\
 python3 python3-pip	\
 libcaffe-cpu-dev	\
 libopencv-dev	\
 libprotobuf-dev	\
 protobuf-compiler	\
 libgflags-dev	\
 libgoogle-glog-dev	\
 libopenblas-dev	\
 libhdf5-dev	\
 libleveldb-dev	\
 liblmdb-dev	\
 libsnappy-dev	\
 libboost-all-dev	

 pip install install/* scikit-image -i https://pypi.tuna.tsinghua.edu.cn/simple
 pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
 pip install --upgrade protobuf -i https://pypi.tuna.tsinghua.edu.cn/simple
