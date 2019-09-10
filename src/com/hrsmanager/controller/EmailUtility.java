package com.hrsmanager.controller;

import java.io.UnsupportedEncodingException;
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

public class EmailUtility {
	public static void sendEmail(String host, String port, final String senderEmail, final String password,
			String recipientEmail, String subject, String message) throws AddressException, 
			MessagingException, UnsupportedEncodingException{
		Properties properties = new Properties();
		properties.put("mail.stmp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		properties.put("java.net.preferIPv4Stack", "true");
		
		
		Authenticator auth = new Authenticator(){
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(senderEmail, password);
			}
		};
		
		Session session = Session.getInstance(properties, auth);
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(senderEmail));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setText(message);
			
			Transport transport = session.getTransport("smtp");
			transport.connect(host,senderEmail, password);
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
