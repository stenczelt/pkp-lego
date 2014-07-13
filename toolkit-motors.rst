EV3 Matlab Toolkit - Motors Introduction
===========================================

The EV3 Matlab toolkit provides a collection of functions to read sensors and control motors. Here, we will go through an introduction to motor control.



Prerequisites
-------------

This part of the tutorial assumes that you connected Matlab to the EV3 via USB. Complete the :doc:`toolkit-setup` section before proceeding.

Also attach one of the motors to Port A on the brick.

Don't forget that when you want to start a new connection, you have to end the previous one first with ``delete(b)``.



Example program
---------------

Open Matlab, and open the ``Example.m`` file from your ``<EV3>`` directory. (You can also download it from here: :download:`Example.m <resources/Example.m>`.)

This example program demonstrates some of the functionality of the EV3 Matlab toolkit. The program will give you some basic interactive control over a motor connected to Port A.

Start the program, and play around with it using the instructions printed after start. Start the motors, and check the readings from the tachometer.

	*Task:* What does the tachometer measure?

Let's inspect this program now.

Initialisation
~~~~~~~~~~~~~~

::

	% init the connection
	disp('Connecting ... ')
	% brick usb init
	b = Brick('ioType','usb');
	% beep to indicate connection
	b.beep();

As you know already, ``disp`` outputs a string to the Matlab console. We then initiate a connection via USB to the brick. Note that if you want to run this example through wireless, you could follow the instructions in :doc:`toolkit-setup`, and change this block of code to create a wireless connection. Finally, the successful connection is signalled by a beep.

User input
~~~~~~~~~~

::

	% user input
	userIn = '';
	...
	while(~strcmp(userIn,'f'))
	  % get input
	  userIn = input('> Input(u,d,t,s,b,o,c,v,f): ','s');
	  ...
	end

Your input is monitored in a while loop. The condition for entering the while loop is that the user input (stored in the ``userIn`` variable) be not equal to the letter *f*. So next time you input *f*, the while loop won't be entered, and the program will finish by closing the connection to the brick.

Speed control
~~~~~~~~~~~~~

::

	% increase speed
	if (userIn == 'u')
	  motorPower = motorPower+10;
	  if motorPower >= 100
	    motorPower = 100;
	  end
	  b.outputPower(0,Device.MotorA,motorPower)
	  disp(['> Motor Power: ' num2str(motorPower)]);
	end

When you input the letter *u*, the value of the variable ``motorPower`` is increased by 10. This is communicated to the brick by calling the ``outputPower`` function, specifying the motor port with ``Device.MotorA``, and supplying the power value in ``motorPower``. Note that the motor power is a percentage value in the range ``-100..100``, which is why it is capped at 100 in the code.

Note how the motor power is outputted to the console. First, the number is converted to a string by the ``num2str`` function. This is then combined into a vector of strings using the ``[string1 string2]`` notation. Finally, this vector of strings is passed to the ``disp`` function.

For those interested: the first argument of the ``outputPower`` function is the *usb chain level*. This only matter when you have several bricks chained together via USB cables. In that case you could send commands to other bricks by specifying the appropriate level. Since we will always work with a single brick, the usb chain level should always be 0.

	*Task:* Implement an input method where you can specify the amount by which the motor power should change.

	Hint: You might want to search the internet for a Matlab function that turns strings into integers.

Tachometer
~~~~~~~~~~

::

	% output the tachometer
	if (userIn == 'o')
	tacho = b.outputGetCount(0,Device.MotorA);
	  disp(['> Tachometer: ' num2str(tacho)]);
	end

When you input the letter *o*, the tachometer value of the motor is read an displayed. This value is the angle relative to the last time the tacho was cleared.

	*Task:* Compute the average of all tacho measurements triggered by the input *o*. Output the result when the program is finishing.

	Hint: You might want to store each read value in a vector. Search the internet for how to add values to a vector in Matlab.

Sensor reading
~~~~~~~~~~~~~~

This example program doesn't read from any sensors. For an intro to sensors, check out the :doc:`toolkit-sensors` page.



Motor Control
---------------