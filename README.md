#this script helps you test the TestDFSIO in different nFiles and fileSize by following command:
##./collect.sh --start=$start --end=$end --step=$step --fileSize=$fileSize
for example ./collect.sh --start=8 --end=16 --step=8 --fileSize=10GB

it will do

0. TestDFSIO clean,
1. clean all the cache on all nodes in the cluster
2. hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -write -nrFiles 8 -fileSize 10GB  -resFile ./write.10GB.8 
3. clean all the cache on all nodes in the cluster
4. hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -read -nrFiles 8 -fileSize 10GB  -resFile ./read.10GB.8 
5. clean all the cache on all nodes in the cluster
6. hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -write -nrFiles 16 -fileSize 10GB  -resFile ./write.10GB.16 
7. clean all the cache on all nodes in the cluster
8. hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -read -nrFiles 16 -fileSize 10GB  -resFile ./read.10GB.16 
