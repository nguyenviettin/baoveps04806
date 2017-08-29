/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Students;
import entity.Users;
import java.lang.reflect.Method;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author USER
 */
@Transactional
@Controller
@RequestMapping("/home/")
public class ControllerUsers {

    @Autowired
    SessionFactory factory;

    @RequestMapping("login")
    public String login(ModelMap model, HttpServletRequest request) {
        return "home/login";
    }

    @RequestMapping("logout")
    public String logout(ModelMap model, HttpServletRequest request, HttpSession session1) {
        session1.setAttribute("userkt", null);
        return "home/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login1(ModelMap model, HttpSession session1, HttpServletRequest request, @ModelAttribute("login") Users user, BindingResult errors) {

        String id = request.getParameter("ten");
        String oldpass = request.getParameter("matkhau");
        user.setUsername(id);
        user.setPassword(oldpass);

        if (user.getUsername().equals("")) {
            errors.rejectValue("username", "login", "Vui Long nhap username");
        }
        if (user.getPassword().equals("")) {
            errors.rejectValue("password", "login", "Vui Long nhap password");
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();

            System.out.println(id + "  " + oldpass);
            try {
                String hql = "FROM Users u where u.username like '" + id + "'";
                Query query = session.createQuery(hql);
                List<Users> list = query.list();
                model.addAttribute("list", list);
                if (list.isEmpty()) {
                    model.addAttribute("message", "User Khong Ton tai");
                } else {
                    for (int i = 0; i < list.size(); i++) {
                        String name = list.get(i).getUsername();
                        String pass = list.get(i).getPassword();

                        if (id.equals(name) && oldpass.equals(pass)) {
                            session1.setAttribute("userkt", id);
                            model.addAttribute("message", "Dang nhap Thanh Cong");
                        } else {
                            model.addAttribute("message", "User Hoac PassWord Khong Dung");
                        }
                    }
                }
                String hql1 = "FROM Users u ";
                Query query1 = session.createQuery(hql1);
                List<Users> list1 = query1.list();
                model.addAttribute("list1", list1);
                t.commit();

            } catch (Exception e) {

                t.rollback();
                model.addAttribute("message", "that bai");
            } finally {
                session.close();
            }
        }
        return "home/login";
    }
}
