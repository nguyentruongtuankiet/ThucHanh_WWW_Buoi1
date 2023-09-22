package vn.edu.iuh.fit.thuchanhwww_buoi1.test;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.GrantAccess;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role;
import vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices;
import vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices;

public class GrantAccessServices {
    public static void main(String[] args) {
        Account account1 = vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices.getAccounts().get(2);
        Account account2 = AccountServices.getAccounts().get(3);
        Role role1 = vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices.getRoles().get(2);
        Role role2 = RoleServices.getRoles().get(3);

        GrantAccess grantAccess1 = new GrantAccess(true,"",account2,role1);
        GrantAccess grantAccess2 = new GrantAccess(true,"",account1,role2);


        vn.edu.iuh.fit.thuchanhwww_buoi1.services.GrantAccessServices.insertGrantAccess(grantAccess1);
        vn.edu.iuh.fit.thuchanhwww_buoi1.services.GrantAccessServices.insertGrantAccess(grantAccess2);

        vn.edu.iuh.fit.thuchanhwww_buoi1.services.GrantAccessServices.getListGrantAccess().forEach(i-> System.out.println(i));
    }
}
