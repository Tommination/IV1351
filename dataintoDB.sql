-- Inserting dummy data for 'instrument' table
INSERT INTO instrument (value) VALUES
('Piano'),
('Guitar'),
('Violin'),
('Drums'),
('Flute'),
('Saxophone'),
('Trumpet'),
('Cello');

-- Inserting dummy data for 'genre' table
INSERT INTO genre (value) VALUES
('Jazz'),
('Classical'),
('Pop'),
('Rock'),
('Blues');

-- Inserting dummy data for 'genre' table
INSERT INTO skill_level (value) VALUES
('Beginner'),
('Intermediate'),
('Advanced');

-- Inserting dummy data for 'lesson_type' table
INSERT INTO lesson_type (value) VALUES
('Individual'),
('Group'),
('Ensemble');

-- Inserting dummy data for 'price_scheme' table
INSERT INTO price_scheme (scheme) VALUES
('Standard');

-- Inserting dummy data for 'adress' table
INSERT INTO adress (street, street_number, zip, city) VALUES
('Main St', '101', '12345', 'Springfield'),
('Main St', '102', '12346', 'Springfield'),
('Elm St', '201', '12347', 'Rivertown'),
('Maple St', '301', '12348', 'Laketown'),
('Oak St', '401', '12349', 'Greenville'),
('Pine St', '501', '12350', 'Hilltop'),
('Cedar St', '601', '12351', 'Rivercity');

-- Inserting dummy data for 'email' table
INSERT INTO email (email) VALUES
('person1@example.com'),
('person2@example.com'),
('person3@example.com'),
('person4@example.com'),
('person5@example.com'),
('person6@example.com'),
('person7@example.com'),
('person8@example.com'),
('person9@example.com'),
('person10@example.com'),
('person11@example.com'),
('person12@example.com');


-- Inserting dummy data for 'person' table
INSERT INTO person (person_number, first_name, last_name, adress_id) VALUES
('P001', 'Alice', 'Johnson', 1),
('P002', 'Bob', 'Smith', 1),
('P003', 'Charlie', 'Brown', 2),
('P004', 'David', 'Davis', 2),
('P005', 'Eva', 'Wilson', 2),
('P006', 'Frank', 'Taylor', 3),
('P007', 'Grace', 'Anderson', 4),
('P008', 'Hank', 'Martinez', 5),
('P009', 'Ivy', 'Clark', 6),
('P010', 'Jack', 'Lewis', 7);

-- Inserting dummy data for 'person_email' table
INSERT INTO person_email (person_id, email_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting dummy data for 'phone' table
INSERT INTO phone (phone_number) VALUES
('555-1001'),
('555-1002'),
('555-1003'),
('555-1004'),
('555-1005'),
('555-1006'),
('555-1007'),
('555-1008'),
('555-1009'),
('555-1010'),
('555-1011'),
('555-1012');

-- Inserting dummy data for 'person_phone' table
INSERT INTO person_phone (phone_id, person_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting dummy data for 'student' table
INSERT INTO student (enrolled, person_id, price_scheme_id) VALUES
('2024-11-01 10:00:00', 1, 1),
('2024-11-02 11:00:00', 2, 1),
('2024-11-03 12:00:00', 3, 1),
('2024-11-04 13:00:00', 4, 1),
('2024-11-05 14:00:00', 5, 1),
('2024-11-06 15:00:00', 6, 1),
('2024-11-07 16:00:00', 7, 1),
('2024-11-08 17:00:00', 8, 1);

-- Inserting dummy data for 'sibling' table
INSERT INTO sibling (sibling_id, student_id) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 3),
(3, 5),
(5, 3),
(5, 4),
(4, 5);

-- Inserting dummy data for 'contact_person' table
INSERT INTO contact_person (first_name, last_name, relation, student_id) VALUES
('John', 'Doe', 'Father', 1),
('Jane', 'Doe', 'Mother', 2);

-- Inserting dummy data for 'contact_person_email' table
INSERT INTO contact_person_email (contact_person_id, email_id) VALUES
(1, 11),
(2, 12);

-- Inserting dummy data for 'contact_person_phone' table
INSERT INTO contact_person_phone (contact_person_id, phone_id) VALUES
(1, 11),
(2, 12);

-- Inserting dummy data for 'instructor' table
INSERT INTO instructor (teachesEnsemble, person_id) VALUES
(TRUE, 9),
(FALSE, 10);

-- Inserting dummy data for 'instrument_taught' table
INSERT INTO instrument_taught (instrument_id, instructor_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2);

-- Inserting dummy data for 'available_time' table
INSERT INTO available_time (available_time, instructor_id) VALUES
('2024-12-20 09:00:00', 1),
('2024-12-21 10:00:00', 2);





-- Inserting dummy data for 'instrument_lesson' table
INSERT INTO instrument_lesson (skill_level_id, instrument_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5),
(3, 1),
(3, 2);

-- Inserting dummy data for 'group_lesson' table
INSERT INTO group_lesson (min_students, max_students, time_given, instructor_id, instrument_lesson_id) VALUES
(3, 10, '2024-12-08 10:00:00', 1, 1),
(2, 6, '2024-12-11 12:00:00', 2, 2),
(4, 8, '2024-12-12 14:00:00', 1, 3),
(5, 15, '2024-12-13 16:00:00', 2, 4),
(3, 9, '2024-12-14 18:00:00', 2, 5),
(3, 8, '2024-12-23 10:00:00', 2, 5);

-- Inserting dummy data for 'individual_lesson' table
INSERT INTO individual_lesson (instrument_lesson_id, time_given, instructor_id, student_id) VALUES
(1, '2024-12-15 09:00:00', 1, 1),
(2, '2024-12-16 10:00:00', 2, 2),
(3, '2024-12-17 11:00:00', 1, 3),
(4, '2024-12-18 12:00:00', 2, 4),
(5, '2024-12-19 13:00:00', 1, 5),
(6, '2024-11-11 10:00:00', 1, 1);

-- Inserting dummy data for 'ensemble_lesson' table
INSERT INTO ensemble_lesson (group_lesson_id, genre_id) VALUES
(1, 1),
(5, 5);

INSERT INTO student_group_lesson (group_lesson_id, student_id) VALUES
(1, 1),  -- Group lesson 1, Student 1
(1, 2),  -- Group lesson 1, Student 2
(1, 3),  -- Group lesson 1, Student 3
(1, 4),  -- Group lesson 1, Student 4
(2, 5),  -- Group lesson 2, Student 5
(2, 6),  -- Group lesson 2, Student 6
(2, 7),  -- Group lesson 2, Student 7
(2, 8),  -- Group lesson 2, Student 8
(3, 1),  -- Group lesson 3, Student 1
(3, 2),  -- Group lesson 3, Student 2
(3, 3),  -- Group lesson 3, Student 3
(3, 4),  -- Group lesson 3, Student 4
(4, 5),  -- Group lesson 4, Student 5
(4, 6),  -- Group lesson 4, Student 6
(4, 7),  -- Group lesson 4, Student 7
(4, 8),  -- Group lesson 4, Student 8
(5, 1),  -- Group lesson 5, Student 1
(5, 2),  -- Group lesson 5, Student 2
(5, 3),  -- Group lesson 5, Student 3
(5, 5),  -- Group lesson 5, Student 5
(5, 7);  -- Group lesson 5, Student 7

