/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ServersidePackages;

import com.mysql.cj.jdbc.Blob;

/**
 *
 * @author abhig
 */
public class DataObject {
    private int id;
    private String name, date, type, org, mobile, email, regid, msg;
    private Blob event_poster_blob;

    public DataObject(int id, String name, String date, Blob event_poster_blob) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.event_poster_blob = event_poster_blob;
    }

    DataObject(String id, int e_id, String name1, String date, Blob event_poster_blob) {
        this.regid = id;
        this.id = e_id;
        this.name = name1;
        this.date = date;
        this.event_poster_blob = event_poster_blob;
    }

    DataObject(String name, String email, String mobile) {
        this.name = name;
        this.email = email;
        this.mobile = mobile;
    }
    
    DataObject(int msg_id, String name, String email, String message, String Date) {
        this.id = msg_id;
        this.name = name;
        this.email = email;
        this.msg = message;
        this.date = Date;
    }

    public int getId() {
        return id;
    }

    public String getRegId() {
        return regid;
    }

    public String getName() {
        return name;
    }
    
    public String getOrg() {
        return org;
    }
    
    public String getMobile() {
        return mobile;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getDate() {
        return date;
    }
    
    public String getMessage() {
        return msg;
    }
    
    public String getType() {
        return type;
    }
    
    public Blob getPoster() {
        return event_poster_blob;
    }
}

