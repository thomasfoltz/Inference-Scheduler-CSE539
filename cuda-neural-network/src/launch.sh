#!/bin/bash

# Compile the CUDA code
nvcc test.cu neural_network.cu coordinates_dataset.cu nn_utils/*.cu layers/*.cu -o a.out

# Define the stream sizes and batch sizes
stream_sizes=(1 2 4)
batch_sizes=(1 4 16 64 256 1024)

# Iterate over the stream sizes
for stream_size in "${stream_sizes[@]}"; do
    # Iterate over the batch sizes
    for batch_size in "${batch_sizes[@]}"; do
        # Define the name for the current sweep
        sweep_name="stream_${stream_size}_batch_${batch_size}"
        # Run the executable with stream size and batch size as arguments
        nsys profile -o $sweep_name ./a.out $stream_size $batch_size
    done
done