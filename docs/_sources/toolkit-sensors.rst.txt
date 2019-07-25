EV3 Matlab Toolkit - Sensors Introduction and Low-Pass Filters
============================================================================

The EV3 Matlab toolkit provides a collection of functions to read sensors and control motors. Here, we will go through an example program to analyse and manipulate sensor data.



Prerequisites
-------------

This part of the tutorial assumes that you connected Matlab to the EV3 via USB or wireless. Complete the :doc:`toolkit-setup` section before proceeding.

Also attach the touch sensor to Port 1 on your brick.

Don't forget that when you want to start a new connection, you have to end the previous one first with ``delete(b)``.



Example program
---------------

Download the :download:`plotSensor.m <resources/plotSensor.m>` file and open it in Matlab.

This example program demonstrates how to read sensor values and display them on a graph.

The program is by default configured to show whether the touch sensor (attached to Port 1) is pressed or not. It also assumes that you connected your brick to the laptop via USB: change the brick initialisation line accordingly if you're using wireless.

Start the program, and start pressing the touch sensor.

	*Task:* Is there any *latency* in the change appearing on the graph after you press the button?

Let's inspect this program now.



Configuration
~~~~~~~~~~~~~

The first few lines allow you to choose how to connect to the brick, which sensor type to monitor, and on which port::

  brick = Brick('ioType','usb')  % potentially change this to WiFi connection
  layer = 0  % the usb chain layer (always 0 in this course)
  no = Device.Port1  % the port number the sensor is attached to
  mode = Device.Pushed  % the sensor mode from types.html

You can use any of the 4 available ports as the sensor port.

You can use the following sensor modes:

* Touch sensor

  * ``Device.Pushed`` -- Returns 1 if the touch sensor is pushed otherwise 0.
  * ``Device.Bumps`` -- Returns the number of touch sensor bumps since the last reset.

* Color sensor

  * ``Device.ColReflect`` -- Measures the reflected light intensity from 0% to 100%.
  * ``Device.ColAmbient`` -- Measures the ambient light intensity from 0% to 100%.
  * ``Device.ColColor`` -- Returns the detected color where '0' is no color, '1' is black, '2' is blue, '3' is green, '4' is yellow, '5' is red, '6' is white and '7' is brown.

* Ultrasonic sensor

  * ``Device.USDistCM`` -- Measures the ultrasonic distance in centimeters (max 255 cm).
  * ``Device.USDistIN`` -- Measures the ultrasonic distance in inches (max 100 inches).
  * ``Device.USListen`` -- Returns 1 if an ultrasonic signal is detected otherwise 0.

* Gyro sensor

  * ``Device.GyroAng`` -- Measures the rotation angle in degrees since the last reset.
  * ``Device.GyroRate`` -- Measures the rotation rate in degrees per second.



Initialisation
~~~~~~~~~~~~~~

::

  % start timing
  tic;
    
  % create figure
  hfig = figure('name', 'EV3 Sensor');
  
  % init the the data
  t = 0;
  x = 0;
  hplot = plot(t,x);
  
  % one read to set the mode
  reading = brick.inputReadSI(layer, no, mode);
  
  % set the title
  name = brick.inputDeviceGetName(layer, no);
  title(['Device name: ' name]);
  
  % set the y label
  name = brick.inputDeviceSymbol(layer, no);
  ylabel(['Sensor value (' name(1 : end - 1) ')']);
  
  % set the x label
  xlabel('Time (s)');
  
  % set the x axis
  xlim([0 10]);

As you know already, ``tic`` starts a timer, the current value of which we can read by ``toc``. We then create a Matlab figure and set its labels and axes.



Main loop
~~~~~~~~~~

::

	% wait until the figure is closed
	while(findobj('name','EV3 Sensor') == 1)
    ...
  end

The readings are collected in a while loop. The loop is exited when the object named ``'EV3 Sensor'`` is not available anymore: that is, when the figure has been closed.



Readings
~~~~~~~~~~~~~

::

  % get the reading
  reading = brick.inputReadSI(layer, no, mode);
  t = [t toc];
  x = [x reading];
  set(hplot, 'Xdata', t)
  set(hplot, 'Ydata', x)
  drawnow
  
  % reset after 10 seconds
  if (toc > 10)
    % reset
    t = 0;
    x = x(end);
    tic
  end

You get your reading by calling ``inputReadSI`` on the brick. The reading is then collected into a vector called ``x``. The figure is updated with the current time and the latest reading, and then redrawn.

Finally, the figure is reset every 10 seconds by resetting the ``t`` and ``x`` vectors and restarting the timer.

	*Task:* Currently the figure is reset every 10 seconds. Make this a configurable parameter at the top of the program.



Other sensor values
--------------------

You can easily change the program to plot colour, gyro, and ultrasonic sensor readings too.

  *Task:* Attach the colour sensor and try the ``Device.ColReflect`` and ``Device.ColAmbient`` modes. When would you use which?

  *Task:* Attach the gyro sensor and try the ``Device.GyroAng`` and ``Device.GyroRate`` modes. What does each measure?

  *Task:* Attach the ultrasonic sensor and try the ``Device.USDistCM`` mode. How far does it seem to measure well? How precise does it seem to be?



Low-pass filters
------------------

You might notice that the signal you see is sometimes noisy or changes too sharply. One way to mitigate these sharp changes is to send the signal through a *low-pass filter*. This is called a low-pass filter because it filters out high frequencies, that is, sharp changes.

A discrete implementation of the low-pass filter is called the *Exponentially-Weighted Moving Average*. It is computed as the following. Imagine that the original values you read are :math:`x_0, x_1, x_2\ldots`. We choose a *smoothing factor* :math:`\alpha`, which determines how aggressively we'll filter the signal. Then to compute the filtered values :math:`y_0, y_1, y_2\ldots`:

.. math::

 \begin{aligned}
 y_0 &= x_0 \\
 y_{k+1} &= \alpha x_{k+1} + (1 - \alpha) y_k
 \end{aligned}

In other words, the first value is take as it is, but all following values are weighted by the smoothing factor :math:`\alpha` and combined with the previous value.

  *Task:* What does it mean if the smoothing factor is 0 or 1?

  *Task:* Adapt your plotSensor code to send the signal through a low-pass filter. Make the smoothing factor easily customisable. Choose a sensor and observe the effects with high and low smoothing factors.

For more details on low-pass filters, check out the `Low-pass filter Wikipedia article <http://en.wikipedia.org/wiki/Low-pass_filter>`_ and the `Exponentially-Weighted Moving Average Wikipedia article <http://en.wikipedia.org/wiki/Exponential_smoothing>`_.
