package vn.edu.iuh.fit.thuchanhwww_buoi1.services;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role;
import vn.edu.iuh.fit.thuchanhwww_buoi1.repositories.RoleRepositories;

import java.util.List;

public class RoleServices {
    private static RoleRepositories RoleDao = new RoleRepositories();

    public static void insertRole(Role role) {
        RoleDao.insertRole(role);
    }

    public static List<Role> getRoles() {
        return RoleDao.getRoles();
    }

    public static String getRoleNameByAccountId(String idAcc) {
        return RoleDao.getRoleNameByAccountId(idAcc);
    }

    public static Role getRoleByAccountId(String idAcc) {
        return RoleDao.getRoleByAccountId(idAcc);
    }
    public static Role searchRole(String id){return RoleDao.searchRole(id);}

}
