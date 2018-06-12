reset
set term postscript eps enhanced color font "Arial,24"
set size 1,.5
set style fill solid 1.00 border 0

set style data histograms
set style fill solid 1.00 border lt 0
set boxwidth
set style histogram clustered gap 1 title textcolor lt -1



set ylabel "Throughput (ops/sec)" offset 0,-0.6,0
set yrange [0:20000]
set ytics 0,5000,45000


#set xrange [-.5:2]
set rmargin 0
set tmargin 0.5
set bmargin 2
set lmargin 7




set ytics ("40k" 40000, "30k" 30000, "20k" 20000,  "15k" 15000, "10k" 10000, "5k" 5000, "0" 0 )
set xtics border in scale 0,0 nomirror autojustify
set grid ytics y2tics
set key inside r top vertical L reverse enhanced nobox maxrows 3 font ",24" samplen 4  width -4


set out "throughput.eps" 

plot 	'set1.dat' 	using 2:xtic(1) t '[UB16, UB15, FE24, OS42]'	linecolor rgb "#000000", '' u 0:3:2 t "" with labels textcolor "white" font "Arial-	Bold,24" offset -3.8,0 rotate by 90,\
	'set3.dat'	using 2:xtic(1) t '[UB16, W10, SO10, OB61]' linecolor rgb "#cccccc",\
	'set2.dat'	using 2:xtic(1) t '[OB60, OB61, SO10, S11]' linecolor rgb "#ffffff",\


!epstopdf *.eps;
!rm *.eps

