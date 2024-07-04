EV3 Sensors Introduction and Low-Pass Filters
============================================================================

The EV3 python interface provides a collection of functions to read sensors and control motors. Here, we will go through an introduction to sensors.


Prerequisites
-------------

This part of the tutorial assumes that you connected to the EV3 in interactive mode, via SSH. Complete the :doc:`ev3-setup` section before proceeding.

Attach a touch sensor to Port 1, the light sensor to Port 2, and the ultrasonic sensor to Port 3. The sensors always need to be attached to the ports marked with numbers. 


Initialise 
----------

Once connected to the brick, launch the built-in python interpreter
::
	brickrun -r -- pybricks-micropython

Then import some python functions
::
  from pybricks.hubs import EV3Brick
  from pybricks.ev3devices import (
    ColorSensor,
    TouchSensor,
    UltrasonicSensor,
  )
  from pybricks.tools import wait


Create a brick object
::
	ev3 = EV3Brick()

And then a sensor object
::
  s = TouchSensor(Port.S1)

Measuring sensor values
------------------------

In order to test the sensor, we don't just want to read it once, we need to read it continuously in a loop, so that when something happens, the change in state is picked up. However, issuing many read commands in rapid succession would overwhelm the brick, so we need to wait a little time between each successive attempt to read the sensor, like so
::
  while True:
    print(s.pressed())
    wait(200)

The `wait` command as above will stop the execution of the program for 200 milliseconds before allowing it to go around the loop again. Run the above program, and then press the touch sensor. To break out of the loop, you can press Ctrl-C. Be careful with such "infinite loops", once you ar not in interactive mode, it is hard to get out of them!

Now try the other sensors. The light sensor is initialised using
::
  s.ColorSensor(Port.S2)

It is multifunctional, it can detect the ambient level of light, the brightness of a reflecting surface, and the colour of a surface. These are accessed by the following challenges
::
  s.ambient()
  s.reflection()
  s.color()

Experiment by interacting with the sensor and note the values you see in each case. What are the minimum and maximum values returned? 

The ultrasonic sensor measures distances. It is initialised using
::
  s.UltrasonicSensor(Port.S3)

and the distance to an object is accessed using
::
  s.distance()

which returns the value in mm. Experiment with measuring distances. There is a minimum and maximum distance between which the sensor is active. At large distances, the size and shape of the object in front of the sensor also matters. 

A Sensory Motor Exercise
------------------------

Try to write a program that turns a motor while a button is pressed and stops the motor when the button is released. 

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

  *Task:* Adapt your code to send the sensor signal through a low-pass filter. Make the smoothing factor easily customisable. Choose a sensor and observe the effects with high and low smoothing factors.

For more details on low-pass filters, check out the `Low-pass filter Wikipedia article <http://en.wikipedia.org/wiki/Low-pass_filter>`_ and the `Exponentially-Weighted Moving Average Wikipedia article <http://en.wikipedia.org/wiki/Exponential_smoothing>`_.
