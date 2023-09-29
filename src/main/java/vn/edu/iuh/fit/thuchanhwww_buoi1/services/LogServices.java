package vn.edu.iuh.fit.thuchanhwww_buoi1.services;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Log;
import vn.edu.iuh.fit.thuchanhwww_buoi1.repositories.LogRepositories;

import java.util.List;

public class LogServices {
    private static LogRepositories logDao = new LogRepositories();

    public static void insertLog(Log log) {
        logDao.insertLog(log);
    }

    public static List<Log> getLogs() {
        return logDao.getLogs();
    }
}
