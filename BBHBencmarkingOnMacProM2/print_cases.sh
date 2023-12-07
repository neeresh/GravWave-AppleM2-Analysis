file_names=("run_data_length_factor_by_4.sh" "run_data_length_factor_by_8.sh" "run_data_length_factor_by_12.sh")
backends=("fftw" "numpy")
thread_counts=("1" "2" "4" "8" "16" "32")
threading_types=("openmp" "unthreaded" "pthreads")

for file in "${file_names[@]}"; do
  for backend in "${backends[@]}"; do
    for count in "${thread_counts[@]}"; do
      for type in "${threading_types[@]}"; do
        echo "$file" "$backend" "$count" "$type" "$file"
      done
    done
  done
done

# Wait for all background processes to finish
wait
