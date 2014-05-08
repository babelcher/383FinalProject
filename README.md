383 Final Project
====

## ECE 383 Persistence of Vision Clock

### Prelab

#### Introduction
I will create a Persistence of Vision Display in order to display a message or the time. It will consist of 7 LEDs spinning around in a circle fast enough to give the appearance that there is a message sitting still. A few problems that I came across already are wires getting twisted up so in order to combat that I will spin the entire FPGA on an electric motor.

#### Levels of Functionality
Required-Lights up the LEDs in the same position every revolution.
B Functionality-Displays a message to the viewer.
A Functionality-Displays the time to the viewer.

#### Timeline
- Getting the hardware finalized and built-Lesson 35
- Getting required functionality-Lesson 37
- B Functionality-Lesson 38
- A Functionality-Lesson 39

I will try to keep to this timeline so that I will be finished on Lesson 39 and ready to demo on Lesson 40.

### Lab

#### Implementation
Getting required functionality was 60% hardware and 40% software related. I had to use a different board that I would be able to spin. It became apparent to me that I could not spin the huge ones we have been using so I had to use a Digilent Basys board that is much smaller. I was able to get the base from Capt James Trimble and followed a design that he had used for a microcontroller when he was a cadet to mount and spin the board. Capt Trimble also provided me with the design of using an infrared emitter and detector pair to position the LEDs during each cycle.

#### Test/Debug
- Determing required functionality was difficult until I had set up the infrared detector circuit correctly. Once this was set up to give a logic '0' whenever it passed over the emitter the code was rather simple to write.
- I created a state machine in VHDL for B Functionality but have yet to make this work.
    - There are some timing issues that I am encountering when implementing this in hardware.
    - A testbench of the code shows that it is transitioning correctly through the desired states and giving the desired outputs but the LEDs are not lighting up correctly.

#### Demonstration
Only required functionality is working at the moment.

#### Conclusion
This final project was very fun (although frustrating at times) to create and implement. I will add ideas to this section as I think of them.
