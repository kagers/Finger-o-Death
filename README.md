Finger-o-Death
==============
##Purpose:

A TI style graphing calculator with powers including math, graphs, and TI BASIC.<br>
Originally planned in Java and Processing, but now is full-on Processing.

##DevLog:

**2015-01-05:**<br>
K and M both worked on basic arithmetic evaluation using order of operations for +, -, *, and /.
Two different approaches were implemented, in Parse.java and Arithmetic.java, respectively.

**2015-01-06:**<br>
K started the GUI; M used code from Parse.java to make Evaluation.java.

**2015-01-07:**<br>
M worked on evaluateParens() for parentheses; works in some cases but bugs in others.
K fixed aforementioned bugs as well as subsequent bugs that arose from the first bug fix.

**2015-01-08:**<br>
M moved Evaluation.java code into a processing file and began work on the Processing display.
K used the *power* of recursion to change/simplify evaluateMath(), and made the order of operations more *power*ful.

**2015-01-09:**<br>
K and M fixed a bug in class where the calculator refused to deal with parentheses,
and then found another bug where the wrong output was produced in certain cases.
K fixed this bug by changing some things in evaluateMath(), and started a basic error handling mechanism.

**2015-01-10:**<br>
K changed the display so that an ArrayList is always displayed, rather than text being printed if entered.
K also made it so that if enter is pressed with no input, the previous entry is evaluated. The last output is now stored in Ans.

**2015-01-12:**<br>
K worked on using function calls like log() and sin().
M added buttons to display.

**2015-01-13:**<br>
M added 2nd and ALPHA text on buttons.
M made it detect mode (normal, 2nd, or ALPHA) and input values accordingly.
M experimented with graphing. Results are not yet added to the project.
K made functions functional???
