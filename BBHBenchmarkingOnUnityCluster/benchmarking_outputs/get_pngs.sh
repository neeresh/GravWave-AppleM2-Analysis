#!/bin/bash

dot_out_files=(*.out)

echo "Converting .out files to .dot files"
for dot_file in "${dot_out_files[@]}"; do	
	gprof2dot $dot_file -f pstats > ${dot_file%.out}.dot
done

mv *.out dot_out_files/

dot_files=(*.dot)

echo "Converting .dot files to .png files"
for dot_file in "${dot_files[@]}"; do
	dot -Tpng $dot_file -o ${dot_file%.dot}.png
done

mv *.dot dot_dot_files/
