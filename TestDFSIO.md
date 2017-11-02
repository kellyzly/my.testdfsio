TestDFSIO to test performance of Hadoop
TestDFS在一个集群刚刚装完后，经常用于测试HDFS IO 的性能（磁盘，网络）。
命令： 1000个map,每个map写入500MB数据：
`hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.3-tests.jar TestDFSIO -write -nrFiles 1000 -fileSize 500MB`
结果：
```JS
16/12/27 10:37:21 INFO fs.TestDFSIO: —– TestDFSIO —– : write 
16/12/27 10:37:21 INFO fs.TestDFSIO: Date & time: Tue Dec 27 10:37:21 CST 2016 
16/12/27 10:37:21 INFO fs.TestDFSIO: Number of files: 1000 
16/12/27 10:37:21 INFO fs.TestDFSIO: Total MBytes processed: 500000.0 
16/12/27 10:37:21 INFO fs.TestDFSIO: Throughput mb/sec: 19.075746508356282 
16/12/27 10:37:21 INFO fs.TestDFSIO: Average IO rate mb/sec: 33.10749435424805 
16/12/27 10:37:21 INFO fs.TestDFSIO: IO rate std deviation: 53.24997725209898 
16/12/27 10:37:21 INFO fs.TestDFSIO: Test exec time sec: 724.434 
16/12/27 10:37:21 INFO fs.TestDFSIO:
```

Throughput,Average IO rate, IO rate std deviation 具体算法见代码
[code](https://github.com/apache/hadoop/blob/f67237cbe7bc48a1b9088e990800b37529f1db2a/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-jobclient/src/test/java/org/apache/hadoop/fs/TestDFSIO.java#L369)
```JS
  void collectStats(OutputCollector<Text, Text> output, 
                      String name,
                      long execTime, 
                      Long objSize) throws IOException {
      long totalSize = objSize.longValue();
      float ioRateMbSec = (float)totalSize * 1000 / (execTime * MEGA);
      LOG.info("Number of bytes processed = " + totalSize);
      LOG.info("Exec time = " + execTime);
      LOG.info("IO rate = " + ioRateMbSec);
``` 
ioRateMbSec=totalSize * 1000 / (execTime * MEGA) 为单个map输入大小/执行时间
当一个map向hdfs文件写完500MB的后,会把total size, execution time, io rate 写入part-m-xxxxx 中间文件。




