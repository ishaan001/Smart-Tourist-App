package DB_user_ins_del;
import config.DBConnection;
import java.sql.*;
import Bean.UserBean;
import javax.sql.*;

import Mail.MailForgotPass;
import Mail.MailForgotPass.*;

public class Profile {
	public static String addUSER(UserBean ub1)
	{
		int i=0;
		String s="success";
		Connection con=DBConnection.getConnection();
		try {
				PreparedStatement ps=con.prepareStatement("insert into loginDetail values(?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,ub1.getUsername());
				ps.setInt(2, ub1.getAge());
				ps.setString(3, ub1.getGender());
				ps.setString(4, ub1.getCity());
				ps.setString(5,ub1.getState());
				ps.setString(6,ub1.getCountry());
				ps.setString(7,ub1.getPass());
				ps.setString(8,ub1.getEmail());
				ps.setString(9,ub1.getType());
				ps.setInt(10,ub1.getPin());
				i=ps.executeUpdate();
			}
		catch(Exception e)
		{
			System.out.println(e);
			e.printStackTrace();
		}
		if(i>0)
		{
			return s;
		}
		else
		{
			return "Error SOMEWHERE";
		}
		
	}
	public static String searchUSER(UserBean ub2)
	{
		//Boolean flag=false;
		//String sent="Error Somewhere";
		Connection con=DBConnection.getConnection();
		String uemail=null;
		String upass=null;
		Connection con1=DBConnection.getConnection();
		String uname=ub2.getUsername();
		System.out.println(uname);
		try {
			Statement st = con1.createStatement();
			ResultSet rs=st.executeQuery("select * from logindetail where Cname='"+uname+"'");
			while(rs.next())
			{
				upass=rs.getString(7);
				uemail=rs.getString(8);
				//flag=true;
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		MailForgotPass mfp=new MailForgotPass();
		String returned=mfp.SendMail(uemail,upass);
		if(returned.equals("success"))
			return "success";
		else
			return "failure";
		
	}
	public static String ReDirect(UserBean ub3)
	{
		int uid=0;
		String utype=null;
		Connection con=DBConnection.getConnection();
		Connection con1=DBConnection.getConnection();
		String uname=ub3.getUsername();
		String upass=ub3.getPass();
		System.out.println(uname);
		try {
			Statement st = con1.createStatement();
			ResultSet rs=st.executeQuery("select * from logindetail where Cname='"+uname+"' and  pass='"+upass+"'");
			if(rs.next())
			{
				utype=rs.getString(9);
				//flag=true;
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return  utype;
	}

}
