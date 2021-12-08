Homework-3(COEN-241)
NOTE: I have added screenshots for most of the questions. And screenshots are not handled by .txt files. I would request to please check the README.pdf file for all the answers. 


Task-1


Questions


1. What is the output of “nodes” and “net”        
Output of nodes:
Available nodes are: c0 h1 h2 h3 h4 h5 h6 h7 h8 s1 s2 s3 s4 s5 s6 s7
  

Output of nets:


  

2. What is the output of “h7 ifconfig”
  







Task-2


Questions


1. Draw the function call graph of this controller. For example, once a packet comes to the controller, which function is the first to be called, which one is the second, and so forth?
The controller initializes with the below function call:


launch() -> start_switch(event) -> __init__(self,connection)


When the packet arrives the below graph is followed depending upon the code:


_handle_PacketIn(self,event) -> act_like_hub(self,packet,packet_in) -> resend_packet(self,packet_in, out_port):




_handle_PacketIn(self,event) -> act_like_switch(self,packet,packet_in) -> resend_packet(self,packet_in, out_port):


2. Have h1 ping h2, and h1 ping h8 for 100 times (e.g., h1 ping -c100 p2).
1. How long does it take (on average) to ping for each case?


* h1 ping h2


Average time is 2.5 ms


  





* h1 ping h8


Average time is 14ms


  





2. What is the minimum and maximum ping you have observed?
* h1 ping h2
Minimum: 1.42ms
Maximum: 5.42ms


* h1 ping h8
Minimum: 5.55 ms
Maximum: 24.0 ms


3. What is the difference, and why?
Minimum ping difference: 4.13 ms
Maximum ping difference: 18.58 ms 


In case of h1 and h2 the ping time is lower because they are connected to the same switch. And in case of h1 and h8 they are not connected to the same switch , so they have to travel more switches hence the ping time is higher.


3. Run “iperf h1 h2” and “iperf h1 h8”


1. What is “iperf” used for?
Iperf is a open-source command-line tool used to diagnose the network speed issues by measuring maximum network throughput a server can handle. It generally helps to measure the bandwidth for the network performance and the quality of the network.


2. What is the throughput for each case?
* Iperf h1 h2


  



* Iperf h1 h8
  



3. What is the difference, and explain the reasons for the difference
Difference in throughput: 13.7 Mbits/sec, 15.9 Mbits/sec
As we have seen that the packet travel is less in case of h1 h2 as compared to h1 h8, it has a higher throughput because more packets can be transmitted.
4. Which of the switches observe traffic? Please describe your way for observing such
traffic on switches (e.g., adding some functions in the “of_tutorial” controller).
To check the traffic in the connection I have added the below print statement to the code of of_tutorial file: 
print(f”switch: {event.connection} | source address: {packet.src}, destination address: {packet.dst} ”)
        After adding this, I ran the command iperf h1 h2 and iperf h1 h8 in mininet. Almost all of the switches observed traffic. For iperf h1 h8, s1, s2, s3, s4, s5, s6, s7, all switches observes traffic because of its structure in binary_tree.py. 
And in case of h1 h2 , s3 switch observes most of the traffic because of its connection.


Task-3 
Question
1. Describe how the above code works, such as how the "MAC to Port" map is established. You could use a ‘ping’ example to describe the establishment process (e.g., h1 ping h2).
When h1 pings h2, it will look into the mac_to_port dictionary to check if the particular port exists or not. If yes, then it uses resend_packet() to send the packet.
2. (Comment out all prints before doing this experiment) Have h1 ping h2, and h1 ping
h8 for 100 times (e.g., h1 ping -c100 p2).
1. How long did it take (on average) to ping for each case?
H1 ping -c100 h2
Average time: 4.12 ms
H1 ping -c100 h8
Average time: 10.5 ms
2. What is the minimum and maximum ping you have observed?
H1 ping h2
Maximum time: 6.51 ms
Minimum time: 1.70 ms
H1 ping h8
Maximum time: 27.5 ms
Minimum time: 7.12 ms


3. Any difference from Task 2 and why do you think there is a change if there is?
Yes there is a difference in average time in task 1 and task2.
For h1 ping h2, there is a slight increase in average ping time.
For h1 ping h8, there is a decrease in average ping time. As mac_to_port is established so packets will be sent directly to the destination as compared to flooding the packets. Hence there is a slight decrease in average ping time.


3. Run “iperf h1 h2” and “iperf h1 h8”.
Command: iperf h1 h2
Result : [‘4.18 Mbits/sec’, ‘5.00 Mbits/sec’]
Command: iperf h1 h8
Result : [‘3.00 Mbits/sec’, ‘3.68 Mbits/sec’]