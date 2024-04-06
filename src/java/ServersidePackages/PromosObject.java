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
public class PromosObject {
    private int id;
    private String name, date;
    private Blob event_poster_blob;

    public PromosObject(int id, String name, String date, Blob event_poster_blob) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.event_poster_blob = event_poster_blob;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
    
    public String getDate() {
        return date;
    }
    
    public Blob getPoster() {
        return event_poster_blob;
    }
}
