# ncnn

[![License](https://img.shields.io/badge/license-BSD--3--Clause-blue.svg)](https://raw.githubusercontent.com/Tencent/ncnn/master/LICENSE.txt) 

尝试将ncnn移植到Raspberry 3平台上，并添加了aarch64平台的测试程序。
**在ubuntu18.04 aarch64 on Raspberry 3 上测试通过**

---

### 编译参数
以下命令将构建ncnn的在当前平台架构下的转换工具（在`/tools`中）已经相应算法库。
```
cmake .
make
```
以下命令将构建ncnn在aarch64下的测试工具（`/examples/test/`）和相应算法库。
```
cmake . -AARCH64=TRUE
make
```
---

### 简单测试

将caffe的模型文件转换为最新版本模型文件。
Under BVLC/caffe/tools:
```
upgrade_net_proto_binary v0_net_proto_file_in net_proto_file_out
upgrade_net_proto_text v0_net_text_file_in net_text_file_out
```
将caffe模型转换为ncnn模型。
Under neolinsu/tools/caffe:
```
./caffe2ncnn [caffeproto] [caffemodel] [ncnnproto] [ncnnbin] [quantizelevel]
```

在aarch64架构下运行测试程序：

```
./test [bin] [param] [data] [loop_count] [num_threads]
```
其中`[data]`指向一个符合相应规格的文本文件（因为仅用作测试，这里不考虑精度问题）。

程序将打印相应信息，例如：
```
ubuntu@ubuntu:~$ ./ncnn/examples/test_new /home/ubuntu/ncnn/googlenet.bin /home/ubuntu/ncnn/googlenet.param /home/ubuntu/data/input_3x224x224.txt 20 5
++++++Start Loader++++++
/home/ubuntu/ncnn/googlenet.param
/home/ubuntu/ncnn/googlenet.bin
input size 150528 parts size 150528
set thread num:5
----------Prediction costs 1276.576894ms
set thread num:5
----------Prediction costs 1169.101131ms
set thread num:5
----------Prediction costs 1266.502969ms
set thread num:5
----------Prediction costs 1260.915001ms
set thread num:5
----------Prediction costs 1169.742051ms
set thread num:5
----------Prediction costs 1274.627965ms
set thread num:5
----------Prediction costs 1248.053367ms
set thread num:5
----------Prediction costs 1200.244643ms
set thread num:5
----------Prediction costs 1271.981865ms
set thread num:5
----------Prediction costs 1275.631117ms
set thread num:5
----------Prediction costs 1155.791112ms
set thread num:5
----------Prediction costs 1241.949726ms
set thread num:5
----------Prediction costs 1186.102041ms
set thread num:5
----------Prediction costs 1267.109087ms
set thread num:5
----------Prediction costs 1256.827406ms
set thread num:5
----------Prediction costs 1173.538839ms
set thread num:5
----------Prediction costs 1245.658137ms
set thread num:5
----------Prediction costs 1251.786822ms
set thread num:5
----------Prediction costs 1190.789912ms
set thread num:5
----------Prediction costs 1263.887264ms
--------Average runtime 1230.012656msi------
```

