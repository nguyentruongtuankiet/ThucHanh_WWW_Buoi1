package vn.edu.iuh.fit.thuchanhwww_buoi1.test;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role;

public class RoleServices {
    public static void main(String[] args) {
        Role role1 = new Role("admin","administrator","admin role",(byte)1);
        Role role2 = new Role("user","user","user role",(byte)1);

        vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices.insertRole(role1);
        vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices.insertRole(role2);
        vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices.getRoles().forEach(i-> System.out.println(i));
    }
}
