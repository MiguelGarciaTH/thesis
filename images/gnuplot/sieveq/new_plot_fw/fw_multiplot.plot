reset
set term postscript eps enhanced color font "Arial,24"
set size 1,.5
set style fill solid 1.00 border 0
set linetype cycle 1

set out "fw.eps"

set boxwidth 1 absolute
set style histogram clustered gap 1 title textcolor lt -1
set style data histograms



set yrange [0:400]
set xlabel "Input Length (bytes)"  offset 0,0.5
set ylabel "Latency (msec)" offset 1.5

set ytics 0,100,400 nomirror


set rmargin 0
set tmargin 0.5
set bmargin 3.0
set lmargin 6.5



set grid ytics
set key inside l top vertical Left reverse enhanced autotitles columnhead nobox maxrows 2 samplen 1.5

plot 'baseline_10000.dat' using 2:xtic(1) t "Baseline" w histogram linecolor rgb "#ffffff",\
	'KMP_5_10000.dat' using 2:xtic(1) t "5 bytes" w histogram linecolor rgb "#cccccc", \
	'KMP_10_10000.dat' using 2:xtic(1) t "10 bytes" w histogram linecolor rgb "#666666",\
	'KMP_20_10000.dat' using 2:xtic(1) t "20 bytes" w histogram linecolor rgb "#000000",\


!epstopdf *.eps;
!rm *.eps
