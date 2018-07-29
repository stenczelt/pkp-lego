EV3 Matlab Toolkit - Setup
=================================

You will program your EV3 brick using a custom Matlab extension from the Queensland University of Technology. Their information on the library can be found on the `QUT EV3 Matlab toolkit <https://wiki.qut.edu.au/display/cyphy/QUT+EV3+MATLAB+toolkit>`_ page: use this page for reference. Here we will give you a quick introduction to the library.



Getting the library
--------------------

You can download a locally cached zip here: :download:`EV3-2014-07-16.zip<resources/EV3-2014-07-16.zip>`.

Unzip this folder (for example, to your home directory). Take note of the path (such as ``C:\pkp-lego\EV3``). In this documentation, we will reference this path as ``<EV3>``.



Adding the library to Matlab
----------------------------

The library you downloaded is a collection of Matlab files. You can use this extension by including its files *on the path* so that they become available in your normal code.

Under the Home ribbon and the Environment tab, go to **Set Path** and add the ``<EV3>`` path to the Matlab path.

On some installations of Matlab, this might require Administrator privileges, so if you get this error, and you don't have admin rights, then simply keep all your own files in the same ``<EV3>`` directory, and it should all work - the current directory is always included on the path. 


Connecting to the EV3 Brick
---------------------------

USB
~~~

The easiest way to connect is by USB. Connect the EV3 brick to the computer.

You can confirm that your connection works by typing in Matlab::

	b = Brick('ioType','usb')

If your connection is successful, you should't get any error messages.

Note that if you want to create another connection, you have to first close this existing one by typing::

	delete(b)


WiFi
~~~~

Wireless connection works by connecting both your computer and the EV3 brick to the same wireless network. The brick isn't by default capable of connecting to wireless networks: it requires a Netgear dongle. Plug in the dongle through the USB port on the EV3, and restart the brick.

On the EV3 menu, go to **Options > WiFi > Connections**. Select the wireless network you want to connect to, choose the encryption type, and enter the password. **We set up a dedicated wireless network for this course, named "PKP-Lego". There is no password, so for the Encryption, select "None"** Note that the capitalization matters. Take note of the brick's IP address by going to **Options > WiFi > <your-connection>**.

On Linux/Mac, open a Terminal. On Windows, go to **Start > Run** and type **cmd**. You can confirm that your connection works by typing ``ping <brick-ip-address>``. The output should look like the following::

	PING 192.168.1.82 (192.168.1.82): 56 data bytes
	64 bytes from 192.168.1.82: icmp_seq=0 ttl=64 time=61.894 ms
	64 bytes from 192.168.1.82: icmp_seq=1 ttl=64 time=6.645 ms
	64 bytes from 192.168.1.82: icmp_seq=2 ttl=64 time=6.664 ms
	64 bytes from 192.168.1.82: icmp_seq=3 ttl=64 time=6.266 ms

The brick regularly broadcasts information about its connection. If you're on Linux/Mac, you can observe this by typing the following to the Terminal::

	nc -ulk 3015

To open the wireless connection in Matlab, you need to give Matlab access to a java class file ``OutputStreamSend.class`` to the Matlab *java classpath*. To do this,  Add this file to the Matlab java classpath by typing ``javaaddpath('<EV3>')``. 

Type the following in Matlab::

	b = Brick('ioType','wifi','wfAddr','<brick-ip-address>','wfPort',5555,'wfSN','<brick-serial-number>')

For example, I typed the following for my connection::

	b = Brick('ioType','wifi','wfAddr','192.168.1.104','wfPort',5555,'wfSN','001653444434')

If your connection is successful, you should't get any error messages.

Note that if you want to create another connection, you have to first close this existing one by typing::

	delete(b)



Ending the connection
---------------------

Before you can start a new connection, you have to end the previous one. This is particularly important if your program didn't finish normally.

You can end your connection by typing::

	delete(b)

Here, ``b`` is the variable for the brick to which you connected.
