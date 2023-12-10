echo -e "\\n\\n>> [`date`] Creating data file"
pycbc_condition_strain \
    --frame-type LOSC \
    --sample-rate 2048 \
    --pad-data 8 \
    --autogating-width 0.25 \
    --autogating-threshold 100 \
    --autogating-cluster 0.5 \
    --autogating-taper 0.25 \
    --strain-high-pass 10 \
    --channel-name H1:LOSC-STRAIN \
    --gps-start-time 1126258578 \
    --gps-end-time 1126274994 \
    --output-strain-file DATA_FILE.gwf \
