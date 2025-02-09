CREATE TABLE working_status (
    id serial PRIMARY KEY,
    work_description varchar(50)
);
CREATE TABLE designation (
    id SERIAL PRIMARY KEY,
    designation_description VARCHAR(200)
);
CREATE TABLE location_details (
    id SERIAL PRIMARY KEY,
    district varchar(500)
);
CREATE TABLE salary_components (
    id serial PRIMARY KEY,
    salary_description varchar(500),
    salary_type varchar(150)
);
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_joining DATE,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone_no BIGINT,
    working_status_id INT,
    designation_id INT,
    location_id INT,
    FOREIGN KEY (working_status_id) REFERENCES working_status(id),
    FOREIGN KEY (designation_id) REFERENCES designation(id),
    FOREIGN KEY (location_id) REFERENCES location_details(id),
    gross INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE salaries (
    id SERIAL PRIMARY KEY,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    salary_month INT,
    salary_year INT,
    paid_on DATE,
    created_at TIMESTAMP,
    gross INT,
    deduction INT,
    net INT
);
CREATE TABLE salary_details (
    id SERIAL PRIMARY KEY,
    salaries_id INT,
    salary_component_id INT,
    amount INT,
    created_at TIMESTAMP,
    FOREIGN KEY (salaries_id) REFERENCES salaries(id),
    FOREIGN KEY (salary_component_id) REFERENCES salary_components(id)
);
--inserting values into tables
INSERT INTO working_status (work_description)
VALUES ('working'),
    ('expired'),
    ('retired'),
    ('suspended');
INSERT INTO designation (designation_description)
VALUES ('Project Manager'),
    ('web developer'),
    ('tester'),
    ('HR'),
    ('mobile developer'),
    ('DevOps Engineer');
INSERT INTO location_details (district)
VALUES ('Hyderabad'),
    ('Rangareddy'),
    ('Khammam'),
    ('Vikarabad'),
    ('Sangareddy'),
    ('Siddipet');
INSERT INTO salary_components (salary_description, salary_type)
VALUES ('basic', 'Earning'),
    ('DA', 'Earning'),
    ('HRA', 'Earning'),
    ('CA', 'Earning'),
    ('Medical Allowance', 'Earning'),
    ('Bonus', 'Earning'),
    ('TDS', 'Deduction'),
    ('PF', 'Deduction');
INSERT INTO employees (
        first_name,
        last_name,
        date_of_joining,
        date_of_birth,
        gender,
        phone_no,
        working_status_id,
        designation_id,
        location_id,
        gross,
        created_at
    )
