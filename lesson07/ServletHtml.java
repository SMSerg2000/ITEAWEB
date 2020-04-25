package less07;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletHtml extends HttpServlet{
	
		PrintWriter out;

		public static final String result = "<h1>HELLO, Serg!!!</h1>";

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			out = resp.getWriter();
			out.write("<html>");
			for (int i=1; i<100000; i++) {
			out.write(result);
			}
			out.write("</html>");
		}
}