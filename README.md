# project4
## Introduction
There are many problems in scientific and engineering computing when you want to multiply arrays of numbers together: C[i] = A[i] * B[i], or when you want to multiply arrays of numbers together and add up all the multiplies to produce a single sum (Fourier transformation, convolution, autocorrelation, etc.): sum = ΣA[i]*B[i]

This project is to test array multiplication and multiplication/reduction using usual C/C++ programming and SIMD.

**For the "control groups" benchmarks, do not use OpenMP parallel for-loops. Just use straight C/C++ for-loops. In the non-extra-credit part of this project, we will only use OpenMP for the timing.**

## Requirements
1. Use the supplied SIMD SSE assembly language code to run an array multiplication timing experiment. Run the same experiment a second time using your own C/C++ array multiplication code.
2. Use the supplied SIMD SSE assembly language code to run an array multiplication/reduction timing experiment. Run the same experiment a second time using your own C/C++ array multiplication/reduction code.
3. Use different array sizes from 1K to 8M. The choice of in-between values is up to you, but pick enough values that will make for a good graph.
4. Run each array-size test a certain number of tries. Use the peak value for the performance that you record.
5. We will not be graphing performance (e.g., megamults/sec) -- we will be graphing SpeedUp.
6. For the C[i] = A[i] * B[i] experiment, create a table and a graph showing SSE/Non-SSE speed-up as a function of array size. Speedup in this case will be (P = Performance, T = Elapsed Time):
```
S = Psse/Pnon-sse = Tnon-sse/Tsse
```

7. For the sum = ΣA[i]*B[i] experiment, create a table and a graph showing SSE/Non-SSE speed-up as a function of array size. Speedup in this case will be (P = Performance, T = Elapsed Time):
```
S = Psse/Pnon-sse = Tnon-sse/Tsse
```

8. This would normally be 2 graphs with one curve each. If you want, you can also do this as one graph with 2 curves. But, somehow, you need to end up graphing two curves.
9. **Note: this is not a multithreading assignment, so you don't need to worry about a NUMT. Don't use any OpenMP-isms except for getting the timing.**
10. The Y-axis performance units in this case will be "Speed-Up", i.e., dimensionless. Don't use any units that involve xxx/second.
11. Parallel Fraction doesn't apply to SIMD parallelism, so don't compute one.
12. Your commentary write-up (turned in as a PDF file) should tell us:
  1. What machine you ran this on
  2. Show the 2 tables of performances for each array size and the corresponding speedups
  3. Show the graphs (or graph) of SIMD/non-SIMD speedup versus array size (either one graph with two curves, or two graphs each with one curve)
  4. What patterns are you seeing in the speedups?
  5. Are they consistent across a variety of array sizes?
  6. Why or why not, do you think?

## SSE SIMD code:
- Find starter code in the file: all04.cpp.
- **Note that you are linking in the OpenMP library only because we are using it for timing.**
- **Because this code uses assembly language, this code is not portable. I know for sure it works on flip. I know for sure it works on rabbit. It will not work in Visual Studio. You are welcome to try it other places, but there are no guarantees.**
- You can run the tests one-at-a-time, or you can script them by making the array size a #define that you set from outside the program.

## Warning!
**Do not use any optimization flags when compiling this code. It jumbles up the use of the registers.
Do not insert any printf's in the SSE code. It jumbles up the use of the registers.**

## Extra Credit: Combining SIMD with OpenMP
Combine multithreading and SIMD in a single test. In this case, you will vary both the array size and the number of threads (NUMT). Show your table of performances. Produce a graph similar to the one on Slide #21 of the SIMD Vector notes, using your numbers. Add a brief discussion of what your curves are showing and why you think it is working this way.

## Grading:
Feature | Points
-|-
Table of Array Multiply performances and speedups | 10
Graph of Array Multiply speedupe | 10
Table of Array Multiply/Reduction performances and speedups | 10
Graph of Array Multiply/Reduction speedup curve | 10
Commentary | 20
Extra Credit | +5
**Potential Total** | **65**
