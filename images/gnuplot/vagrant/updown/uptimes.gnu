reset
set term postscript eps enhanced color font "Arial,24"

set size 1,.65
set style fill solid 1.00 border 0
set linetype cycle 1

set style data boxes
set boxwidth 0.7 relative
set xtics font "Arial,20"

#set xlabel "Attacks" 
set ylabel "Boot time (secs)" offset 2
set yrange [0:60]
set ytics 0,20,100
set y2tics 0,10,100
set y2tics format ""
set xtics border in scale 0,0 nomirror rotate by -50  autojustify

set offset -0.0,-0.0,0,0
unset xtics


set bmargin 0.4
set rmargin 0
set tmargin 0.4
set lmargin 5

set grid ytics y2tics
set nokey
#set key inside l top vertical Left reverse enhanced autotitles columnhead nobox maxrows 3

set out "boot.eps" 

plot 	'data.dat' using 2:xtic(1)  linecolor rgb "#00000", '' u 0:4:1 t "" with labels textcolor "white" font "Arial-Bold,20" offset 0.0,0 rotate by 90, '' u 0:5:2 t "" with labels textcolor "white" font "Arial-Bold,20" offset 0.0,0 rotate by 90\


!epstopdf *.eps;
!rm *.eps
