Matlab Introduction
==========================================

Matlab is a programming language and tool designed specifically for science applications. Mathematical constructs and operations, such as vectors and matrix multiplications, are first-order elements of this language.

You will program your EV3 brick using a custom Matlab extension. But before we get to the EV3-specific commands we'll look at the core Matlab language first.

Let's dive straight into it!



Basics
--------------------

The computers provided by Pembroke have Matlab installed on them with valid licenses. Note that you won't be able to install Matlab on your personal computer unless you have your own license.

Matlab gives you an interactive console. Type the following, and observe the results::

	2 + 2

The result is assigned to a special variable called ``ans``. You can define your own variables too::

	x = 5
	y = 5 + ans
	z = x * y

As we said before, Matlab can also deal with vectors and matrices::

	a = [1 2 3 4 5]
	b = [2 2 2 2 2]
	c = a + b

These were *row vectors*. You can also create *column vectors*::

  d = [1
  2
  3]
  e = [1; 2; 3]

Matlab gives you convenient ways to access both single elements and ranges::

  a(1)
  a(2:4)

Similarly, you can create matrices and access their elements::

  m = [1 2 3 4 5
  6 7 8 9 10
  11 12 13 14 15]
  m(2, 3)    % will show 8
  m(:, 3)    % will show [3; 8; 13]
  m(2:3, :)  % will show [6 7 8 9 10; 11 12 13 14 15]

When accessing matrix row/columns, ``:`` without numbers denotes the whole range.

You might have noticed that for everything you type, Matlab echoes the resulting value. You can hide values of intermediate computations by putting a semicolon at the end of your expression::

  a = 13;
  b = 21;
  c = a + b;
  c * c



Intermediate constructs
----------------------------

The ``randi(range, rows, columns)`` function creates a matrix of size ``rows x columns`` filled with numbers uniformly distributed between ``1..range``.

  *Task:* Generate a random column vector of size :math:`100 \times 1` with the numbers ranging between 1 and 10.

  *Task:* Use the ``size(matrix)`` function to confirm the size of the resulting vector.

In Matlab, it is very easy to create plots. Simply pass in your vector to the ``plot`` function.

  *Task:* Use the ``plot(vector)`` function to visualise your random vector.

  *Task:* Use the ``grid on``, ``xlabel(label)``, and ``ylabel(label)`` functions to customise your graph.

You can use a *for loop* to iterate through a series of values. For example, the following piece of code displays the numbers from 1 to 100::

  for i = 1:100
    disp(i)
  end

What happens is that the variable ``i`` takes on the values 1 to 100 in turn, and then the body of the loop (the ``disp(i)`` command) is executed with each value.

  *Task:* Use a for loop to display each number in your random vector.

*if conditions* let you execute different code based on some condition::

  if mod(x, 2) == 0
    disp(['The number', num2str(x), 'is even'])
  else
    disp(['The number', num2str(x), 'is odd'])
  end

This piece of code tests whether the number ``x`` is even or odd, and displays some text depending on that. Note how we display strings and numbers together by first converting the number to a string (``num2str(x)``) and then combining the strings into a vector.

Finally, another useful pair of commands is ``tic`` and ``toc``. ``tic`` resets Matlab's internal stopwatch, while ``toc`` outputs its value. Type ``tic`` and ``toc`` a few times to observe how it works.




Exercises
--------------

The following exercises require functions that don't appear in this tutorial. Use Google or the Matlab help to find relevant functions.

  *Task:* Generate a random matrix of size :math:`n \times m` and visualise it using a heatmap, a 3D plot, or otherwise.

  *Task:* Implement a Low-Pass Filter as described in the :doc:`toolkit-sensors` page.

