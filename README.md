# BashHyperLogLog
A simple bash script implementation of the hyperloglog algorithm; a randomized algorithm which reads in an
input stream of n integers and outputs (with high probability within 1/2 to 2x the actual value) the number of distinct integers seen using only O(loglogn) space.

Note that this implementation uses SHA256 as a 'randomized hash function', when it is not. However, since
randomized hash functions dont truly exist, and SHA256 is believed to be collision resistant, it
should be suitable.
