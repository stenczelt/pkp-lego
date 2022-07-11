EV3 - Setup
=================================

You will program your EV3 brick using python. We will access the brick interactively and also download programs to it using Visual Studio Code. 


Connecting to the EV3 Brick
---------------------------


Wireless connection works by connecting both your computer and the EV3 brick to the same wireless network. The brick isn't by default capable of connecting to wireless networks: it requires a Netgear dongle. If the dongle is not plugged into the brick, plug in the dongle through the USB port on the EV3, and restart the brick.

Using the EV3 menu, go to **Options > WiFi > Connections**. Select the wireless network you want to connect to, choose the encryption type, and enter the password. **We set up a dedicated wireless network for this course, named "Lego". There is no password, so for the Encryption, select "None"**. The brick's IP address is written on a sticker, but you can verify it under the **WiFi** menu. 

From VSCode, open a Terminal. You can confirm that your connection works by typing ``ping <brick-ip-address>``. The output should look something like the following::

	PING 192.168.1.82 (192.168.1.82): 56 data bytes
	64 bytes from 192.168.1.82: icmp_seq=0 ttl=64 time=61.894 ms
	64 bytes from 192.168.1.82: icmp_seq=1 ttl=64 time=6.645 ms
	64 bytes from 192.168.1.82: icmp_seq=2 ttl=64 time=6.664 ms
	64 bytes from 192.168.1.82: icmp_seq=3 ttl=64 time=6.266 ms

The brick regularly broadcasts information about its connection. If you're on Linux/Mac, you can observe this by typing the following to the Terminal::

	nc -ulk 3015

Interacting with the EV3 brick
-----------------------

Using the Explorer (top left) tab in VSCode, find the "EV3DEV DEVICE BROWSER" item and toggle the arrow, find the "ev3dev" device and click on it. Once the connection is established, the dot next to it turns green. 

You can now connect to the brick, by right-clicking on the green dot, and selecting "Open SSH Terminal". This will open a new window within VSCode and drop you into a linux command shell on the LEGO brick. In order to run python commands on it, type
::
	brickrun -r -- pybricks-micropython

Once in the python environment, import a module
::
	from pybricks.hubs import EV3Brick

Then create a python object that represents the brick
::
	ev3 = EV3Brick()

And now we can issue commands, here is the first one
::
	ev3.speaker.beep()

You can hopefully guess and hear what it did!

You can exit from the python shell by pressing Ctrl-D. This kind of interactive environment is good for learning to use single commands, and sometimes for debugging, but for longer programs, it is cumbersome. Once you have a bigger program, you can download it onto the brick by hovering the cursor above the "EV3DEV DEVICE BROWSER" item and pressing on the down-arrow icon that appears on the right. It downloads the contents of your currently open folder from VSCode. A good way to open a new folder and start coding is by clicking on the EV3 tab (it has the symbol of the lego Mindstorm: <o>, rotated by 90 degrees) on the left and then selecting "Create a new project". It gives you a new file called "main.py" to start with, including some of the necessary import commands to start using motors and sensors. 