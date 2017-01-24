
echo $HADOOP_HOME
for arg in "$@";do
     echo "arg:"$arg
     case $arg in
      --nrFiles*)
        nrFiles=$(echo $arg | cut -d"=" -f2)
      ;;  
      --fileSize*)
        fileSize=$(echo $arg | cut -d"=" -f2)
      ;;  
      esac
done
 hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -read -nrFiles $nrFiles -fileSize $fileSize  -resFile ./read.$fileSize.$nrFiles
