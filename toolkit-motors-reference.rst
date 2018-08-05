EV3 Matlab Toolkit - Motors Reference
============================================================================

Ports
-----

You can reference the available ports in the sensor commands using the following constants:

* ``Device.MotorA``
* ``Device.MotorB``
* ``Device.MotorC``



Break types
------------

You can stop the motor with two different brake types:

* ``Device.Brake`` -- attempt to stop the motor instantly
* ``Device.Coast`` -- slowly wind down the motor to a complete stop



Commands
---------

outputStop(layer, nos, brake)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Stops a motor.

::

  b.outputStop(0, Device.MotorA, Device.Brake);

outputStopAll()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Stops all motors.

::

  b.outputStopAll();

outputPower(layer, nos, power)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sets motor output power. Note that if power is negative, the motor direction is reversed. 

::

  b.outputPower(0, Device.MotorA, 50);

outputStart(layer, nos)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Starts a motor. 

::

  b.outputStart(0, Device.MotorA);

outputTest(layer, nos)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Tests whether or not a motor is busy (0 is ready, 1 is busy).

::

  state = b.outputTest(0, Device.MotorA);

outputStepSpeed(layer, nos, speed, step1, step2, step3, brake)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Moves a motor to a set position with layer, NOS, speed, ramp up angle, constant angle, ramp down angle and brake type.

::

  b.outputStepSpeed(0,Device.MotorA,50,50,360,50,Device.Coast);

outputClrCount(layer,nos)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Clear a motor tachometer.

::

  b.outputClrCount(0,Device.MotorA);

outputGetCount(layer,nos)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Returns the tachometer of a motor.

::

  tacho = b.outputGetCount(0,Device.MotorA);
