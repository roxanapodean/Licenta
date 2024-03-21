using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace PrelucrareTraces
{
    class Program
    {
        static void Main(string[] args)
        {
            string line;
            string final_line;
            string []frame;
            int first_frame = 0;
            double previous_timeStamp = 0.0;
            double current_timeStamp = 0.0;
            double deltaT = 0.0;

            double cycle_time_10 = 10.0;
            double cycle_time_20 = 20.0;
            double cycle_time_50 = 50.0;
            double cycle_time_100 = 100.0;
            string inputFile = @"D:\faculta\an4\Licenta\TraceIveco\TcoVehSpeed_Multiplication_TA\TcoVehSpeed_Multiplication_10%_TA.asc";
            string outputFile = @"D:\faculta\an4\Licenta\TraceIveco\TcoVehSpeed_Multiplication_TA\TcoVehSpeed_Multiplication_10%_TA_Inputs.asc";

            try
            {
                StreamReader sr = new StreamReader(inputFile); // create a StreamRead for Input File(CANoe)
                StreamWriter wrinputs = new StreamWriter(outputFile); // create a StreamWriter for Output File(matlab input)
                line = sr.ReadLine(); //read line
                while (line != null) // while line is not null
                {
                    int count = line.Split(',').Length - 1; // line.Split(',') returns an array of comma-separated strings; number of elements -> (.length)  
                    if (count > 3) 
                    {
                        frame = line.Split(',');
                        frame[0]=frame[0].Replace('/', ' '); //for each line, "/" character is replaced with space

                        //following code is used to calculate delta t between signals 
                        if (first_frame == 0) //first line of the input file
                        {
                            previous_timeStamp = Convert.ToDouble(frame[0]); //used for calculate delta t
                            //build the line for output file
                            final_line = cycle_time_20.ToString() + ","; //the cycle_time variable to be changed depending on the cycle time of the message 
                            for (int i = 1; i < frame.Length; i++)
                            {
                                if (i == frame.Length - 1)
                                    final_line = final_line + frame[i];
                                else
                                    final_line = final_line + frame[i] + ",";
                            }
                        }
                        else
                        {
                            current_timeStamp = Convert.ToDouble(frame[0]);
                            deltaT = (current_timeStamp - previous_timeStamp) / 1000;

                            if (frame[frame.Length - 1] == " 0")      //0 means legitimate message(not an intrusion)                 
                                previous_timeStamp = current_timeStamp;
                       
                            final_line = deltaT.ToString(CultureInfo.InvariantCulture) +", "; //CultureInfo.InvariantCulture use dot as the decimal separator 

                            for (int i = 1; i < frame.Length; i++)
                            {
                                if (i == frame.Length - 1)
                                    final_line = final_line + frame[i];
                                else
                                    final_line = final_line + frame[i] + ",";
                            }
                        }
                        first_frame = 1;
                        wrinputs.WriteLine(final_line); // write the final line in the output file
                        final_line = ""; //resets the string
                   }
                    line = sr.ReadLine(); // read the next line
                }
                wrinputs.Close(); // close the file 
            }

            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }
            finally
            {
                Console.WriteLine("Executing finally block.");

            }
        }
    }
}


