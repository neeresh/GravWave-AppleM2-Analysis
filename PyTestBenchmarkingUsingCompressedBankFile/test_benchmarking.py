#!/usr/bin/env python3

import pytest
import subprocess
import os

@pytest.mark.benchmark
@pytest.mark.parametrize("fft_backend", ['fftw', 'numpy'])
@pytest.mark.parametrize("processing_scheme", [1, 16])
@pytest.mark.parametrize("fftw_threads_backend", ['openmp', 'pthreads', 'unthreaded'])
def test_run_pycbc_inspiral(benchmark, fft_backend, processing_scheme, fftw_threads_backend):

    def run_pycbc_inspiral():
        subprocess.run([
            "pycbc_inspiral",
            "--frame-files", "DATA_FILE.gwf",
            "--sample-rate", "2048",
            "--sgchisq-snr-threshold", "6.0",
            "--sgchisq-locations", "mtotal>40:20-30,20-45,20-60,20-75,20-90,20-105,20-120",
            "--segment-end-pad", "16",
            "--low-frequency-cutoff", "30",
            "--pad-data", "8",
            "--cluster-window", "1",
            "--cluster-function", "symmetric",
            "--injection-window", "4.5",
            "--segment-start-pad", "112",
            "--psd-segment-stride", "8",
            "--psd-inverse-length", "16",
            "--filter-inj-only",
            "--psd-segment-length", "16",
            "--snr-threshold", "5.5",
            "--segment-length", "256",
            "--autogating-width", "0.25",
            "--autogating-threshold", "100",
            "--autogating-cluster", "0.5"
            "--autogating-taper", "0.25"
            "--newsnr-threshold", "5",
            "--psd-estimation", "median"
            "--strain-high-pass", "20"
            "--order", "-1",
            "--chisq-bins", "'1.75*(get_freq('fSEOBNRv2Peak',params.mass1,params.mass2,params.spin1z,params.spin2z)-60.)**0.5'",
            "--channel-name", "H1:LOSC-STRAIN",
            "--gps-start-time", "1126259078",
            "--gps-end-time", "1126259846",
            "--output", "H1-INSPIRAL_${}_${}_${}-OUT.hdf".format(fft_backend, processing_scheme, fftw_threads_backend),
            "--approximant", '"SPAtmplt:mtotal<4" "SEOBNRv4_ROM:mtotal<20" "SEOBNRv2_ROM_DoubleSpin:else"',
            "--fft-backends", "${}".format(fft_backend),
            "--processing-scheme", "cpu:${}".format(processing_scheme),
            "--fftw-threads-backend", "${}".format(fftw_threads_backend),
            "--use-compressed-waveforms",
            "--bank-file", "COMPRESSED_BANK.hdf"
        ])

    benchmark(run_pycbc_inspiral)
