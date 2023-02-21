# Design and Implementation of traffic Light Controller

# Introduction:

<p>Now a day's we need to control traffic, which have junction places. For that purpose traffic departments are provided with new European model. In generally many traffic signals are operates on a timing mechanism that changes the light after given time interval. The traffic signal system consists of three important parts, in that traffic light controller is first one. Because of it represent brain of the traffic system.</p>

<p>Many traffic light systems operate on a timing mechanism that changes the lights after a given interval. An intelligent traffic light system senses the presence or absence of vehicles and reacts accordingly. The idea behind intelligent traffic systems is that drivers will not spend unnecessary time waiting for the traffic lights to change. An intelligent traffic system detects traffic in many different ways.</p>

# Traffic Light Control:

<p>The traffic signal system consists of three important parts. The first part is the controller, which represents the brain of the traffic system.</p>
      
![pic_1](https://user-images.githubusercontent.com/65547096/180929924-291f508e-650e-4da1-8e24-20726440e6a4.PNG)

<p>It consists of a computer that controls the selection and timing of traffic movements in accordance to the varying demands of traffic signal as registered to the controller unit by sensors. The second part is the signal visualization or in simple words is signal face. Signal faces are part of a signal head provided for controlling traffic in a single direction and consist of one or more signal sections. These usually comprise of solid red, yellow, and green lights. The third part is the detector or sensor. The sensor or detector is a device to indicate the presence of vehicles. One of the technologies, which are used today, consists of wire loops placed in the pavement at intersections. They are activated by the change of electrical inductance caused by a vehicle passing over or standing over the wire loop. Recent technology utilization is video detection. A camera feeds a small computer that can "see" if a vehicle is present.</p>

<p>In order to implement the Intelligent Traffic Signal Simulator, one needs to setup and assemble the hardware components and write a program to control the intelligent traffic signal simulator. The layout of the Intelligent Traffic Signal Simulator is displayed in Figure 1. The blocks, which are labeled N1, N2, N3, E1, E2, E3, S1 and W1 are the infrared object detectors.</p>
      
![pic_2](https://user-images.githubusercontent.com/65547096/180929873-a170fb0f-4ec1-4ac7-ac04-ce8e5ea91c55.PNG)
      
<p>It is often useful to be able to sequence through an arbitrary number of states, staying in each state an arbitrary amount of time. For example, consider the set of traffic lights shown in Figure 2. The lights are assumed to be at a four-way intersection with one street going north south and the other road going east-west. The Lab VIEW programming is done in the diagram using graphical source code. In the block diagram the program runs from left to right. If the green light in the traffic model does not illuminate, the system goes into default since there is no input into the system. The signal from the sensor is acquired through the DAQ, which is connected, to the computer.</p>

# Design Process of Traffic Light Controller:

<p>A single 3-lamp traffic light is considered as a finite state machine. It has three states, Red, Yellow, and Green, which are also the outputs. A single input for the traffic light is defined, with values 0 for no change and 1 for change. This input is connected to the output of a countdown timer, which outputs a 1 when it reaches zero. Thus for a single light, we can draw the state transition diagram as shown in Figure 3.</p>
<p>To simulate these traffic lights we will use the red, yellow, and green LEDs connected to Id[7:2] on the BASYS board and cycle through the six states shown in Table 1.</p>
      
![pic_3](https://user-images.githubusercontent.com/65547096/180930032-1ed31eac-3730-4624-b8a4-4c5c82f52173.PNG)
      
<p>A state diagram for controlling these traffic lights is shown in Figure 3. If we use a 3 Hz clock to drive this state diagram then a delay of 1 second is achieved by staying in a state for three clock cycles. Similarly, a delay of 5 second is achieved by staying in a state for fifteen clock cycles. The count variable in Figure 3 will be reset to zero when moving to the next state after a timeout.</p>
      
![pic_4](https://user-images.githubusercontent.com/65547096/180930060-521f12c5-3e44-42dc-91a6-11485381d4e1.PNG)
