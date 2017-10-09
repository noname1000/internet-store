/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.store3.web.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author NoName <NoName at example.com>
 */
@Controller("homeController")
@RequestMapping("/index")
public class HomeController {
    @RequestMapping(method = RequestMethod.GET)
    public void home(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        RequestDispatcher dispatcher = httpServletRequest.getRequestDispatcher("/product");
        try {
            dispatcher.forward(httpServletRequest, httpServletResponse);
	} catch (ServletException ex) {
            // logger.error(ex.toString());
	} catch (IOException ex) {
            // logger.error(ex.toString());
	}
    }
}
