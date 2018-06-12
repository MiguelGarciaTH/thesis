reset
fontsize = 18
set term postscript eps enhanced color font "Arial,24"

set size 1,.4


set style data histograms
set style fill solid 1.00 border lt 0
set boxwidth
set style histogram clustered gap 1 title textcolor lt -1


set ylabel "Throughput \n(ops/sec)" offset 1,0,0
set yrange [0:14000]
set ytics 0,5000,45000

set y2tics 0,2500,45000
set y2tics format ""

set rmargin 0
set tmargin 0.1
set bmargin 1.4
set lmargin 7.2


set ytics ("40K" 40000, "30K" 30000, "20K" 20000,  "15K" 15000, "10K" 10000, "5K" 5000, "0" 0 )
set xtics border in scale 0,0 nomirror autojustify
set grid ytics y2tics
set key inside l top vertical L reverse enhanced nobox maxrows 3 font ",20" samplen 2  width -4


set out "throughput.eps" 
plot	'set3.dat'	using 2:xtic(1) t 'BM' 	linecolor rgb "#cccccc", \
 	'set1.dat' 	using 2:xtic(1) t '[UB16, UB15, FE24, OS42]'	linecolor rgb "#000000", \
	'set2.dat'	using 2:xtic(1) t '[OB60, OB61, SO10, S11]' 	linecolor rgb "#ffffff", \



!epstopdf *.eps;
!rm *.eps

