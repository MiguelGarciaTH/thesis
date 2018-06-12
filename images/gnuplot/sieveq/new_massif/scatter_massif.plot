reset
set term postscript eps enhanced black font "Arial,20"

set size 1,.4


set ylabel "Latency (msecs)" offset 2,-.5,0

set xlabel "Events/Second"
fig="massif"
set output fig.'.eps'

set log y
set xrange [0:2200]

set xtics 0,500,5000 nomirror
#set ytics 0,50,200 nomirror
set ytics nomirror
set grid x2tics ytics 


set tmargin 1.5
set bmargin 3
set rmargin 0.1
set lmargin 5.5


set x2tics ("" 130, "2x" 260, "4x" 520, "8x" 1040, "16x" 2080) font 'Helvetica,20' 

set style line 1 lc rgb '#000000' lt 1 lw 1 pt 1 ps 0.9
set style line 2 lc rgb '#AA0000' lt 2 lw 1 pt 2 ps 0.9
set style line 4 lc rgb '#8E2323' lt 4 lw 1 pt 4 ps 0.9
set style line 5 lc rgb '#1874CD' lt 5 lw 1 pt 5 ps 0.9

#set key inside r bottom vertical Left reverse noenhanced autotitles columnhead nobox
#set key inside l top vertical Left reverse noenhanced autotitles columnhead nobox
unset key

plot "scatter_massif.dat" using 1:2 title 'Olympic Games' with linespoints ls 1 lw 4


!epstopdf *.eps;
!rm *.eps
