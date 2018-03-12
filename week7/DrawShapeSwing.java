import java.applet.*;
import javax.swing.*;
import java.awt.*;
import java.lang.reflect.Field;


public class DrawShapeSwing extends JApplet {
  Container messageArea = getContentPane();
  MessagePanel myMessagePanel = new MessagePanel(this);
  public void init() {
    setSize(500,500);
    messageArea.add(myMessagePanel);
  }
}
class MessagePanel extends JPanel {
  DrawShapeSwing ja;
  MessagePanel(DrawShapeSwing temp){
    ja = temp;
  }
  public void paintComponent(Graphics g) {
    super.paintComponent(g);
    g.setColor(Color.red);
    g.drawRect(0,0,50,50);
  //  g.setColor(Color.red);
    g.fillRect(0,60,50,50);
    g.setColor(Color.green);
    g.drawOval(160,100,40,40);
  //  g.setColor(Color.green);
    g.fillOval(100,100,40,40);

    String strShape = ja.getParameter("shape");
    //System.out.println(strShape);

    String strColorFormat = ja.getParameter("colorFormat");
    Color color = Color.black ;
    if(strColorFormat.equals("RGB")){
      int RED = Integer.parseInt(ja.getParameter("RED"));
      int GREEN = Integer.parseInt(ja.getParameter("GREEN"));
      int BLUE = Integer.parseInt(ja.getParameter("BLUE"));
      try{

        color = new Color(RED,GREEN,BLUE);
      }
      catch(Exception e){
        color = Color.black;
        System.out.println("Cannot convert provided RGB values into a Color Object");
      }
    }else if(strColorFormat.equals("STR")){
      try{
        String strColor = ja.getParameter("color");
        Field field = Color.class.getField(strColor);
        color = (Color)field.get(null);
      }
      catch(Exception e){
        color = Color.black;
        System.out.println("Can't convert string to Color Object");
      }

    }
    g.setColor(color);
    switch(strShape){
      case "3DRect":
      g.fill3DRect(200,200,100,50,true);
      break;
      case "Arc":
      g.fillArc(200,200,100,50,30,120);
      break;
      case "Line":
      g.drawLine(200,200,250,300);
      break;
      case "Oval":
      g.fillOval(200,200,40,50);
      break;
      case "Polygon":
      int[] xPoints = {200,220,240,250,260,270};
      int[] yPoints = {200,230,250,260,270,350};
      g.fillPolygon(xPoints,yPoints,6);
      break;
      case "Rect":
      g.fillRect(200,200,50,40);
      break;
      case "RoundRect":
      g.fillRoundRect(200,200,50,40,30,30);
      break;
    }

  }
}
