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
set yrange [0:150]
set ytics 0,20,100 nomirror

set xrange [-0.6:8.0]
set rmargin 0
set tmargin 0.1
set bmargin 1.5
set lmargin 5.5


set grid ytics
set key inside r top vertical Left reverse enhanced autotitles columnhead nobox maxrows 2 samplen 1.5

set out "execution.eps" 

plot 	'lazarus.dat' 	using 2:xtic(1) t "Lazarus" 	linecolor rgb "#000000",\
	'cvss3.dat' 	using 2:xtic(1) t "CVSSv3"  	linecolor rgb "#cccccc",\
	'common.dat' 	using 2:xtic(1) t "Common" 	linecolor rgb "#ffffff",\
	'random.dat' 	using 2:xtic(1) t "Random" 	linecolor rgb "#555555",\
	'equal.dat' 	using 2:xtic(1) t "Equal" 	linecolor rgb "#777777",\
#	'cvss.dat' 	using 2:xtic(1) t "CVSSv2" 	linecolor rgb "#666666",\

!epstopdf *.eps;
!rm *.eps
