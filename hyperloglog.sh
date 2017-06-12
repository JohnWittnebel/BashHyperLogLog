#!/bin/bash
# Uses the Hyperloglog algorithm to give an estimate on the number of distinct elements in a stream,
# using SHA256 as a 'random hashing function'.
#
# Reads stream input from stdin.

max=0
function count_zeroes()
{
  curpos=0
  while [ ${binary:$curpos:1} == "1" ]; do
    curpos=$(($curpos+1))
  done
  echo $curpos
}

read input
while [ "$input" != "" ]
do
  hashed=$(echo $input | sed 's/://g' | shasum -a 256)
  formatted=$(echo "${hashed%% *}")
  formatted=$(echo $formatted | tr /a-f/ /A-F/)
  binary=$(echo "obase=2; ibase=16; $formatted" | bc)
  binary=$(echo $binary | sed 's/\ //g' | sed 's/\\//g')
  cur=$(count_zeroes)
  if [ $cur -ge $max ]; then
    max=$cur
  fi
  read input
done
echo $((2**$max))
