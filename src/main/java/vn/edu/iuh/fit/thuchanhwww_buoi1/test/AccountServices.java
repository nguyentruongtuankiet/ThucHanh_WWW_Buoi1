package vn.edu.iuh.fit.thuchanhwww_buoi1.test;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account;

public class AccountServices {
    public static void main(String[] args) {
        Account account1 = new Account("kiet","Tran Thi Met","123","met@gmail.com","0904567890",(byte) 1);
        Account account2 = new Account("huong","Nguyen Van Teo","123","teo@gmail.com","0903123456",(byte) 1);

        vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices.insertAccount(account1);
        vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices.insertAccount(account2);

        vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices.getAccounts().forEach(i-> System.out.println(i));
    }
}
