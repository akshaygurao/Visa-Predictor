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




public class AreaWageReducer extends MapReduceBase implements Reducer<Text, FloatWritable, Text, Text> 
{

  public void reduce(Text area, Iterator<FloatWritable> wage,
      OutputCollector<Text, Text> output, Reporter reporter)
      throws IOException {
    
    float sum = 0,avg=0,count=0;
    
    while (wage.hasNext())
    {
        count++;
      FloatWritable w = wage.next();
     sum += w.get();
     
     avg = sum/count;
    
    }

    output.collect(area, new Text(String.valueOf(avg)));

  }

}
