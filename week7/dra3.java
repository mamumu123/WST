import java.applet.*;
import javax.swing.*;
import java.awt.*;

public class dra3 extends Applet {
	
	private int height;
	private int width;
	private Color color;
  public void init(){
	  height=Integer.parseInt(getParameter("height1"));
	  System.out.println(height);
	  

	  width=Integer.parseInt(getParameter("width1"));
	  System.out.println(width);
	  color=new Color(Integer.parseInt(getParameter("color"),16));
	  System.out.println(width);
	  //color=Color.parseColor(getParameter("color"));
  }
  public void paint(Graphics g){
	  g.setColor(Color.red);
	  int x=50,y=100;
	  g.fillRect(x,y,100,50);

	  g.setColor(Color.green);
	  g.fillOval(x+200,75,100,100);

	  g.setColor(color);
	  g.fillRect(x+370,75,width,height);

  }

}