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

set label "start" at 80,5500 font "Arial-Bold,32"
set label "end" at 110,5500 font "Arial-Bold,32"

set arrow from 100,0 to 100,5000 nohead lt 3
set arrow from 110,0 to 110,5000 nohead lt 3

#set label "start" at 80,5500 font "Arial-Bold,32"
#set label "end" at 150,5500 font "Arial-Bold,32"

#set arrow from 100,0 to 100,5000 nohead lt 3
#set arrow from 150,0 to 150,5000 nohead lt 3



set output 'server_throughput_recovery_replicas_dos.eps' 
plot "server_throughput_recovery_replicas_dos.throughput" using ($2) title columnhead with points pointtype 7 pointsize 1 

!epstopdf server_throughput_recovery_replicas_dos.eps ;
!rm server_throughput_recovery_replicas_dos.eps
