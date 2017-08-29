/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Departs;
import entity.Records;
import entity.Staffs;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@RequestMapping("/home/")
public class ControllerStaffs {

    @Autowired
    SessionFactory factory;

    @RequestMapping("staffs")
    public String index(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Staffs";
        Query query = session.createQuery(hql);
        List<Staffs> list = query.list();
        model.addAttribute("staffs", list);
        return "home/staffs";
    }

    @ModelAttribute("depart")
    public List<Departs> getdepart() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Departs";
        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
        return list;
    }

    @RequestMapping("detail/{id}")
    public String detail(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        Staffs user = (Staffs) session.get(Staffs.class, id);
        model.addAttribute("user", user);
        return "home/detail";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit1(ModelMap model, @PathVariable("id") String id, @ModelAttribute("edit") Staffs staffs) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        Staffs user1 = (Staffs) session.get(Staffs.class, id);
        model.addAttribute("user1", user1);
        return "home/edit";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
    public String edit(ModelMap model, @PathVariable("id") String id, @ModelAttribute("edit") Staffs staffs, HttpServletRequest request
    ) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {
            SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");

            String name = request.getParameter("name");

            String photo = request.getParameter("photo");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String notes = request.getParameter("notes");
            Float salary = Float.parseFloat(request.getParameter("salary"));
            Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            System.out.println(gender + "gioi tinh");
            if (gender) {
                model.addAttribute("gioitinh", 1);
            } else {
                model.addAttribute("gioitinh", 0);
            }
            String day = request.getParameter("day");

            Date newdate = in.parse(day);

            System.out.println(staffs.getDepart().getId() + "depart 1");
            System.out.println(staffs.getDepart() + "depart 2");
            staffs.setName(name);
            staffs.setPhoto(photo);
            staffs.setEmail(email);
            staffs.setPhone(phone);
            staffs.setNotes(notes);
            staffs.setSalary(salary);
            staffs.setGender(gender);
            staffs.setBirthday(newdate);

            session.update(staffs);

            model.addAttribute("user", staffs);

            t.commit();


            model.addAttribute("message", "Thanh Cong");
            return "redirect:/home/staffs.html";

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai");
        } finally {
            session.close();
        }
        return "home/edit";
    }

    @RequestMapping("delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Records where staff =:id";
        Query query = session.createQuery(hql);

        query.setString("id", id);
        List<Records> list = query.list();

        if (list.isEmpty()) {

            String hql1 = "delete from Staffs where id= :aa";
            Query query1 = session.createQuery(hql1);
            query1.setString("aa", id);
            query1.executeUpdate();
            System.out.println(query1.executeUpdate());

        } else {
              
            String hql1 = "delete from Records where staff= :uid";
            Query query1 = session.createQuery(hql1);
            query1.setString("uid", id);
            query1.executeUpdate();

            String hql2 = "delete from Staffs where id= :aa";
            Query query2 = session.createQuery(hql2);
            query2.setString("aa", id);
            query2.executeUpdate();
            System.out.println(query2);

        }
        String hql3 = "FROM Staffs";
        Query query3 = session.createQuery(hql3);
        List<Staffs> list1 = query3.list();
        model.addAttribute("staffs", list1);
        return "home/staffs";
    }

    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insert(ModelMap model, @ModelAttribute("edit") Staffs staffs) {
        return "home/add";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert1(ModelMap model, @ModelAttribute("edit") Staffs staffs, HttpServletRequest request) throws ParseException {
        {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            SimpleDateFormat in = new SimpleDateFormat("yyy-MM-dd");
            SimpleDateFormat out = new SimpleDateFormat("dd-MM-yyyy");
            String a = request.getParameter("aa");
            try {
                Date b = in.parse(a);
                staffs.setBirthday(b);

                staffs.setId(request.getParameter("id"));
                staffs.setName(request.getParameter("name"));
                staffs.setEmail(request.getParameter("email"));
                staffs.setPhone(request.getParameter("phone"));
             
             

                int e = Integer.parseInt(request.getParameter("gender"));
                System.out.println(e);
                Boolean d = null;
                if (e == 1) {
                    d = true;
                } else {
                    d = false;
                }

                staffs.setGender(d);

                session.save(staffs);
                t.commit();
                model.addAttribute("message", "thanh cong");
            } catch (Exception e) {
                t.rollback();
                model.addAttribute("message", "that bai"+e);
            } finally {
                session.close();
            }
            return "home/staffs.html";
        }
    }

    
}
