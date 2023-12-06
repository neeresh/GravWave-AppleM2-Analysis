#!/bin/bash

# Test pycbc inspiral by running over GW150914 with a limited template bank
echo -e "\\n\\n>> [`date`] Getting template bank"
wget -nv -nc https://github.com/gwastro/pycbc-config/raw/master/test/inspiral/SMALLER_BANK_FOR_GW150914.hdf

#echo -e "\\n\\n>> [`date`] Compressing template bank"
#pycbc_compress_bank \
#    --bank-file SMALLER_BANK_FOR_GW150914.hdf \
#    --output COMPRESSED_BANK.hdf \
#    --sample-rate 4096 \
#    --segment-length 256 \
#    --compression-algorithm mchirp \
#    --psd-model aLIGOZeroDetHighPower \
#    --low-frequency-cutoff 30 \
#    --approximant "SEOBNRv4_ROM"

echo -e "\\n\\n>> [`date`] Creating data file"
pycbc_condition_strain \
    --frame-type LOSC_STRAIN \
    --sample-rate 2048 \
    --pad-data 8 \
    --autogating-width 0.25 \
    --autogating-threshold 100 \
    --autogating-cluster 0.5 \
    --autogating-taper 0.25 \
    --strain-high-pass 10 \
    --channel-name H1:LOSC-STRAIN \
    --gps-start-time 1126258578 \
    --gps-end-time 1126259946 \
    --output-strain-file DATA_FILE.gwf \


`which pycbc_inspiral` \
--frame-files DATA_FILE.gwf \
--sample-rate 2048 \
--sgchisq-snr-threshold 6.0 \
--sgchisq-locations "mtotal>40:20-30,20-45,20-60,20-75,20-90,20-105,20-120" \
--segment-end-pad 16 \
--low-frequency-cutoff 30 \
--pad-data 8 \
--cluster-window 1 \
--cluster-function symmetric \
--injection-window 4.5 \
--segment-start-pad 112 \
--psd-segment-stride 8 \
--psd-inverse-length 16 \
--filter-inj-only \
--psd-segment-length 16 \
--snr-threshold 5.5 \
--segment-length 256 \
--autogating-width 0.25 \
--autogating-threshold 100 \
--autogating-cluster 0.5 \
--autogating-taper 0.25 \
--newsnr-threshold 5 \
--psd-estimation median \
--strain-high-pass 20 \
--order -1 \
--chisq-bins "1.75*(get_freq('fSEOBNRv2Peak',params.mass1,params.mass2,params.spin1z,params.spin2z)-60.)**0.5" \
--channel-name H1:LOSC-STRAIN \
--gps-start-time 1126259078 \
--gps-end-time 1126259846 \
--output H1-INSPIRAL.hdf \
--approximant "SPAtmplt:mtotal<4" "SEOBNRv4_ROM:mtotal<20" "SEOBNRv2_ROM_DoubleSpin:else" \
--bank-file SMALLER_BANK_FOR_GW150914.hdf  \
--verbose
