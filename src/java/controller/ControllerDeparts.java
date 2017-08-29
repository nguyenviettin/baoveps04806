/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

//import entity.Staffs;
import entity.Departs;
import entity.Records;
import entity.Staffs;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author USER
 */
@Transactional
@Controller
@RequestMapping("/home")
public class ControllerDeparts {

    @Autowired
    SessionFactory factory;

    @RequestMapping("departs")
    public String index(ModelMap model, @ModelAttribute("pb") Departs departs) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Departs";
        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
        model.addAttribute("departs", list);
        model.addAttribute("message", query);
        return "home/departs";
    }

    @RequestMapping("edit")
    public String edit(HttpServletRequest request, ModelMap model, Departs departs) {
        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        departs.setId(id);
        departs.setName(name);

        model.addAttribute("pb", departs);

        Session session = factory.getCurrentSession();
        String hql = "FROM Departs";
        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
        model.addAttribute("departs", list);

        return "home/departs";
    }

    @RequestMapping(params = "btnUp")
    public String update(@ModelAttribute("pb") Departs departs, ModelMap model) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(departs);
            t.commit();
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai");
        } finally {
            session.close();
        }
        return "redirect:/home/departs.html";
    }

    @RequestMapping(params = "btnIn")
    public String text(@ModelAttribute("pb") Departs departs, ModelMap model) {

        return "home/insertdep";
    }

    @RequestMapping(params = "btnadd")
    public String insert(@ModelAttribute("pb") Departs departs, ModelMap model) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {

            session.save(departs);
            String hql = "FROM Departs";
            Query query = session.createQuery(hql);
            List<Departs> list = query.list();
            model.addAttribute("departs", list);
            model.addAttribute("message", query);
            t.commit();

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai");
        } finally {
            session.close();
        }

        return "home/departs";
    }

    @RequestMapping("del")
    public String delete(HttpServletRequest request, ModelMap model, @ModelAttribute("pb") Departs departs
    ) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        String id = request.getParameter("txtID");
        String hql = "FROM Staffs where depart =:id";
        Query query = session.createQuery(hql);
        System.out.println(id);
        query.setString("id", id);

        System.out.println(query);
        List<Staffs> list = query.list();
        System.out.println(list);
        try {
            if (list.isEmpty()) {

                String hql1 = "delete from Departs where id= :aa";
                Query query1 = session.createQuery(hql1);
                query1.setString("aa", id);
                query1.executeUpdate();
                System.out.println(query1.executeUpdate());

            } else {
//            for (int i = 0; i < list.size(); i++)list.get(i).getStaff().getId() {               
                String hql1 = "update Staffs set depart =:dp ";
                Query query1 = session.createQuery(hql1);
                query1.setString("dp", "KT");
                query1.executeUpdate();


                String hql2 = "delete from Departs where id= :aa";
                Query query2 = session.createQuery(hql2);
                query2.setString("aa", id);
                query2.executeUpdate();
                System.out.println(query2);

            }
            t.commit();
            return "redirect:/home/departs.html";
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai");
        } finally {
            session.close();
        }
        return "home/departs";
    }
   
}
