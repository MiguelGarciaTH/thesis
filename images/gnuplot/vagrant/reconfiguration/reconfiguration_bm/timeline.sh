#count=0; total=0; for i in $( cat $1 | grep "Throughput =" | awk '{print $3}'
# );\
#do total=$(echo $total+$i | bc ); \
#((count++)); done; echo "scale=2; $total / $count" | bc

cat $1 | grep "operations;"  |   awk '{  print count++ " " $5 } ' > data.dat


