reset
set term postscript eps enhanced color font "Arial,6"

set size 0.5,0.13

set xlabel "Time (secs)" offset 0,0.5,0
set ylabel "Throughput \n (ops/sec)" offset 1.5,-1,0
set grid ytics mytics


set tmargin 1.4
set bmargin 2.4
set rmargin 0
set lmargin 7

set border lw .2

set ytic 0,3000,12000
set xtic 0,20,200
set yrange [0:13000]
#set xrange [0:205]
unset key 

set ytics ("12k" 12000, "9k" 9000, "6k" 6000,  "3k" 3000, "0" 0 )
set tics scale 0
set style line 1 lc black lt 1 pi 0 pt 4 lw 1 ps 0

set style arrow 4 head filled size screen 0.03,15 ls 2

set label "Ubuntu 16.04 joined" at 88,14000 center font "Arial,6"
set label "OpenSuse 42.1 removed" at 137,14000 center font "Arial,6"

set label "State\nCheckpoint" at 65,8100 center font "Arial,6"
set arrow 4 from 65,4500 to 65,0 lw 0.3 head back filled

set label "State Checkpoint" at 145,5700 center font "Arial,6"
set arrow 3 from 146,4500 to 146,0 lw 0.3 head back filled


set label "Boot time\n(background)" at 50,12000 center font "Arial,6"
set object 2 rect from 35, graph 0 to 75, graph 1
set object 2 back clip lw 1.0 dashtype solid fc lt -1 fillstyle solid 0.03 noborder
set arrow from 35, graph 0 to 35, graph 1 nohead lw 0.1

set label "State transfer" at 92,11000 center font "Arial,6"
set object 1 rect from 75, graph 0 to 110, graph 1
set object 1 back clip lw 1.0 dashtype solid fc  lt -1 fillstyle solid 0.09 noborder
set arrow from 75, graph 0 to 75, graph 1 nohead lw 0.5
set arrow from 110, graph 0 to 110, graph 1 nohead lw 0.5

set label "Syn-\nchronized" at 115,11000 center font "Arial,4"
set object 3 rect from 110, graph 0 to 120, graph 1
set object 3 back clip lw 1.0 dashtype solid fc  lt -1 fillstyle solid 0.2 noborder
#set arrow from 110, graph 0 to 73, graph 1 nohead lw 0.5
set arrow from 120, graph 0 to 120, graph 1 nohead lw 0.5



#f(x) = mean_y
#fit f(x) '../reconfiguration_bm/data.dat' u 1:2 via mean_y
#stddev_y = sqrt(FIT_WSSR / (FIT_NDF + 1 ))

#f(x) = mean_y2
#fit f(x) 'data.dat' u 1:2 via mean_y2
#stddev_y2 = sqrt(FIT_WSSR / (FIT_NDF + 1 ))


set out "reconfiguration_vm.eps" 
plot 'data.dat' using 1:2 notitle with linespoints ls 1 #mean_y w l lt 2, mean_y2 w l lt 3,


!epstopdf *.eps;
!rm *.eps
