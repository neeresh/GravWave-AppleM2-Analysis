file_names=("run_data_length_factor_by_8.sh")
backends=("numpy")
thread_counts=("8" "16")
threading_types=("pthreads")

for file in "${file_names[@]}"; do
  for backend in "${backends[@]}"; do
    for count in "${thread_counts[@]}"; do
      for type in "${threading_types[@]}"; do
        echo "File: $file, Backend: $backend, Thread Count: $count, Threading Type: $type" >> execution_times.txt
        (time bash "$file" "$backend" "$count" "$type") 2>&1 | grep real >> execution_times.txt
      done
    done
  done
done
