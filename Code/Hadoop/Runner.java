package h1.beligibility;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;

public class Runner {


  public static void main(String[] args) throws Exception
  {
        JobConf conf = new JobConf(Runner.class);
        JobConf conf1 = new JobConf(Runner.class);
        JobConf conf2 = new JobConf(Runner.class);
        conf.setJobName("AreaWage");
        conf1.setJobName("SOCWage");
        conf2.setJobName("OrgStatus");

        conf.setMapperClass(AreaWageMapper.class);
        
        conf.setMapOutputKeyClass(Text.class);
        conf.setMapOutputValueClass(FloatWritable.class);
        
        conf.setReducerClass(AreaWageReducer.class);
        
        conf.setOutputKeyClass(Text.class);
        conf.setOutputValueClass(Text.class);
        
        conf1.setMapperClass(SOCWageMapper.class);
        
        conf1.setMapOutputKeyClass(Text.class);
        conf1.setMapOutputValueClass(FloatWritable.class);
        
        conf1.setReducerClass(SOCWageReducer.class);
        
        conf1.setOutputKeyClass(Text.class);
        conf1.setOutputValueClass(Text.class);
        
        conf2.setMapperClass(OrgStatusMapper.class);
        
        conf2.setMapOutputKeyClass(Text.class);
        conf2.setMapOutputValueClass(IntWritable.class);
        
        conf2.setReducerClass(OrgStatusReducer.class);
        
        conf2.setOutputKeyClass(Text.class);
        conf2.setOutputValueClass(IntWritable.class);
        

        String tmp = args[1] + "-tmp";
        

        FileInputFormat.setInputPaths(conf, new Path(args[0]));
        FileOutputFormat.setOutputPath(conf, new Path(args[1]));
        
        FileInputFormat.setInputPaths(conf1, new Path(args[0]));
        FileOutputFormat.setOutputPath(conf1, new Path(args[2]));
        
        FileInputFormat.setInputPaths(conf2, new Path(args[0]));
        FileOutputFormat.setOutputPath(conf2, new Path(args[3]));

        JobClient.runJob(conf);
     
        JobClient.runJob(conf1);
        
        JobClient.runJob(conf2);

	}

}