package vn.edu.iuh.fit.thuchanhwww_buoi1.services;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.GrantAccess;
import vn.edu.iuh.fit.thuchanhwww_buoi1.repositories.GrantAccessRepositories;

import java.util.List;

public class GrantAccessServices {
    private static GrantAccessRepositories grantAccessDao = new GrantAccessRepositories();

    public static void insertGrantAccess(GrantAccess grantAccess) {
        grantAccessDao.insertGrantAccess(grantAccess);
    }

    public static GrantAccess searchGrantAccessByAccountId(String id) {
        return grantAccessDao.searchGrantAccessByAccountId(id);
    }

    public static List<GrantAccess> getListGrantAccess() {
        return grantAccessDao.getListGrantAccess();
    }

    public static void dellGrantAccess(GrantAccess ga) {
        grantAccessDao.dellGrantAccess(ga);
    }
}
