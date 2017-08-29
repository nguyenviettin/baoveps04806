/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Students;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author USER
 */
@Transactional
@Controller
@RequestMapping("/home/")
public class ControllerStudents {

    @Autowired
    SessionFactory factory;

    
  
     @RequestMapping("students")
    public String report(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "SELECT r.staff.id,r.staff.name, r.staff.depart.name," 
                + " SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end) as TTT "
                + " FROM Records r " +
                " GROUP BY r.staff.id,r.staff.name,r.staff.depart.name ORDER BY TTT DESC ";
        Query query = session.createQuery(hql);
        List<Object[]> list = query.list();
        model.addAttribute("arrays", list);
        model.addAttribute("ktacc", 7);
       return "home/students";
    }
    
//    @RequestMapping("students")
//    public String students(ModelMap model, HttpServletRequest request) {
//
//        Session session = factory.openSession();
//        Transaction t = session.beginTransaction();
//
//        try {
//            String hql = "FROM Students s order by s.mark DESC ";
//            Query query = session.createQuery(hql);
//            query.setFirstResult(0);
//            query.setMaxResults(10);
//            List<Students> list = query.list();
//            model.addAttribute("Students", list);
//            int top = Integer.parseInt(request.getParameter("top"));
//
//          
//
//            t.commit();
//        } catch (Exception e) {
//            t.rollback();
//            model.addAttribute("message", "that bai");
//        } finally {
//            session.close();
//        }
//
//        return "home/students";
//
//    }

}
