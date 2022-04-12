/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.royalworld.backend;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author julia
 */
public class Validations 
{
    private final Pattern name ;
    private final Pattern phoneno ;
    private final Pattern password ;
    private final Pattern email ;
    
    private Matcher matcher ;
    
    private static final String NAME_PATTERN = "^[a-zA-Z-0-9 ]{3,30}$";   
    private static final String PHONE_PATTERN = "^[0-9]{10}$";
    private static final String PASS_PATTERN = "^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$";
    private static final String EMAIL_PATTERN = "^([a-zA-Z0-9])(([a-zA-Z0-9])*([\\._\\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\\-])+(\\.))+([a-zA-Z]{2,4})+$";
    
    
    public Validations()
    {
        email = Pattern.compile(EMAIL_PATTERN);
        name = Pattern.compile(NAME_PATTERN);
        password = Pattern.compile(PASS_PATTERN);
        phoneno = Pattern.compile(PHONE_PATTERN);
    }
    
    public boolean emailValidate(final String email1)
    {
        matcher = email.matcher(email1);
        return matcher.matches();
    }
    
    public boolean nameValidate(final String name1)
    {
        matcher = name.matcher(name1);
        return matcher.matches();
    }
    
    public boolean passwordValidate(final String pass1)
    {
        matcher = password.matcher(pass1);
        return matcher.matches();
    }
    
    public boolean phoneValidate(final String phoneno1)
    {
        matcher = phoneno.matcher(phoneno1);
        return matcher.matches();
    }
}
