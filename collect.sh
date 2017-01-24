for arg in "$@";do
     echo "arg:"$arg
     case $arg in
      --start*)
        start=$(echo $arg | cut -d"=" -f2)
      ;;  
      --end*)
        end=$(echo $arg | cut -d"=" -f2)
      ;;  
      --step*)
        step=$(echo $arg | cut -d"=" -f2)
      ;;  
      --fileSize*)
        fileSize=$(echo $arg | cut -d"=" -f2)
      ;;  
      esac
done
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -clean
for (( i=$start; i<=$end;i=i+$step))

do
 echo "i:"$i
sh  clean.cache.all.sh;
sh write.sh --nrFiles=$i --fileSize=$fileSize;
sh  clean.cache.all.sh;
sh read.sh  --nrFiles=$i --fileSize=$fileSize;
done
