//Tencent is pleased to support the open source community by making FeatherCNN available.

//Copyright (C) 2018 THL A29 Limited, a Tencent company. All rights reserved.

//Licensed under the BSD 3-Clause License (the "License"); you may not use this file except 
//in compliance with the License. You may obtain a copy of the License at
//
//https://opensource.org/licenses/BSD-3-Clause
//
//Unless required by applicable law or agreed to in writing, software distributed 
//under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
//CONDITIONS OF ANY KIND, either express or implied. See the License for the 
//specific language governing permissions and limitations under the License.

#include "net.h"
#include <vector>
#include <algorithm>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <string.h>
#include <iostream>
#include <fstream>

void SplitString(const std::string &input, const std::string &delim, std::vector<std::string> &parts)
{
	for(char *s=strtok((char *)input.data(), (char *)delim.data()); s; s=strtok(NULL, (char *)delim.data()))
	{
		if (s != NULL)
		{
			parts.push_back(s);
		}
	}
}
/*
void PrintBlobData(ncnn::Net *forward_net, std::string blob_name, int n)
{
	size_t data_size;
	forward_net->GetBlobDataSize(&data_size, blob_name);
	float *arr = (float*) malloc(sizeof(float) * data_size);
	forward_net->ExtractBlob(arr, blob_name);
	size_t len = 0;
	if(n <= 0)
		len = data_size;
	else
		len = n;

	for(int i = 0; i < len; ++i)
	{
		printf("%f\t", arr[i]);
	}
	printf("\n");
	free(arr);
}
*/
void test(std::string bin_path, std::string param_path, std::string data_path, int loop, int num_threads)
{
	printf("++++++Start Loader++++++\n");
	ncnn::Net fnet;
	printf("%s\n", param_path.c_str());
	printf("%s\n", bin_path.c_str());
	fnet.load_param(param_path.c_str());
	fnet.load_model(bin_path.c_str());

	size_t input_size = 224 * 224 * 3 ; //TODO
	float *input = new float[input_size];
	std::ifstream in(data_path.c_str());
	
	std::string line;
	std::string delim = "\t\r\n <>()";
	size_t count = 0;
	double time  = 0;

	while (getline(in,line))
	{
		for(int i = 0; i < 1; ++i){
			std::vector<std::string> parts;
			SplitString(line, delim, parts);
			printf("input size %ld parts size %ld\n", input_size, parts.size());
			for (size_t i = 0; i != parts.size(); ++i)
			{
				input[i] = atof(parts[i].c_str()); //TODO: acc loss
			}
			ncnn::Mat      inputMat = ncnn::Mat(224,224,3, input);
			for(int i = 0; i < loop; ++i)
			{
				timespec tpstart, tpend;
				ncnn::Extractor ex = fnet.create_extractor();
		       		ex.set_light_mode(true);
				ex.set_num_threads((int)num_threads);
				ncnn::Mat outputMat;
				if(ex.input("data", inputMat)<0){
					puts("data error");
					return;
				}
				clock_gettime(CLOCK_MONOTONIC, &tpstart);
				if(ex.extract("prob", outputMat)<0)
					puts("Extract failed.");
				clock_gettime(CLOCK_MONOTONIC, &tpend);
				double timedif = 1000000.0 *(tpend.tv_sec-tpstart.tv_sec)+(tpend.tv_nsec-tpstart.tv_nsec)/1000.0;
				printf("----------Prediction costs %lfms\n", timedif / 1000.0);
				if(i > 0)
					time += timedif;
			}
			printf("--------Average runtime %lfmsi------\n", time / (loop - 1)/1000.0);
			//PrintBlobData(&forward_net, "fc6", 0);
		}
		break; //TODO
	}
	if (input)
	{
		delete [] input;
		input = NULL;
	}
}

int main(int argc, char* argv[])
{
	if(argc == 6)
	{
		size_t num_threads = atoi(argv[5]);
		size_t loop = atoi(argv[4]);
		test(std::string(argv[1]), std::string(argv[2]),std::string(argv[3]), loop, num_threads);
	}
	else
	{
		fprintf(stderr, "Usage: ./testRun [bin] [param] [data] [loop_count] [num_threads]\n");
		return 0;
	}
	return 0;
}
