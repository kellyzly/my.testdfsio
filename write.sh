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
 hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -write -nrFiles $nrFiles -fileSize $fileSize  -resFile ./write.$fileSize.$nrFiles
