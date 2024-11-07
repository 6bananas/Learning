CREATE DATABASE IF NOT EXISTS test DEFAULT CHARSET utf8;
USE test;

CREATE TABLE s
(
    Sno VARCHAR(7) PRIMARY KEY,
    Sname VARCHAR(10) NOT NULL,
    Sage INT,
    Ssex VARCHAR(50),
    Sdept VARCHAR(20) DEFAULT '计算机系'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE c
(
    Cno VARCHAR(10) PRIMARY KEY,
    Cname VARCHAR(20) NOT NULL,
    Cpno VARCHAR(10),
    Ccredit INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE sc
(
    Sno VARCHAR(7),
    Cno VARCHAR(10),
    grade INT,
    FOREIGN KEY (Sno) REFERENCES s(Sno),
    FOREIGN KEY (Cno) REFERENCES c(Cno)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO s (Sno, Sname, Sage, Ssex, Sdept) VALUES
    ("10001", "张三", 20, '男', '计算机'),
    ("10002", "李梅", 19, '女', '计算机'),
    ("10003", "王五", 18, '男', 'CS'),
    ("10004", "小明", 21, '男', '计算机'),
    ("10006", "黎明", 18, '男', '艺术表演'),
    ("10008", "杰克", 21, '男', '计算机'),
    ("10005", "小红", 22, '女', 'CS');

INSERT INTO c (Cno, Cname, Cpno, Ccredit) VALUES
    ("1", "离散数学", NULL, 5),
    ("2", "线性代数", '3', 6),
    ("3", "高等数学", NULL, 4),
    ("4", "数据结构", '3', 6),
    ("5", "操作系统", '1', 4),
    ("6", "数据库", '4', 5);

INSERT INTO sc (Sno, Cno, grade) VALUES
    ("10001", "1", 70),
    ("10001", "6", 56),
    ("10003", "4", 90),
    ("10003", "5", 83),
    ("10004", "1", 75),
    ("10004", "3", 90),
    ("10008", "1", 70),
    ("10008", "5", 70),
    ("10008", "6", 88),
    ("10002", "1", 85),
    ("10002", "6", 89);
