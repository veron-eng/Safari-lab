DROP TABLE assignments;
DROP TABLE staffs;
DROP TABLE animals;
DROP TABLE enclosures;



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

INSERT INTO enclosures (name,closedForMaintence) VALUES ('lion enclosure', false);
INSERT INTO enclosures (name,closedForMaintence) VALUES ('giraffe enclosure', true);
INSERT INTO enclosures (name,closedForMaintence) VALUES ('penguin enclosure', false);
INSERT INTO enclosures (name,closedForMaintence) VALUES ('hippo enclosure', true);

INSERT INTO animals (name,type,age,enclosure_id) VALUES ('lion', 'big cat', 20,1);
INSERT INTO animals (name,type,age,enclosure_id) VALUES ('giraffe', 'hoofed mammal', 1,2);
INSERT INTO animals (name,type,age,enclosure_id) VALUES ('penguin', 'bird', 10,3);
INSERT INTO animals (name,type,age,enclosure_id) VALUES ('zebra', 'artiodactyl mammal', 20,4);
INSERT INTO animals (name,type,age,enclosure_id) VALUES ('hippo2', 'artiodactyl mammal', 15,4);

INSERT INTO staffs (name,employeeNumber) VALUES ('Colin', 1234);
INSERT INTO staffs (name,employeeNumber) VALUES ('Anna', 1235);
INSERT INTO staffs (name,employeeNumber) VALUES ('Zsolt', 1236);
INSERT INTO staffs (name,employeeNumber) VALUES ('Iain', 1237);


INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (1, 1, 'Monday');
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (1, 2, 'Wednesday');
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (2, 3, 'Monday');
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (2, 4, 'Thursday');
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (3, 1, 'Friday');
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (4, 1, 'Tuesday');
INSERT INTO assignments (employee_id,enclosure_id,day) VALUES (1, 3, 'Sunday');

-- The names of the animals in a given enclosure:
-- SELECT animals.name 
-- FROM enclosures 
-- INNER JOIN animals
-- ON enclosures.id = animals.enclosure_id
-- WHERE enclosures.name = 'lion enclosure';

-- The names of the staff working in a given enclosure
-- SELECT staffs.name 
-- FROM enclosures 
-- INNER JOIN assignments
-- ON enclosures.id = assignments.enclosure_id
-- INNER JOIN staffs 
-- ON assignments.employee_id = staffs.id
-- WHERE enclosures.name = 'lion enclosure';


-- The names of staff  orking in enclosures which are closed for maintenance
-- SELECT staffs.name 
-- FROM enclosures 
-- INNER JOIN assignments
-- ON enclosures.id = assignments.enclosure_id
-- INNER JOIN staffs 
-- ON assignments.employee_id = staffs.id
-- WHERE enclosures.closedformaintence = true;


-- The name of the enclosure where the oldest animal lives. If there are two animals who are the same age choose the first one alphabetically.
-- SELECT enclosures.name 
-- FROM enclosures 
-- INNER JOIN animals
-- ON enclosures.id = animals.enclosure_id 
-- ORDER BY animals.age DESC LIMIT 1

-- The number of different animal types a given keeper has been assigned to work with (not finished)
--SELECT COUNT (DISTINCT animals.type) 
-- FROM staffs
-- INNER JOIN assignments
-- ON employee.id = assignmentenclosure_id 
-- FROM staffs
-- INNER JOIN assignments
-- FROM staffs
-- INNER JOIN assignments
-- ON enclosures.id = animals.enclosure_id ON enclosures.id = animals.enclosure_id 
-- WHERE staffs.name =  'Colin'
