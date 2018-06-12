reset
set term postscript eps enhanced color font "Arial,12"

set size 1,0.3


set style data histograms
set style fill solid 1.00 border lt 0
set boxwidth
set style histogram clustered gap 1 title textcolor lt -1

set rmargin 0

set ylabel "Throughput (ops/sec)"
set yrange [0:60000]
set ytics 0,10000,50000
#set y2tics 0,2500,45000
set y2tics format ""

set ytics ("60k" 60000,"50k" 50000,"40k" 40000, "30k" 30000, "20k" 20000, "10k" 10000 )

set xtics border in scale 0,0 nomirror rotate by -50  autojustify
set grid ytics y2tics
set key inside r top vertical L reverse enhanced nobox maxrows 3 
#set label "*1024/1024 baseline" at 13.5,17900
#set label "*0/0 baseline = 83176 msg/sec" at 12.5,42000



#set arrow from -1,15446 to 17,15446 nohead filled back lw 3 lc rgb "red"
#set arrow from -1,83176 to 17,83176 nohead filled back lw 3 lc rgb "red"



set out "throughput.eps" 

plot 	'data0.dat' 	using 2:xtic(1) t '0/0' w histogram fc rgb "#000000",\
	'data1024.dat'	using 2:xtic(1) t '1024/1024' w histogram fc rgb "#cccccc",\
#59739
!epstopdf *.eps;
!rm *.eps

