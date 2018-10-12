reset
set term postscript eps enhanced color font "Arial,6"

set size 0.5,0.13

set xlabel "Time (secs)" offset 0,0.5,0
set ylabel "Throughput\n(ops/sec)" offset 1.5,-1,0
set grid ytics mytics


set tmargin 1.4
set bmargin 2.4
set rmargin 0
set lmargin 7

set border lw .2

set ytic 0,3000,15000
set xtic 0,20,200
#set yrange [0:6000]
#set xrange [0:205]
unset key 

set ytics ("12k" 12000, "9k" 9000, "6k" 6000,  "3k" 3000, "0" 0 )

set tics scale 0
set style line 1 lc black lt 1 pi 0 pt 4 lw 1 ps 0

set style arrow 4 head filled size screen 0.03,15 ls 2

set label "State\nCheckpoint" at 56,8100 center font "Arial,6"
set arrow 3 from 62,5400 to 64,0 lw 0.3 head back filled

set label "State\nCheckpoint" at 142,8100 center font "Arial,6"
set arrow 4 from 147,5400 to 148,0 lw 0.3 head back filled

set label "Boot time approx. 2mins \n(background)" at 30,12000 center font "Arial,6"
set object 3 rect from 0, graph 0 to 73, graph 1
set object 3 back clip lw 1.0 dashtype solid fc lt -1 fillstyle solid 0.03 noborder
#set arrow from 35, graph 0 to 35, graph 1 nohead lw 0.1

set label "Ubuntu 14.04 joined" at 88,15000 center font "Arial,6"
set label "Ubuntu 14.04 removed" at 138,15000 center font "Arial,6"

set label "State transfer" at 87,12000 center font "Arial,6"
set object 1 rect from 73, graph 0 to 100, graph 1
set object 1 back clip lw 1.0 dashtype solid fc  lt -1 fillstyle solid 0.05 noborder
set arrow from 73, graph 0 to 73, graph 1 nohead lw 0.5
set arrow from 100, graph 0 to 100, graph 1 nohead lw 0.5

set label "Synchro-\nnized" at 110,12000 center font "Arial,6"
set object 2 rect from 100, graph 0 to 120, graph 1
set object 2 back clip lw 1.0 dashtype solid fc  lt -1 fillstyle solid 0.2 noborder
#set arrow from 73, graph 0 to 73, graph 1 nohead lw 0.5
set arrow from 120, graph 0 to 120, graph 1 nohead lw 0.5



set out "reconfiguration_bm.eps" 
plot 'data.dat' using 1:2 notitle with linespoints ls 1


!epstopdf *.eps;
!rm *.eps
