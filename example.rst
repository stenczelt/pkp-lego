reStructuredText examples
==========================================

Text sample
-----------

This is *emphasis*, **strong**, and ``literal``.

We also have :subscript:`subscript` and :superscript:`superscript`.

Nested bulleted and numbered lists:

* Line
* Line

  * Line
  * Line

* Line

#. Line
#. Line
#. Line

Definition of a term:
	This is a real definition.

Let's do some quoted text:

	Miert a kolostorban keressuk a kurvat?

Here is some block code::

	if (x) {
	  halt();
	}

	if (halt(P)) run();

End of section.

Math sample 
-----------

:math:`\int_{a}^{b} f\,dx`

Inline math: :math:`a^2 + b^2 = c^2`.

Block math:

.. math::

   \begin{aligned}
   \dot{x} &amp; = \sigma(y-x) \\
   \dot{y} &amp; = \rho x - y - xz \\
   \dot{z} &amp; = -\beta z + xy
   \end{aligned}


Configuring math: http://sphinx-doc.org/ext/math.html#module-sphinx.ext.mathjax

Using math: http://sphinx-doc.org/latest/ext/math.html