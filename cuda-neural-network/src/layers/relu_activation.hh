#pragma once

#include "nn_layer.hh"

class ReLUActivation : public NNLayer {
private:
	Matrix A;

	Matrix Z;
	Matrix dZ;

public:
	ReLUActivation(std::string name);
	~ReLUActivation();

	Matrix& forward(Matrix& Z, cudaStream_t stream=0);
	Matrix& backprop(Matrix& dA, float learning_rate = 0.01);
};
