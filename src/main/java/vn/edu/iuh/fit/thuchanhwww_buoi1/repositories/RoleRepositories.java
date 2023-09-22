package vn.edu.iuh.fit.thuchanhwww_buoi1.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role;

import java.util.List;

public class RoleRepositories {
    private EntityManager em;

    public RoleRepositories() {
        em = DBConnect.getInstance().getEmf().createEntityManager();
    }

    public void insertRole(Role role){
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            em.merge(role);
            tr.commit();
        } catch (Exception e){
            tr.rollback();
            System.out.println(e.getMessage());
        }
    }

    public List<Role> getRoles(){
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql ="select * from role";
            List<Role> rl = em.createNativeQuery(sql, Role.class).getResultList();

            tr.commit();
            return rl;
        } catch (Exception e){
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }
}
