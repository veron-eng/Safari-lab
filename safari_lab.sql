
CREATE TABLE enclosures(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    closedForMaintence BOOLEAN
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

CREATE TABLE staffs(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);

CREATE TABLE assignments(
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staffs(id),
    enclosure_id INT REFERENCES enclosures(id),
    day VARCHAR(255)
);

INSERT INTO enclosures (name,closedForMaintence) VALUES ("lion enclosure", false);
INSERT INTO enclosures (name,closedForMaintence) VALUES ("giraffe enclosure", true);
INSERT INTO enclosures (name,closedForMaintence) VALUES ("penguin enclosure", false);
INSERT INTO enclosures (name,closedForMaintence) VALUES ("hippo enclosure", true);

INSERT INTO animals (name,type,age,enclosure_id) VALUES ("lion", "big cat", 15,1);
INSERT INTO animals (name,type,age,enclosure_id) VALUES ("giraffe", "hoofed mammal", 1,2);
INSERT INTO animals (name,type,age,enclosure_id) VALUES ("penguin", "bird", 10,3);
INSERT INTO animals (name,type,age,enclosure_id) VALUES ("hippo", "artiodactyl mammal", 5,4);

INSERT INTO staff (name,employeeNumber) VALUES ("Colin", 1234);
INSERT INTO staff (name,employeeNumber) VALUES ("Anna", 1235);
INSERT INTO staff (name,employeeNumber) VALUES ("Zsolt", 1236);
INSERT INTO staff (name,employeeNumber) VALUES ("Iain", 1237);


INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (1, 1, "Monday");
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (1, 2, "Wednesday");
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (2, 3, "Monday");
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (2, 4, "Thursday");
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (3, 1, "Friday");
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (4, 1, "Tuesday");
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (1, 2, "Sunday");



