Finger-o-Death
==============
##Purpose:

A TI style graphing calculator with powers including math, and graphs.<br>
Originally planned in Java and Processing, but now is full-on Processing.<br>
Some buttons do not work by design.<br>
Be safe around floating point arithmetic -- don't forget how easily in can *double*-cross you.<br>
Remember to turn on first, and happy mathing!<br>

##log(development):

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

**2015-01-14:**<br>
K fixed a minor function evaluation problem and proceeded to add function evaluation stuff to processing file.
K made said function buttons work.
M added graphing and created the Y= and GRAPH screens.

**2015-01-15:**<br>
K made the result be rounded to 10 decimal places when appropriate so that the answer doesn't *float* away from you.
K made it so that if all of the parentheses aren't closed it closes them itself.

**2015-01-16:**<br>
K made storing of variables a reality and made pi and Euler's constant things work.
M made graph use Xmin, Xmax, Xscl, Ymin, Ymax, and Yscl.

**2015-01-17:**<br>
K changed storage of entries so that it doesn't erase past things when scrolling.
K began fixing of cursor movement.
M made graph into a class.

**2015-01-18:**<br>
M made working Window and Zoom screens.
M started on error handling.

**2015-01-19:**<br>
K worked on visuals and continued improving cursor movement
M worked on error handling/ made the error handling have less errors

**2015-01-20:**<br>
K made the buttons that are only for display purposes do nothing, and eliminated the unecessary 2nd and Alpha functions.
K fixed errors in scrolling.
M fixed errors in using the negative sign.
K and M fixed various other errors.
M greatly improved error handling
