/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "Departs")
public class Departs {

    @Id
    private String id;
    private String name;
    @OneToMany(mappedBy = "depart", fetch = FetchType.EAGER)
    private Collection<Staffs> Staffs;

    public Departs() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collection<Staffs> getStaffs() {
        return Staffs;
    }

    public void setStaffs(Collection<Staffs> Staffs) {
        this.Staffs = Staffs;
    }

  


}
