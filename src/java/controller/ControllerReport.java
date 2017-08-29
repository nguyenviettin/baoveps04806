/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Departs;
import entity.Records;
import entity.Staffs;
import java.util.Date;
import java.util.List;
import javax.mail.internet.MimeMessage;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
@RequestMapping("/home/")
public class ControllerReport {

    @Autowired
    SessionFactory factory;

    @RequestMapping("result")
    public String report(ModelMap model, HttpServletRequest request, @ModelAttribute("res") Staffs staff) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        String kq = null;
        try {
            kq = request.getParameter("kq");
            if (kq == null || kq.equals("ALL")) {

                String hql = "SELECT r.staff.depart.name, " + " SUM(case when r.type=1 then 1 else 0 end), " + " SUM(case when r.type=0 then 1 else 0 end) " + " FROM Records r  GROUP BY r.staff.depart.name";
                Query query = session.createQuery(hql);
                List<Object[]> list = query.list();
                model.addAttribute("arrays", list);
            } else {
                String hql1 = "SELECT r.staff.depart.name, " + " SUM(case when r.type=1 then 1 else 0 end), " + " SUM(case when r.type=0 then 1 else 0 end) " + " FROM Records r " + "where r.staff.depart.name like '%" + kq + "%'" + " GROUP BY r.staff.depart.name";
                Query query1 = session.createQuery(hql1);
                List<Object[]> list1 = query1.list();

                model.addAttribute("arrays", list1);
            }

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai");
        } finally {
            session.close();
        }
        return "home/result";
    }

    @RequestMapping(value = "report/{u}", method = RequestMethod.GET)
    public String insert(ModelMap model, @PathVariable("u") String a, @ModelAttribute("records") Records records) {
       
        Session session = factory.getCurrentSession();
        String hql = "FROM Staffs s where s.depart.name like '" + a + "'";

        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
         model.addAttribute("rc",list);
        model.addAttribute("records", new Records());
        return "home/report";
    }

    @Autowired
    JavaMailSender mailer;

    @RequestMapping(value = "report", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("records") Records records,HttpServletRequest request
    ) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
   
        
        try {
            String a = request.getParameter("test");

            Staffs user1 = (Staffs) session.get(Staffs.class, a);
 
            records.setStaff(user1);
            records.setDate(new Date());
            System.out.println(records.getReason());
            
            session.save(records);

            String hql = "FROM Staffs where id like '" + a + "'";
            Query query = session.createQuery(hql);
            List<Staffs> list = query.list();
            System.out.println(list + "moi");
            System.out.println(list.get(0).getEmail());

            // Tạo mail
            try {
                // Tạo mail
                MimeMessage mail = mailer.createMimeMessage();
                System.out.println("cuong 12345");
                // Sử dụng lớp trợ giúp
                MimeMessageHelper helper = new MimeMessageHelper(mail);
                helper.setFrom("abc@gmail.com", "abc@gmail.com");
                helper.setTo(list.get(0).getEmail());
                helper.setReplyTo("abc@gmail.com", "abc@gmail.com");
                helper.setSubject("Thong Bao");
                helper.setText(records.getReason(), true);
                // Gửi mail
                mailer.send(mail);

                model.addAttribute("mail", "Da Reset Pass Cua Ban Phien Ban Vao Check Email");
               
            } catch (Exception e) {
                e.printStackTrace();

                model.addAttribute("message", "Gui Mail That bai");
            }

            t.commit();
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai");
        } finally {
            session.close();
        }
         return "redirect:/home/result.html";
       
    }

    @ModelAttribute("staffs")
    public List<Departs> getstaffs(HttpServletRequest request) {

        Session session = factory.getCurrentSession();
        String hql = "Select s.name FROM Staffs s where s.depart.name like 'Thong tin'";
        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
        return list;
    }

    @ModelAttribute("depart")
    public List<Departs> getdepart() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Departs";
        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
        for (int i = 0; i < list.size(); i++) {
            String a = list.get(0).getName();
        }

        return list;
    }
}
