package vn.edu.iuh.fit.thuchanhwww_buoi1.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role;

import java.util.List;

public class RoleRepositories {
    private EntityManager em;

    public RoleRepositories() {
        em = DBConnect.getInstance().getEmf().createEntityManager();
    }

    public void insertRole(Role role) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            em.merge(role);
            tr.commit();
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
    }

    public List<Role> getRoles() {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql = "select * from role";
            List<Role> rl = em.createNativeQuery(sql, Role.class).getResultList();

            tr.commit();
            return rl;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }

    public String getRoleNameByAccountId(String accountId) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql = "SELECT role_name FROM role INNER JOIN grant_access ON role.role_id = grant_access.role_id WHERE grant_access.account_id = :accountId";
            String roleName = (String) em.createNativeQuery(sql).setParameter("accountId", accountId).getSingleResult();
            tr.commit();
            return roleName;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return "";
    }
    public Role getRoleByAccountId(String accountId) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            String sql = "SELECT role.* FROM role INNER JOIN grant_access ON role.role_id = grant_access.role_id WHERE grant_access.account_id = :accountId";
            Role role = (Role) em.createNativeQuery(sql, Role.class).setParameter("accountId", accountId).getSingleResult();
            tr.commit();
            return role;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }
    public Role searchRole(String id) {
        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {
            Role role = em.find(Role.class, id);
            tr.commit();
            return role;
        } catch (Exception e) {
            tr.rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }

}
