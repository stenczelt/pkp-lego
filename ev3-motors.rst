EV3 Motors Introduction
===========================================

The EV3 python interface provides a collection of functions to read sensors and control motors. Here, we will go through an introduction to motor control.



Prerequisites
-------------

This part of the tutorial assumes that you connected to the EV3 in interactive mode, via SSH. Complete the :doc:`ev3-setup` section before proceeding.

Attach one of the big motors to Port A on the brick, the other one to Port B, and the third small motor to Port C. The motors always need to be attached to the ports marked with letters. 


Initialise 
----------

Once connected to the brick, launch the built-in python interpreter
::
	brickrun -r -- pybricks-micropython

Then import some python functions
::
	from pybricks.hubs import EV3Brick
	from pybricks.ev3devices import Motor


Create a brick object: 
::
	ev3 = EV3Brick()

And then a motor object. Notice how you need to specify the port it is connected to. 
::
	m = Motor(Port.A)
	
If you specify a port with no motor connected, you get an error. Try it!

Now we can issue commands
::
	m.run(200)

This gets the motor going at a speed of 200 degrees (of angle) per second. We get the command prompt back, and can continue to do things, while the motor keeps running. In order to stop it, we can issue another command
::
	m.stop()

Try all your motors. Run them simultaneously. 

Speed control
--------------

Play around with different motor speeds. At very low speed, the motor will stutter, because of friction.  Find the smallest speed at which your motor turns reliably. If you want something to turn very slowly but steadily, you will need to build a **gearbox**, i.e. run the motor faster, but have it connect to a small gear then a large gear, so the latter turns more slowly.

Many ways to stop
------------------

There are several ways to stop a motor. You can just stop applying power to it entirely, or you can also break by counteractive the voltage generated as the motor turns a bit due to its angular momentum. This latter functionality is available via the function
::
	m.brake()

There is an even more controlled way, which actively holds the motor position at the place where it was when you issue the command. The motor remains under power, so e.g. it can hold a weight that is being lifted. You can attach an arm to the motor and weight the end with antoher piece to see the difference. Make sure that there is space for the arm to fully turn, otherwise you risk breaking pieces. 
::
	m.hold()

When you use the `hold` function, you can see that the motor cannot be turned by hand. To release, use a `stop` command. 

Tachometer
~~~~~~~~~~




