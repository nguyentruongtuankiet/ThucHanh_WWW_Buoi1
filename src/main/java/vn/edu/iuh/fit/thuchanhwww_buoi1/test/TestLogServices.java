package vn.edu.iuh.fit.thuchanhwww_buoi1.test;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Log;

import java.sql.Timestamp;
import java.util.Date;

public class TestLogServices {
    public static void main(String[] args) {
        Date date = new Date();

        Log log1 = new Log("met",new Timestamp(date.getTime()),new Timestamp(date.getTime()),"oke");

        vn.edu.iuh.fit.thuchanhwww_buoi1.services.LogServices.insertLog(log1);
    }
}
