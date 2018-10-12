reset
set term postscript eps enhanced color font "Arial,22"

set size 1,0.5

set style data histograms
set style fill solid 1.00 border 0
set boxwidth
set style histogram clustered gap 1 title textcolor lt -1

set rmargin 0.5

set ylabel "Throughput (ops/sec)"
set yrange [0:60000]
set ytics 0,10000,50000
#set y2tics 0,2500,45000
set y2tics format ""

set ytics ("60k" 60000,"50k" 50000,"40k" 40000, "30k" 30000, "20k" 20000, "10k" 10000 )

set xtics border in scale 0,0 nomirror rotate by -50 autojustify
set grid ytics y2tics
set key inside r top vertical L reverse enhanced nobox maxrows 3 

set out "throughput.eps" 

plot 	'data0.dat' 	using 2:xtic(1) t '0/0' w histogram linecolor rgb "#000000",\
	'data1024.dat'	using 2:xtic(1) t '1024/1024' w histogram linecolor rgb "#cccccc",\
#59739
!epstopdf *.eps;
!rm *.eps

