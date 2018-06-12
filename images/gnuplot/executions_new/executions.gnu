reset
set term postscript eps enhanced color font "Arial,24"
set size 1,.5
set style fill solid 1.00 border 0
set linetype cycle 1

set boxwidth 1 absolute
set style histogram clustered gap 1 title textcolor lt -1
set style data histograms

#set xlabel "Attacks" 
set ylabel "Compromised(%)" offset 2.1
set yrange [0:120]
set ytics 0,20,100 nomirror

set xrange [-0.4:2.4]
set rmargin 0
set tmargin 0.1
set bmargin 1.8
set lmargin 5.5


set grid ytics
set key inside r top vertical Left reverse enhanced autotitles columnhead nobox maxrows 1 samplen 1.5

set out "execution.eps" 

plot 	'final.dat' 	using 2:xtic(1) t "Lazarus" 	linecolor rgb "#ffffff", '' u 0:4:3 t "" with labels font "Arial-Bold" offset -4.5,0 rotate by 90,\
	'static.dat' 	using 2:xtic(1) t "Static"  	linecolor rgb "#cccccc", '' u 0:4:3 t "" with labels font "Arial-Bold" offset -1.3,0 rotate by 90,\
	'equal.dat' 	using 2:xtic(1) t "Equal" 	linecolor rgb "#666666", '' u 0:4:3 t "" with labels textcolor "white" font "Arial-Bold" offset 1.4,0 rotate by 90,\
	'random.dat' 	using 2:xtic(1) t "Random" 	linecolor rgb "#000000", '' u 0:4:3 t "" with labels textcolor "white" font "Arial-Bold" offset 4.6,0 rotate by 90,\


!epstopdf *.eps;
!rm *.eps
