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

#set offset -0.6,-0.6,0,0
set xrange [-0.5:4.5]
set rmargin 0
set tmargin 0
set bmargin 1.8
set lmargin 5.5


set grid ytics
set key inside r top vertical Left reverse enhanced autotitles columnhead nobox maxrows 1 samplen 1.2



set out "execution-special.eps" 

plot 	'final_all.plot' 	using 2:xtic(1) t "Lazarus" 	linecolor rgb "#ffffff", '' u 0:4:3 t "" with labels font "Arial-Bold,20" offset -3,0 rotate by 90,\
	'static_all.plot' 	using 2:xtic(1) t "Static"  	linecolor rgb "#cccccc", '' u 0:4:3 t "" with labels font "Arial-Bold,20" offset -0.9,0 rotate by 90,\
	'equal_all.plot' 	using 2:xtic(1) t "Equal" 	linecolor rgb "#666666", '' u 0:4:3 t "" with labels textcolor "black" font "Arial-Bold,20" offset 1,0 rotate by 90,\
	'random_all.plot' 	using 2:xtic(1) t "Random" 	linecolor rgb "#000000", '' u 0:4:3 t "" with labels textcolor "white" font "Arial-Bold,20" offset 2.6,0 rotate by 90,\


!epstopdf *.eps;
!rm *.eps