VALUES (
        'John',
        'Doe',
        '2002-05-12',
        '1985-09-21',
        'Male',
        1234567890,
        1,
        1,
        2,
        2800,
        now()
    ),
    (
        'Emily',
        'Smith',
        '2003-07-04',
        '1961-11-15',
        'Female',
        2345678901,
        3,
        2,
        1,
        3300,
        now()
    ),
    (
        'Michael',
        'Johnson',
        '2005-10-19',
        '1980-03-30',
        'Male',
        3456789012,
        4,
        6,
        4,
        3800,
        now()
    ),
    (
        'Olivia',
        'Williams',
        '2007-12-25',
        '1992-07-07',
        'Female',
        4567890123,
        1,
        4,
        2,
        3300,
        now()
    ),
    (
        'William',
        'Brown',
        '2009-02-28',
        '1979-05-19',
        'Male',
        5678901234,
        1,
        5,
        1,
        2300,
        now()
    ),
    (
        'Sophia',
        'Jones',
        '2010-04-03',
        '1962-12-03',
        'Female',
        6789012345,
        3,
        1,
        5,
        3800,
        now()
    ),
    (
        'Benjamin',
        ' Davis',
        '2012-06-17',
        '1987-08-11',
        'Male',
        7890123456,
        1,
        3,
        3,
        4300,
        now()
    ),
    (
        'Ava',
        'Garcia',
        '2014-08-21',
        '1990-01-25',
        'Female',
        8901234567,
        1,
        4,
        2,
        4300,
        now()
    ),
    (
        'James',
        'Martinez',
        '2016-10-31',
        '1983-04-12',
        'Male',
        9012345678,
        4,
        6,
        2,
        4300,
        now()
    ),
    (
        'Isabella',
        'Rodriguez',
        '2018-01-06',
        '1998-10-29',
        'Female',
        0123456789,
        1,
        1,
        3,
        3800,
        now()
    ),
    (
        'Daniel',
        'Miller',
        '2020-03-11',
        '1989-06-17',
        'Male',
        1234567890,
        1,
        2,
        2,
        3800,
        now()
    ),
    (
        'Mia',
        'Wilson',
        '2021-05-16',
        '1960-02-14',
        'Female',
        2345678901,
        1,
        3,
        1,
        4100,
        now()
    ),
    (
        'Alexander',
        'Moore',
        '2004-09-23',
        '1960-12-05',
        'Male',
        3456789012,
        3,
        5,
        1,
        4100,
        now()
    ),
    (
        'Charlotte',
        'Taylor',
        '2006-11-28',
        '1991-07-23',
        'Female',
        4567890123,
        1,
        1,
        2,
        4100,
        now()
    ),
    (
        'Henry',
        'Anderson',
        '2008-01-01',
        '1996-03-20',
        'Male',
        5678901234,
        1,
        2,
        5,
        3700,
        now()
    ),
    (
        'Amelia',
        'Thomas',
        '2011-04-05',
        '1986-09-10',
        'Female',
        6789012345,
        2,
        3,
        6,
        3800,
        now()
    ),
    (
        'Samuel',
        'Jackson',
        '2013-06-20',
        '1994-05-27',
        'Male',
        7890123456,
        3,
        4,
        5,
        3800,
        now()
    ),
    (
        'Luna',
        'White',
        '2015-08-24',
        '1981-11-01',
        'Female',
        8901234567,
        3,
        5,
        4,
        3500,
        now()
    ),
    (
        'Oliver',
        'Harris',
        '2017-10-02',
        '1997-08-08',
        'Male',
        9012345678,
        3,
        2,
        1,
        3700,
        now()
    ),
    (
        'Lily',
        'Martin',
        '2019-12-07',
        '1997-08-08',
        'Female',
        0123456789,
        1,
        1,
        2,
        3800,
        now()
    );
INSERT INTO salaries (
        employee_id,
        salary_month,
        salary_year,
        paid_on,
        created_at,
        gross,
        deduction,
        net
    )
