Frequently Asked Questions
==========================================

Why do I receive a "hidapi write error"?
----------------------------------------

This normally happens when a USB connection is still open to the brick. Run ``delete(b)`` (where ``b`` is the variable for the brick) to end the connection. If this doesn't work, restart Matlab.

My card doesn't let me in to the Engineering Department
--------------------------------------------

First of all, make sure that you're using your plain white Pembroke card. (The Union and the King's cards won't work.)

Next, go to the Pembroke main gate, and refresh your card permissions by touching your card against the grey box. If you're unsure where to do it, ask for help at the Porters' Lodge.

If your card still doesn't work, get in touch with the instructors and the PKP course management.

I can't get into LR3!
--------------------------------------------

You need to clear the door lock by pressing ``C`` before entering the access code!

The brick doesn't connect to the WiFi network
-----------------------------------------

You can confirm that the wireless dongle works by checking whether the blue light on the dongle is on/blinking.

If it is not, try the following steps:

#. Turn off the brick.
#. Unplug the dongle.
#. Turn on the brick.
#. Once turned on, plug in the dongle.

The blue light should be on/blinking now, and you should be able to connect.

Sometimes the WiFi can be a little bit temperamental - I often find searching for a connection takes two attempts to find WiFi networks. 

Matlab keeps crashing!
-----------------------------------------
There are often problems with Matlab crashing if a brick hasn't been deleted as is recreated. This can be remedied by ensuring that bricks are deleted e.g. ``delete(b)``. Also, add the command ``clearvars`` at the start of each program. 

