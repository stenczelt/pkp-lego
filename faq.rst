Frequently Asked Questions
==========================================

Why do I receive a "hidapi write error"?
----------------------------------------

This normally happens when a USB connection is still open to the brick. Run ``delete(b)`` (where ``b`` is the variable for the brick) to end the connection. If this doesn't work, restart Matlab.