VALUES (
        1,
        11,
        2023,
        '2023-11-03',
        now(),
        2800,
        120,
        2680
    ),
    (
        1,
        10,
        2023,
        '2023-10-03',
        now(),
        2800,
        120,
        2680
    ),
    (1, 9, 2023, '2023-09-03', now(), 2800, 120, 2680),
    (1, 8, 2023, '2023-08-03', now(), 2800, 120, 2680),
    (1, 7, 2023, '2023-07-03', now(), 2800, 120, 2680),
    (
        2,
        11,
        2021,
        '2021-11-03',
        now(),
        3300,
        300,
        3000
    ),
    (
        2,
        10,
        2021,
        '2021-10-03',
        now(),
        3300,
        300,
        3000
    ),
    (2, 9, 2021, '2021-09-03', now(), 3300, 300, 3000),
    (2, 8, 2021, '2021-08-03', now(), 3300, 300, 3000),
    (2, 7, 2021, '2021-07-03', now(), 3300, 300, 3000),
    (
        3,
        11,
        2023,
        '2023-11-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        3,
        10,
        2023,
        '2023-10-03',
        now(),
        3800,
        400,
        3400
    ),
    (3, 9, 2023, '2023-09-03', now(), 3800, 400, 3400),
    (3, 8, 2023, '2023-08-03', now(), 3800, 400, 3400),
    (3, 7, 2023, '2023-07-03', now(), 3800, 400, 3400),
    (
        4,
        11,
        2023,
        '2023-11-03',
        now(),
        3300,
        300,
        3000
    ),
    (
        4,
        10,
        2023,
        '2023-10-03',
        now(),
        3300,
        300,
        3000
    ),
    (4, 9, 2023, '2023-09-03', now(), 3300, 300, 3000),
    (4, 8, 2023, '2023-08-03', now(), 3300, 300, 3000),
    (4, 7, 2023, '2023-07-03', now(), 3300, 300, 3000),
    (
        5,
        11,
        2023,
        '2023-11-03',
        now(),
        2300,
        200,
        2100
    ),
    (
        5,
        10,
        2023,
        '2023-10-03',
        now(),
        2300,
        200,
        2100
    ),
    (5, 9, 2023, '2023-09-03', now(), 2300, 200, 2100),
    (5, 8, 2023, '2023-08-03', now(), 2300, 200, 2100),
    (5, 7, 2023, '2023-07-03', now(), 2300, 200, 2100),
    (
        6,
        11,
        2022,
        '2022-11-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        6,
        10,
        2022,
        '2022-10-03',
        now(),
        3800,
        400,
        3400
    ),
    (6, 9, 2022, '2022-09-03', now(), 3800, 400, 3400),
    (6, 8, 2022, '2022-08-03', now(), 3800, 400, 3400),
    (6, 7, 2022, '2022-07-03', now(), 3800, 400, 3400),
    (
        7,
        11,
        2023,
        '2023-11-03',
        now(),
        4300,
        300,
        4000
    ),
    (
        7,
        10,
        2023,
        '2023-10-03',
        now(),
        4300,
        300,
        4000
    ),
    (7, 9, 2023, '2023-09-03', now(), 4300, 300, 4000),
    (7, 8, 2023, '2023-08-03', now(), 4300, 300, 4000),
    (7, 7, 2023, '2023-07-03', now(), 4300, 300, 4000),
    (
        8,
        11,
        2023,
        '2023-11-03',
        now(),
        4300,
        300,
        4000
    ),
    (
        8,
        10,
        2023,
        '2023-10-03',
        now(),
        4300,
        300,
        4000
    ),
    (8, 9, 2023, '2023-09-03', now(), 4300, 300, 4000),
    (8, 8, 2023, '2023-08-03', now(), 4300, 300, 4000),
    (8, 7, 2023, '2023-07-03', now(), 4300, 300, 4000),
    (
        9,
        11,
        2023,
        '2023-11-03',
        now(),
        4300,
        300,
        4000
    ),
    (
        9,
        10,
        2023,
        '2023-10-03',
        now(),
        4300,
        300,
        4000
    ),
    (9, 9, 2023, '2023-09-03', now(), 4300, 300, 4000),
    (9, 8, 2023, '2023-08-03', now(), 4300, 300, 4000),
    (9, 7, 2023, '2023-07-03', now(), 4300, 300, 4000),
    (
        10,
        11,
        2023,
        '2023-11-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        10,
        10,
        2023,
        '2023-10-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        10,
        9,
        2023,
        '2023-09-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        10,
        8,
        2023,
        '2023-08-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        10,
        7,
        2023,
        '2023-07-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        11,
        11,
        2023,
        '2023-11-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        11,
        10,
        2023,
        '2023-10-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        11,
        9,
        2023,
        '2023-09-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        11,
        8,
        2023,
        '2023-08-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        11,
        7,
        2023,
        '2023-07-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        12,
        11,
        2020,
        '2020-11-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        12,
        10,
        2020,
        '2020-10-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        12,
        9,
        2020,
        '2020-09-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        12,
        8,
        2020,
        '2020-08-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        12,
        7,
        2020,
        '2020-07-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        13,
        11,
        2020,
        '2020-11-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        13,
        10,
        2020,
        '2020-10-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        13,
        9,
        2020,
        '2020-09-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        13,
        8,
        2020,
        '2020-08-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        13,
        7,
        2020,
        '2020-07-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        14,
        11,
        2023,
        '2023-11-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        14,
        10,
        2023,
        '2023-10-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        14,
        9,
        2023,
        '2023-09-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        14,
        8,
        2023,
        '2023-08-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        14,
        7,
        2023,
        '2023-07-03',
        now(),
        4100,
        200,
        3900
    ),
    (
        15,
        11,
        2023,
        '2023-11-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        15,
        10,
        2023,
        '2023-10-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        15,
        9,
        2023,
        '2023-09-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        15,
        8,
        2023,
        '2023-08-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        15,
        7,
        2023,
        '2023-07-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        16,
        11,
        2023,
        '2023-11-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        16,
        10,
        2023,
        '2023-10-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        16,
        9,
        2023,
        '2023-09-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        16,
        8,
        2023,
        '2023-08-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        16,
        7,
        2023,
        '2023-07-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        17,
        11,
        2023,
        '2023-11-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        17,
        10,
        2023,
        '2023-10-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        17,
        9,
        2023,
        '2023-09-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        17,
        8,
        2023,
        '2023-08-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        17,
        7,
        2023,
        '2023-07-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        18,
        11,
        2023,
        '2023-11-03',
        now(),
        3500,
        200,
        3300
    ),
    (
        18,
        10,
        2023,
        '2023-10-03',
        now(),
        3500,
        200,
        3300
    ),
    (
        18,
        9,
        2023,
        '2023-09-03',
        now(),
        3500,
        200,
        3300
    ),
    (
        18,
        8,
        2023,
        '2023-08-03',
        now(),
        3500,
        200,
        3300
    ),
    (
        18,
        7,
        2023,
        '2023-07-03',
        now(),
        3500,
        200,
        3300
    ),
    (
        19,
        11,
        2023,
        '2023-11-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        19,
        10,
        2023,
        '2023-10-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        19,
        9,
        2023,
        '2023-09-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        19,
        8,
        2023,
        '2023-08-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        19,
        7,
        2023,
        '2023-07-03',
        now(),
        3700,
        200,
        3500
    ),
    (
        20,
        11,
        2023,
        '2023-11-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        20,
        10,
        2023,
        '2023-10-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        20,
        9,
        2023,
        '2023-09-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        20,
        8,
        2023,
        '2023-08-03',
        now(),
        3800,
        400,
        3400
    ),
    (
        20,
        7,
        2023,
        '2023-07-03',
        now(),
        3800,
        400,
        3400
    );
