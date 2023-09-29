package vn.edu.iuh.fit.thuchanhwww_buoi1.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account;

import java.util.List;

public class AccRepositories {

    private EntityManager em;

    public AccRepositories() {
        em = DBConnect.getInstance().getEmf().createEntityManager();
    }

    public void insertAccount(Account account) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            em.merge(account);
            tr.commit();
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
    }

    public Account searchAccount(String id) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            Account account = em.find(Account.class, id);
            tr.commit();
            return account;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void dellAccount(String id) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            Account account = em.find(Account.class, id);
            em.remove(account);
            tr.commit();
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
    }


    public List<Account> getAccounts() {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql = "select * from Account";
            List<Account> rl = em.createNativeQuery(sql, Account.class).getResultList();
            tr.commit();
            return rl;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Boolean checkAcc(String email, String pass) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql = "select * from Account";
            List<Account> listacc = em.createNativeQuery(sql, Account.class).getResultList();

            for (Account acc : listacc) {
                if (acc.getEmail().equals(email)) {
                    if (acc.getPassword().equals(pass)) {
                        tr.commit();
                        return true;
                    }
                    tr.commit();
                    return false;
                }
            }
            tr.commit();
            return false;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return false;
    }

    public Account getAccByEmail(String email) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql = "select * from Account where email = :email";
            Account account = (Account) em.createNativeQuery(sql, Account.class).setParameter("email", email).getSingleResult();
            tr.commit();
            return account;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }
    public String getAccIdByEmail(String email) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql = "select account_id from Account where email = :email";
            String id = (String)  em.createNativeQuery(sql).setParameter("email", email).getSingleResult();
            tr.commit();
            return id;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }



}
