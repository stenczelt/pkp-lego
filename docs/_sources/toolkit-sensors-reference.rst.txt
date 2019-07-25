EV3 Matlab Toolkit - Sensors Reference
============================================================================

Ports
-----

You can reference the available ports in the sensor commands using the following constants:

* ``Device.Port1``
* ``Device.Port2``
* ``Device.Port3``
* ``Device.Port4``



Modes
-----

You can reference the available modes in the sensor commands using the following constants:

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



Commands
---------

inputDeviceGetName(layer, no)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Returns the name of the device or sensor connected. For example, the ultrasonic sensor in centimetre mode would return 'US-DIST-CM'.

::

  name = b.inputDeviceGetName(0, Device.Port1);



inputDeviceSymbol(layer, no)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Returns the symbol of the current mode. For example, the ultrasonic sensor in centimetre mode would return 'cm'.

::

  name = b.inputDeviceGetName(0, Device.Port1);



inputDeviceClrAll(layer)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Clears the sensors.

::

  name = b.inputDeviceClrAll(0);



inputReadSI(layer, no, mode)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Reads the value of a connected sensor using the given mode.

::

  reading = b.inputReadSI(0, Device.Port1, Device.USDistCM);
  reading = b.inputReadSI(0, Device.Port1, Device.Pushed);



plotSensor(layer, no, mode)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plots the device or sensor output to MATLAB.

::

  b.plotSensor(0, Device.Port1, Device.USDistCM);
  b.plotSensor(0, Device.Port1, Device.GyroAng);



displayColor(layer, no)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Displays the color read by an attached color sensor.

::

  b.displayColor(0, Device.Port1);
