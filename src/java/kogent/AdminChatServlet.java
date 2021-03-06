package kogent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





public class AdminChatServlet extends HttpServlet
{
    
	public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException{
		doPost(request, response);		
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException{
		HashMap hashmap = null;		
		try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:virt_desk_db");
		synchronized(getServletContext()){
		    hashmap = (HashMap)getServletContext().getAttribute("roomList");
            if(hashmap == null)
            {
                
				hashmap = new HashMap();
				Statement stmt = con.createStatement();
				String query = "select * from classrooms";
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
                                {
                                    String room_name=rs.getString(1).trim();
					hashmap.put(room_name, new ChatRooms (room_name, rs.getString(2).trim(), 4));
				}
				rs.close();
				getServletContext().setAttribute("roomList", hashmap);
				
            }
        }
        //Removing Rooms
		String rooms[] = request.getParameterValues("remove");
        synchronized(hashmap){
            if(rooms != null){
				String deletequery = "delete from classrooms where roomname=?" ;
				PreparedStatement pstate = con.prepareStatement(deletequery);
                for(int i = 0; i < rooms.length; i++){				 	
					pstate.setString(1,rooms[i]);
					pstate.executeUpdate();
					hashmap.remove(rooms[i]);				
                }
				pstate.close();	
            }
        }
        //adding room.
		String roomname = request.getParameter("roomname");
        String roomdesc = request.getParameter("roomdescr");
		
        if(roomname != null && roomname.length() > 0){
            synchronized(hashmap){
					String deletequery = "insert into classrooms values(?, ?)" ;
					PreparedStatement pstate = con.prepareStatement(deletequery);
					pstate.setString(1,roomname);
					pstate.setString(2,roomdesc);
					pstate.executeUpdate();
					pstate.close();
					hashmap.put(roomname, new ChatRooms (roomname, roomdesc, 4));
            }
        }
		con.close();
		
		}catch(SQLException e){}
		catch(ClassNotFoundException e){}
        RequestDispatcher view=request.getRequestDispatcher("config_room.jsp");
		view.forward(request, response);
		
    }
}
