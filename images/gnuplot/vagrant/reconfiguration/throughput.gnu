reset
set term postscript eps enhanced color font "Arial,6"

set size 0.5,0.1

set xlabel "Time (secs)" offset 0,0.5,0
set ylabel "Throughput \n (msg/sec)" offset 1.5,-1,0
set grid ytics mytics
set ytic 0,2000,7000

set tmargin 1.4
set bmargin 2.4
set rmargin 1.5
set lmargin 9

set border lw .2


set yrange [0:8000]
set xrange [0:400]
unset key 

set tics scale 0

set style line 99 linetype 1 linecolor rgb "#999999" lw 2 
set style line 1 lc rgb "#ff0000" lt 1 pi 0 pt 4 lw 2 ps 0

set label "FE26 (+)" at 70,9000
set arrow from 100, graph 0 to 100, graph 1 nohead
set arrow from 110, graph 0 to 110, graph 1 nohead
set label "UB17 (-)" at 115,1000 


set label "FE25 (+)" at 170,9000
set arrow from 200, graph 0 to 200, graph 1 nohead
set arrow from 210, graph 0 to 210, graph 1 nohead
set label "FE24 (-)" at 215,1000   


set label "DE8 (+)" at 270,9000
set arrow from 300, graph 0 to 300, graph 1 nohead
set arrow from 310, graph 0 to 310, graph 1 nohead
set label "OS42 (-)" at 315,1000   


set out "reconfiguration.eps" 
plot 'data.dat' using 1:2 notitle with linespoints ls 1


!epstopdf *.eps;
!rm *.eps
