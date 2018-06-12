reset
fontsize = 42
set term postscript enhanced eps fontsize solid
set size 1.2,1.

set ylabel "Throughput (msg/sec)"
set xlabel "Time (secs)"

set yrange [ 0 : 5000]
set xrange [ 0 : 200 ]
#set ytics 0,1600,10000

unset key
#set x2tics ("start" 100, "end" 150)  

set output 'server_throughput.eps' 
plot "server.throughput" using ($2) title columnhead with points pointtype 7 pointsize 1 

!epstopdf server_throughput.eps ;
!rm server_throughput.eps
