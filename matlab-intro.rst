Matlab Introduction
==========================================

Matlab is a programming language and tool designed specifically for science applications. Mathematical constructs and operations, such as vectors and matrix multiplications, are first-order elements of this language.

You will program your EV3 brick using a custom Matlab extension by the Queensland University of Technology (`QUT <https://www.qut.edu.au/>`_). But before we get to the EV3-specific commands, we'll look at the core Matlab language first.

Let's dive straight into it!

Starting up
-----------

The computers provided by Pembroke have Matlab installed on them with valid licenses. Note that you won't be able to install Matlab on your personal computer, unless you have your own license.

Matlab gives you an interactive console. Type the following, and observe the results::

	2 + 2

The result is assigned to a special variable called ``it``. You can define your own variables too::

	x = 5
	y = 5 + it
	z = x * y

As we said before, Matlab can also deal with vectors and matrices::

	c = []

accessing elements, ranges

semicolon
disp
tic toc
plot