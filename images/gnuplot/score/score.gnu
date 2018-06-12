reset
set term postscript eps enhanced black font "Arial,24"

set size 1,.4

set log y

set ylabel "Risk" offset 3.5,0,0
set y2label "vulns/clusters" offset -2,-.5,0
set xlabel "Days" offset 0,.5,0
set grid y

set xrange [0:31]

set ytics
set y2tics 0,5,20
set y2tics 0,2,4 offset -1,0,0
set y2tics 0,5,20 offset -1,0,0

set rmargin 4.5
set tmargin .6
set bmargin 2.5
set lmargin 6

set nokey
set key box inside r top vertical L reverse autotitles columnhead samplen 2 spacing .9
  
set output 'score.eps' 

set style line 1 lt black lw 6 pt 2 ps 0.5

plot "score_random_all.plot" u 1:2 t 'risk' with lines ls 1,\
	 '' u 1:3  t 'shared vulns' w p pointtype 1 ps 2 axes x1y2,\
	 '' u 1:5  t 'shared clusters' w p pointtype 2 ps 2 axes x1y2\
#, '' u 1:4  t 'cvss' w p pointtype 3 ps 1 axes x1y2\
#'' u 1:6  t 'quarantine' w lines axes x1y2, 



!epstopdf score.eps

!rm score.eps

