Matlab Reference
==========================================
Note that this is a very brief introduction to everything you can do with Matlab. The online reference is very detailed (https://www.mathworks.com/help/matlab/)

Variables and assignment
--------------------------

Variables store data, such as numbers, vectors, matrices, strings. You assign values to variables by the ``=`` operator::

  myVar = [1 2 3]

You can reassign variables::

  myVar = 'I love Matlab'

You can use variables (and their values) by simply using their names::

  disp(myVar)



ans
----

The special variable ``ans`` contains the value of the last evaluated expression. You can reference it as any other variable, but you cannot assign values to it.



Semicolon
---------

If you put a semicolon at the end of a line, the result of the expression is hidden::

  a = 4;  % doesn't display anything
  b = 3   % prints 3



Vectors and matrices
--------------------

You can build matrices by the following syntax::

  m = [1 2 3 4
  5 6 7 8
  9 10 11 12]

This creates a :math:`3 \times 4` matrix.

Note that in other languages, such as C, whitespace (such as newlines) don't matter. In Matlab, it does make a difference. For example, the following command creates a :math:`1 \times 12` matrix (a vector), which is different from the one above::

  m2 = [1 2 3 4 5 6 7 8 9 10 11 12]

A matrix which has only one row or one column is called a vector. You can create row and column vectors with the following syntax::

  vRow = [1 2 3]
  vColumn = [1
  2
  3]
  vColumn2 = [1; 2; 3]  % this also creates a column vector

You can access elements by specifying the row and column indices, or ranges::

  vRow(2)    % prints 2
  vRow(2:3)  % prints [2 3]
  m(2, 3)    % prints 7 (2nd row, 3rd column)
  m(2, 3:4)  % prints [7 8]
  m(2, :)    % prints [5 6 7 8]



Strings
-------

You can create string literals using single quotes::

  'This is a character array'
  "This is a string"
  myString = "A string"
  myCharArray = 'My char array'

  Please note that there is actually a difference between a string and a character array! Most of the time it doesn't matter, but sometimes its worth switching which is used if Matlab is throwing an error. 

Command history
---------------

Use the up and down arrows to browse and edit your command history. This way you don't have to always retype all commands.



Terminating scripts
-------------------

If you're running a script or writing a command and you want to exit it, hit Ctrl+C on the keyboard.



Equality operator
-----------------

To compare two values for equality, we use the ``==`` operator. For example::

  if a == b
    disp('Equal!')
  else
    disp('Not equal')
  end

Note that ``==`` is different from ``=``. The former tests for equality; the latter is the assignment operator.

You can also test for inequality using the ``~=`` operator.



Comments
--------

Comments are part of a Matlab program that are completely ignored by the Matlab interpreter. However, they are indispensable for explaining and documenting your code.

You can add comments using the ``%`` sign::

  % This is a comment and it doesn't affect the program flow
  a = [1 2 3]  % I can even add comments to the ends of lines



Conditionals (ifs)
------------------

You can alter the control flow of your program based on certain conditions. For example::

  if mod(x, 2) == 0
    disp(['The number', num2str(x), 'is even'])
  else
    disp(['The number', num2str(x), 'is odd'])
  end

In this case, only one of the two display lines will be executed, depending on whether ``x`` is odd or even.

You don't have to specify an ``else`` branch for your conditional::

  if a < 0
    disp('a cannot be negative!')
  end

  

For loops
---------

You can use a *for loop* to iterate through a series of values. For example, the following piece of code displays the numbers from 1 to 100::

  for i = 1:100
    disp(i)
  end

What happens is that the variable ``i`` takes on the values 1 to 100 in turn, and then the body of the loop (the ``disp(i)`` command) is executed with each value.

If you specifically want to iterate over an array, you can use the following syntax::

  for element = my_list
    % do something with the element!
  end


Functions
---------

Functions are shorthands to use more complex computations. You can define your own functions, but there are also lots and lots of built-in ones in Matlab.

In the below, we explain functions using their *signatures*. For example, the ``size(matrix)`` function returns the size of a matrix. ``size`` is the *name* of the function, while ``matrix`` is its only *argument*. You can use functions by specifying their names and supplying appropriate arguments; for example, ``size([1 2 3])``.

disp(value)
~~~~~~~~~~~

You can print values using the ``disp`` command. It will attempt to convert whatever value you give it to a string::

  disp(3)
  disp('Lego robot')
  disp(['My favourite number is ', num2str(favNumber)])

mod(number, divisor)
~~~~~~~~~~~~~~~~~~~~

The ``mod`` function returns the remainder of a number for a given divisor. For example::

  mod(10, 4)  % this will print 2

randi(range, rows, columns)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Generates a matrix of size ``rows x columns`` filled with integers uniformly distributed between 1 and ``range``. For example::

  randi(10, 3, 4)

size(matrix)
~~~~~~~~~~~~

Returns the size of a matrix (or vector).

plot(vector)
~~~~~~~~~~~~

Plots a graph using the values in the vector.

The ``plot`` command provides lots of ways to customise your graph. Search online for the Matlab plot command for more details.

Also check out the ``xlabel(label)``, ``ylabel(label)`` and ``grid on`` commands.

tic, toc
~~~~~~~~

``tic`` resets Matlab's internal stopwatch. ``toc`` returns its current value.

Making you own function
~~~~~~~~~~~~~~~~~~~~~~~
Making your own function is simple. The syntax to create a function is::

  function [y1, ..., yM] = myfun(x1, ..., xM)
    % do some things 
  end

Where the function takes input *parameters* ``x1, ..., xM`` and returns the values of ``y1, ... yM``. To call this function, you need to call ``myfun(arguments)``.

If you dont need to return or input anything to the function, you can use the following syntax::

  function myfun()
    % do some things
  end

** Note that functions must be saved in a file consisting only of functions. Furthermore, the name of the file must match the name of the first function in the file ** e.g. for above, the file should be called ``myfun.m``.

