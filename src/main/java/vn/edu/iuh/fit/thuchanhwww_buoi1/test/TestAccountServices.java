package vn.edu.iuh.fit.thuchanhwww_buoi1.test;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account;

public class TestAccountServices {
    public static void main(String[] args) {
        Account account1 = new Account("Kiet","Nguyen Truong Tuan Kiet","123","kiet@gmail.com","0786561865",(byte) 1);
        Account account2 = new Account("Huong","Pham Thi Ngoc huong","123","huong@gmail.com","0365328020",(byte) 1);

        vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices.insertAccount(account1);
        vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices.insertAccount(account2);

        vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices.getAccounts().forEach(i-> System.out.println(i));

    }
}
