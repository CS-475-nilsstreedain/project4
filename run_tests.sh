#!/bin/bash

# Create output file
OUTPUT_FILE="results.txt"
echo -e "Array Size\tNon-SIMD Mul (MM/s)\tSIMD Mul (MM/s)\tSpeedup\tNon-SIMD MulSum (MM/s)\tSIMD MulSum (MM/s)\tSpeedup" > $OUTPUT_FILE

# Array sizes to test (from 1K to 8M)
SIZES=(1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608)

for SIZE in "${SIZES[@]}"
do
    echo "Testing array size: $SIZE"
    g++ -fopenmp all04.cpp -o all04 -DARRAYSIZE=$SIZE
    RESULT=$(./all04 2>&1)
    echo -e "$RESULT" | sed 's/^[ \t]*//;s/[ \t]*$//' >> $OUTPUT_FILE
done

echo "Testing complete. Results saved to $OUTPUT_FILE"
