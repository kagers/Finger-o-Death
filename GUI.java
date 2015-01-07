import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class GUI extends JFrame implements ActionListener{
    private Container pane, screen, keys;
    private JButton zero, one, two, three, four, five, six, seven, eight, nine,
	add, subt, mult, div, point, clear, enter;
    private JTextArea disp;
    //private JLabel info,output;
    private ArrayList<String> input = new ArrayList<String>();
    private int index = 0;

    public GUI() {
        this.setTitle("TI");
        this.setSize(500,600);
        this.setLocation(100,100);
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
	
	pane = this.getContentPane();
	pane.setLayout(new FlowLayout());
	
	disp = new JTextArea(8,29);
	disp.setEditable(false);

	keys = new Container();
	keys.setLayout(new GridLayout(4,4,4,4));

	zero = new JButton("0");
	zero.setActionCommand("0");
	zero.addActionListener(this);
	one = new JButton("1");
	one.setActionCommand("1");
	one.addActionListener(this);
	two = new JButton("2");
	two.setActionCommand("2");
	two.addActionListener(this);
	three = new JButton("3");
	three.setActionCommand("3");
	three.addActionListener(this);
	four = new JButton("4");
	four.setActionCommand("4");
	four.addActionListener(this);
	five = new JButton("5");
	five.setActionCommand("5");
	five.addActionListener(this);
	six = new JButton("6");
	six.setActionCommand("6");
	six.addActionListener(this);
	seven = new JButton("7");
	seven.setActionCommand("7");
	seven.addActionListener(this);
	eight = new JButton("8");
	eight.setActionCommand("8");
	eight.addActionListener(this);
	nine = new JButton("9");
	nine.setActionCommand("9");
	nine.addActionListener(this);
	add = new JButton("+");
	add.setActionCommand("+");
	add.addActionListener(this);
	subt = new JButton("-");
	subt.setActionCommand("-");
	subt.addActionListener(this);
	mult = new JButton("*");
	mult.setActionCommand("*");
	mult.addActionListener(this);
	div = new JButton("/");
	div.setActionCommand("/");
	div.addActionListener(this);
	point = new JButton(".");
	point.setActionCommand(".");
	point.addActionListener(this);
	enter = new JButton("ENTER");
	enter.setActionCommand("enter");
	enter.addActionListener(this);
	clear = new JButton("CLEAR");
	clear.setActionCommand("clear");
	clear.addActionListener(this);

	keys.add(seven);
	keys.add(eight);
	keys.add(nine);
	keys.add(div);

	keys.add(four);
	keys.add(five);
       	keys.add(six);
       	keys.add(mult);

	keys.add(one);
	keys.add(two);
	keys.add(three);
	keys.add(subt);

	keys.add(zero);
	keys.add(enter);
       	keys.add(clear);
	keys.add(add);

	screen = new Container();
	screen.setLayout(new FlowLayout());
	screen.add(disp);

	pane.add(screen);
	pane.add(keys);

    }
    public void actionPerformed(ActionEvent e){
	String action = e.getActionCommand();
	switch(action){
	case "0": case "1": case "2": case "3": case "4":
	case "5": case "6": case "7": case "8": case "9":
	case "+": case "-": case "*": case "/":
	    input.add(action);
	    break;
	case "clear":
	    input.clear();
	}
	disp.setText(input.toString());	 
	index++;   
    }
    public static void main(String[] args) {
        GUI g = new GUI();
        g.setVisible(true);
    }
}
