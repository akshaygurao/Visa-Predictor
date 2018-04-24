package h1.beligibility;

import java.io.IOException;
import java.util.Iterator;
import org.apache.hadoop.io.FloatWritable;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reducer;
import org.apache.hadoop.mapred.Reporter;




public class OrgStatusReducer extends MapReduceBase implements Reducer<Text, IntWritable, Text, IntWritable> 
{

  public void reduce(Text org, Iterator<IntWritable> status,
      OutputCollector<Text, IntWritable> output, Reporter reporter)
      throws IOException {
    
     int totalCount = 0;
    
    while (status.hasNext())
    {
      IntWritable count = status.next();
      totalCount += count.get();
    }

    output.collect(org, new IntWritable(totalCount));

  }

}