INSERT INTO salary_details (
        salaries_id,
        salary_component_id,
        amount,
        created_at
    )
VALUES (5, 1, 2500, now()),
    (5, 2, 100, now()),
    (5, 3, 100, now()),
    (5, 4, 100, now()),
    (5, 5, 60, now()),
    (5, 6, 60, now()),
    (5, 7, 20, now()),
    (5, 8, 100, now()),
    (10, 1, 3000, now()),
    (10, 2, 100, now()),
    (10, 3, 100, now()),
    (10, 4, 100, now()),
    (10, 5, 70, now()),
    (10, 6, 70, now()),
    (10, 7, 200, now()),
    (10, 8, 300, now()),
    (15, 1, 3500, now()),
    (15, 2, 100, now()),
    (15, 3, 100, now()),
    (15, 4, 100, now()),
    (15, 5, 80, now()),
    (15, 6, 80, now()),
    (15, 7, 200, now()),
    (15, 8, 300, now()),
    (20, 1, 2000, now()),
    (20, 2, 100, now()),
    (20, 3, 100, now()),
    (20, 4, 100, now()),
    (20, 5, 50, now()),
    (20, 6, 50, now()),
    (20, 7, 200, now()),
    (20, 8, 300, now()),
    (25, 1, 2000, now()),
    (25, 2, 100, now()),
    (25, 3, 100, now()),
    (25, 4, 100, now()),
    (25, 5, 40, now()),
    (25, 6, 40, now()),
    (25, 7, 200, now()),
    (25, 8, 300, now()),
    (30, 1, 3500, now()),
    (30, 2, 100, now()),
    (30, 3, 100, now()),
    (30, 4, 100, now()),
    (30, 5, 80, now()),
    (30, 6, 80, now()),
    (30, 7, 200, now()),
    (30, 8, 300, now()),
    (35, 1, 4000, now()),
    (35, 2, 100, now()),
    (35, 3, 100, now()),
    (35, 4, 100, now()),
    (35, 5, 100, now()),
    (35, 6, 90, now()),
    (35, 7, 200, now()),
    (35, 8, 300, now()),
    (40, 1, 4000, now()),
    (40, 2, 100, now()),
    (40, 3, 100, now()),
    (40, 4, 100, now()),
    (40, 5, 100, now()),
    (40, 6, 100, now()),
    (40, 7, 200, now()),
    (40, 8, 300, now()),
    (45, 1, 4000, now()),
    (45, 2, 100, now()),
    (45, 3, 100, now()),
    (45, 4, 100, now()),
    (45, 5, 100, now()),
    (45, 6, 100, now()),
    (45, 7, 200, now()),
    (45, 8, 300, now()),
    (50, 1, 3500, now()),
    (50, 2, 100, now()),
    (50, 3, 100, now()),
    (50, 4, 100, now()),
    (50, 5, 80, now()),
    (50, 6, 80, now()),
    (50, 7, 200, now()),
    (50, 8, 300, now()),
    (55, 1, 3500, now()),
    (55, 2, 100, now()),
    (55, 3, 100, now()),
    (55, 4, 100, now()),
    (55, 5, 80, now()),
    (55, 6, 80, now()),
    (55, 7, 200, now()),
    (55, 8, 300, now()),
    (60, 1, 3800, now()),
    (60, 2, 100, now()),
    (60, 3, 100, now()),
    (60, 4, 100, now()),
    (60, 5, 80, now()),
    (60, 6, 80, now()),
    (60, 7, 200, now()),
    (60, 8, 300, now()),
    (65, 1, 3800, now()),
    (65, 2, 100, now()),
    (65, 3, 100, now()),
    (65, 4, 100, now()),
    (65, 5, 80, now()),
    (65, 6, 80, now()),
    (65, 7, 200, now()),
    (65, 8, 300, now()),
    (70, 1, 3800, now()),
    (70, 2, 100, now()),
    (70, 3, 100, now()),
    (70, 4, 100, now()),
    (70, 5, 80, now()),
    (70, 6, 80, now()),
    (70, 7, 200, now()),
    (70, 8, 300, now()),
    (75, 1, 3400, now()),
    (75, 2, 100, now()),
    (75, 3, 100, now()),
    (75, 4, 100, now()),
    (75, 5, 60, now()),
    (75, 6, 60, now()),
    (75, 7, 200, now()),
    (75, 8, 300, now()),
    (80, 1, 3500, now()),
    (80, 2, 100, now()),
    (80, 3, 100, now()),
    (80, 4, 100, now()),
    (80, 5, 70, now()),
    (80, 6, 70, now()),
    (80, 7, 200, now()),
    (80, 8, 300, now()),
    (85, 1, 3500, now()),
    (85, 2, 100, now()),
    (85, 3, 100, now()),
    (85, 4, 100, now()),
    (85, 5, 70, now()),
    (85, 6, 70, now()),
    (85, 7, 200, now()),
    (85, 8, 300, now()),
    (90, 1, 3200, now()),
    (90, 2, 100, now()),
    (90, 3, 100, now()),
    (90, 4, 100, now()),
    (90, 5, 70, now()),
    (90, 6, 70, now()),
    (90, 7, 200, now()),
    (90, 8, 300, now()),
    (95, 1, 3400, now()),
    (95, 2, 100, now()),
    (95, 3, 100, now()),
    (95, 4, 100, now()),
    (95, 5, 70, now()),
    (95, 6, 70, now()),
    (95, 7, 200, now()),
    (95, 8, 300, now()),
    (100, 1, 4000, now()),
    (100, 2, 100, now()),
    (100, 3, 100, now()),
    (100, 4, 100, now()),
    (100, 5, 100, now()),
    (100, 6, 100, now()),
    (100, 7, 200, now()),
    (100, 8, 300, now());