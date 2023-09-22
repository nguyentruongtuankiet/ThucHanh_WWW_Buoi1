package vn.edu.iuh.fit.thuchanhwww_buoi1.services;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account;
import vn.edu.iuh.fit.thuchanhwww_buoi1.repositories.AccRepositories;

import java.util.List;

public class AccountServices {
    private static AccRepositories accountDao = new AccRepositories();
    public static  void insertAccount(Account account){
        accountDao.insertAccount(account);
    }
    public static Account searchAccount(String id){return accountDao.searchAccount(id);}
    public static void dellAccount(String id){accountDao.dellAccount(id);}
    public static List<Account> getAccounts(){return accountDao.getAccounts();}
}
