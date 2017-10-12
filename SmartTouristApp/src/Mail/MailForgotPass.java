package Mail;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.*;
import javax.mail.*;
import javax.activation.*;
import DB_user_ins_del.Profile.*;
import Bean.UserBean;
import Bean.UserBean.*;

public class MailForgotPass {
	public static String SendMail(String email,String Pass)
	{
		String uemail=email;
		String pass=Pass;
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		  // Get a Properties object
		     Properties props = System.getProperties();
		     props.setProperty("mail.smtp.host", "smtp.gmail.com");
		     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		     props.setProperty("mail.smtp.socketFactory.fallback", "false");
		     props.setProperty("mail.smtp.port", "465");
		     props.setProperty("mail.smtp.socketFactory.port", "465");
		     props.put("mail.smtp.auth", "true");
		     props.put("mail.debug", "true");
		     props.put("mail.store.protocol", "pop3");
		     props.put("mail.transport.protocol", "smtp");
		     final String username = "ishaanveerdadhwal@gmail.com";//
		     final String password = "datastructures";
		     try{
		     Session session = Session.getDefaultInstance(props, 
		                          new Authenticator(){
		                             protected PasswordAuthentication getPasswordAuthentication() {
		                                return new PasswordAuthentication(username, password);
		                             }});

		   // -- Create a new message --
		     Message msg = new MimeMessage(session);

		  // -- Set the FROM and TO fields --
		     msg.setFrom(new InternetAddress("ishaanveerdadhwal@gmail.com","MMU"));
		     msg.setRecipients(Message.RecipientType.BCC, 
		                      InternetAddress.parse(uemail,false));
		     msg.setSubject("PASSWORD DETAILS");
		     msg.setText("**************************************"+pass+"********************************");
		     msg.setSentDate(new Date());
		     
		     //Attachemnt code
		 
		           //attachment code ends here
		     Transport.send(msg);
		     System.out.println("Message sent.");
		  }catch (Exception e){ System.out.println(e);}

		
		return "success";
	}

}
