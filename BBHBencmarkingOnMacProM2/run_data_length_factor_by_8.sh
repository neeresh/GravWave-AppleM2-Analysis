#!/bin/bash -e
  
echo -e "\\n\\n>> [`date`] Running pycbc inspiral $1:$3 with $2 threads"
python -m cProfile -o benchmarking_outputs/profile-$1-$2-$3.out `which pycbc_inspiral` \
--frame-files DATA_FILE.gwf \
--sample-rate 2048 \
--sgchisq-snr-threshold 6.0 \
--sgchisq-locations "mtotal>30:20-15,20-30,20-45,20-60,20-75,20-90,20-105,20-120" \
--segment-end-pad 16 \
--low-frequency-cutoff 10 \
--pad-data 2 \
--cluster-window 1 \
--cluster-function symmetric \
--injection-window 4.5 \
--segment-start-pad 112 \
--psd-segment-stride 8 \
--psd-inverse-length 16 \
--filter-inj-only \
--psd-segment-length 16 \
--snr-threshold 5.5 \
--segment-length 512 \
--autogating-width 0.125 \
--autogating-threshold 25 \
--autogating-cluster 0.25 \
--autogating-taper 0.125 \
--newsnr-threshold 4.0 \
--psd-estimation median \
--strain-high-pass 9 \
--order -1 \
--chisq-bins "max(0.72*get_freq('fSEOBNRv4Peak', params.mass1, params.mass2, params.spin1z, params.spin2z)**0.7, 11)" \
--channel-name H1:LOSC-STRAIN \
--gps-start-time 1126259078 \
--gps-end-time 1126265222 \
--output H1-INSPIRAL_$4_$1_$2_$3-OUT.hdf \
--approximant "IMRPhenomD"  \
--fft-backends $1 \
--processing-scheme cpu:$2 \
--fftw-threads-backend $3 \
--bank-file bbh.hdf \
--verbose 2> inspiral_$4_$1_$2_$3.log
