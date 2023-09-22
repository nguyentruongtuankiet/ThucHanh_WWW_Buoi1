package vn.edu.iuh.fit.thuchanhwww_buoi1.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.GrantAccess;

import java.util.List;

public class GrantAccessRepositories {
    private EntityManager em;
    public GrantAccessRepositories() {
        em = DBConnect.getInstance().getEmf().createEntityManager();
    }

    public void insertGrantAccess(GrantAccess grantAccess){
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            System.out.println(grantAccess);
            em.persist(grantAccess);
            tr.commit();
        } catch (Exception e){
            tr.rollback();
            System.out.println(e.getMessage());
        }
    }
    public GrantAccess searchGrantAccessByAccountId(String id){
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql = "select  * from grant_access where account_id=\""+id+"\"";
            List<GrantAccess> grantAccesses=em.createNativeQuery(sql, GrantAccess.class).getResultList();
            tr.commit();
            return grantAccesses.get(0);
        } catch (Exception e){
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<GrantAccess> getListGrantAccess(){
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql ="select * from grant_access";
            List<GrantAccess> rl = em.createNativeQuery(sql, GrantAccess.class).getResultList();

            tr.commit();
            return rl;
        } catch (Exception e){
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }
}
