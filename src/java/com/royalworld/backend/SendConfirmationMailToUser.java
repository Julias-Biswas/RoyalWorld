/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.royalworld.backend;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author julia
 */
public class SendConfirmationMailToUser 
{
    public static void sendConfirmationMailToUser(String to_email , String subject , String message)
    {
        String from_email = "juliasbiswasproject@gmail.com";
        String mail_password = "ILovedJava@17102000";
        
        // Create an object of Properties class
        Properties properties = new Properties();
        
        // We can used gmail for mail server
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smti.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        
        Session session = Session.getDefaultInstance(properties, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from_email, mail_password);
            }
            
        });
        
        try
        {
            MimeMessage mimemsg = new MimeMessage(session);
            
            mimemsg.setFrom(new InternetAddress(from_email));
            mimemsg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
            mimemsg.setSubject(subject);
            mimemsg.setText(message);
            
            Transport.send(mimemsg);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
