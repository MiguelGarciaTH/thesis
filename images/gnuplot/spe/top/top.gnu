reset
set term postscript eps enhanced color font "Arial,24"
set size 1,.5
set style fill solid 1.00 border 0
set linetype cycle 1

set boxwidth 1 absolute
set style histogram clustered gap 1 title textcolor lt -1
set style data histograms

set xlabel "Number of affected OSes" 
set ylabel "Number of\n vulnerabilities" offset 2.1
set yrange [0:150]
set ytics 0,50,150 nomirror

#set xrange [-0.4:2.4]
set rmargin 0
set tmargin 0.5
set bmargin 3
set lmargin 7


set grid ytics
#set key inside r top vertical Left reverse enhanced autotitles columnhead nobox maxrows 1 samplen 1.5

set out "top.eps" 

plot 	'top.dat' 	using 2:xtic(1) t "" linecolor rgb "#666666", '' u 1:($2 + 0.5):($2) with labels font "Arial-Bold,20" \


!epstopdf *.eps;
!rm *.eps
