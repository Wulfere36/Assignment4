package Assign4;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class WelcomeTLD extends SimpleTagSupport {
	private String color;
	
	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		super.doTag();
		JspWriter out = getJspContext().getOut();
		out.print("<span style='color:"+color+"'>");
		getJspBody().invoke(null);
		out.print("</span>");
	}
	
	
}
