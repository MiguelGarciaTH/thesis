reset
set term postscript eps enhanced black font "Arial,24" linewidth 2

set size 1.6,.6


set ylabel "Latency (msecs)"

set xlabel "Throughput (msg/sec)"
fig="latencyVSthroughput"
set output fig.'.eps'

set xrange [0:11500]
set yrange [0:1200]

set xtics 0,2000,16000 nomirror
set ytics 0,200,1200 nomirror
set ytics nomirror


set rmargin 0
set tmargin .6
set bmargin 3
set lmargin 9

set x2tics ("" 100, "" 500, "" 1000, "" 5000, "" 8000, "" 9000, "" 10000, "" 11000) font 'Helvetica,24' #


set style line 1 lc rgb '#000000' lt 1 lw 2 pt 1 ps 2
set style line 2 lc rgb '#AA0000' lt 2 lw 2 pt 2 ps 2
set style line 4 lc rgb '#8E2323' lt 4 lw 2 pt 4 ps 2
set style line 5 lc rgb '#1874CD' lt 5 lw 2 pt 5 ps 2


set key inside l top vertical Left reverse noenhanced autotitles columnhead nobox

set multiplot
plot	"scatter100.dat" using 1:2 title '100bytes'  with linespoints ls 1, \
	"scatter500.dat" using 1:2 title '500bytes'  with linespoints ls 3, \
	"scatter1000.dat" using 1:2 title '1kbytes'  with linespoints ls 5,

# === small plot ===
set origin 0.5,0.35
set size .6,.04


set border linecolor rgbcolor "black"
set key textcolor rgbcolor "black"
set label 3 "zoom in" at 4500,65,4 right font 'Helvetica,20'
set obj 1 rectangle behind from screen 0.2 to screen 0.07
set obj 1 fillstyle solid 1.0 fillcolor rgbcolor "white"
set style line 101 lc rgb '#808080' lt 1 lw 1
set border front ls 101
set xrange [0:7000]
set yrange [0:50]
set ytics 0,50,100 nomirror font 'Helvetica,20' textcolor "black"
set xtics 0,7000,7000 nomirror font 'Helvetica,20' textcolor "black"
unset xlabel
#unset xtics
set ylabel
unset key
plot "scatter100-zoom.dat" using 1:2 title '100bytes' with linespoints ls 1, \
			"scatter500-zoom.dat" using 1:2 title '500bytes' with linespoints ls 3, \
			"scatter1000-zoom.dat" using 1:2 title '1Kbytes' with linespoints ls 5

!epstopdf *.eps;
!rm *.eps
