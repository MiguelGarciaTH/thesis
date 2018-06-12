#set encoding iso_8859_1
#set term postscript portrait 10 enhanced monochrome font 'Helvetica,14' linewidth 2

reset
fontsize = 42
set term postscript enhanced eps fontsize solid
set size 1.2,1.

set log y
set ylabel "Latency (msec)"
set xlabel "Time (secs)"
set rmargin 4
set yrange [1:10000]
set xrange [0:200]  
set xtics nomirror #rotate by -45

#set x2tics ("" 50, "" 60, "" 100, "" 114, "" 150, "" 161, "" 200, "" 210) 

#set label "rejuvenations" at 102,28000 font "Arial,21,bold" 
#set label "r3" at 52,15000 font "Arial,21,bold" 
#set label "r2" at 102,15000 font "Arial,21,bold" 
#set label "r1" at 152,15000 font "Arial,21,bold" 
#set label "r0 (leader)" at 202,15000 font "Arial,21,bold" 

set grid back x2tics lw 4

unset key

set output 'latency.eps' 
plot "client.latency" using ($1-2):2 title columnhead w point  pointtype 7 ps 0.4;
!epstopdf latency.eps
!rm latency.eps

