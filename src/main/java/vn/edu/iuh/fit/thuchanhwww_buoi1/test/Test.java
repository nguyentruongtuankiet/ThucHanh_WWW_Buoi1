package vn.edu.iuh.fit.thuchanhwww_buoi1.test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import vn.edu.iuh.fit.thuchanhwww_buoi1.repositories.DBConnect;

public class Test {
    public static void main(String[] args) {
        try {
            DBConnect dbConnect = DBConnect.getInstance();
            EntityManager emf = dbConnect.getEmf().createEntityManager();

            EntityTransaction tr = emf.getTransaction();
            tr.begin();
            try {
                tr.commit();
            } catch (Exception e){
                tr.rollback();
                System.out.println(e.getMessage());
            } finally {
                emf.close();
            }

            System.out.println("lỗi");
        } catch (Exception e){
            System.out.println(e.getMessage());
        }

    }
}
