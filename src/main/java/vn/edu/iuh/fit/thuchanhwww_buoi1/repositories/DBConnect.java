package vn.edu.iuh.fit.thuchanhwww_buoi1.repositories;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DBConnect {

    private static DBConnect instance;
    private EntityManagerFactory em;

    public DBConnect() {
        try {
            em = Persistence.createEntityManagerFactory("ThucHanhWWW_Buoi1");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static DBConnect getInstance() {
        if (instance == null)
            instance = new DBConnect();
        return instance;
    }

    public EntityManagerFactory getEmf() {
        return em;
    }
}
