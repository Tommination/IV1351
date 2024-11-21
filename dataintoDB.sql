-- Insert skill levels
INSERT INTO skill_level (value) VALUES ('Beginner');
INSERT INTO skill_level (value) VALUES ('Intermediate');
INSERT INTO skill_level (value) VALUES ('Advanced');

-- Insert genres
INSERT INTO genre (value) VALUES ('Rock');
INSERT INTO genre (value) VALUES ('Pop');
INSERT INTO genre (value) VALUES ('Jazz');

-- Insert instruments
INSERT INTO instrument (value) VALUES ('Guitar');
INSERT INTO instrument (value) VALUES ('Piano');

-- Insert lesson types
INSERT INTO lesson_type (value) VALUES ('Group');
INSERT INTO lesson_type (value) VALUES ('Individual');
INSERT INTO lesson_type (value) VALUES ('Ensemble');

-- Insert price scheme
INSERT INTO price_scheme (scheme) VALUES ('Standard Scheme');

-- Insert addresses (for students)
INSERT INTO adress (street, street_number, zip, city) VALUES ('Main St', '123', '12345', 'Somewhere');
INSERT INTO adress (street, street_number, zip, city) VALUES ('Oak St', '456', '67890', 'Anywhere');

-- Insert persons (5 persons total: 2 instructors, 3 students)
-- Two instructors
INSERT INTO person (person_number, first_name, last_name, adress_id) 
VALUES ('P001', 'Alice', 'Smith', 1);  -- Alice, Instructor
INSERT INTO person (person_number, first_name, last_name, adress_id) 
VALUES ('P002', 'Bob', 'Jones', 2);  -- Bob, Instructor

-- Three students
INSERT INTO person (person_number, first_name, last_name, adress_id) 
VALUES ('P003', 'Charlie', 'Brown', 1);  -- Charlie, Student
INSERT INTO person (person_number, first_name, last_name, adress_id) 
VALUES ('P004', 'David', 'Wilson', 1);  -- David, Student
INSERT INTO person (person_number, first_name, last_name, adress_id) 
VALUES ('P005', 'Eve', 'Johnson', 2);  -- Eve, Student

-- Insert emails (one email per person)
INSERT INTO email (email) VALUES ('alice.smith@email.com');
INSERT INTO email (email) VALUES ('bob.jones@email.com');
INSERT INTO email (email) VALUES ('charlie.brown@email.com');
INSERT INTO email (email) VALUES ('david.wilson@email.com');
INSERT INTO email (email) VALUES ('eve.johnson@email.com');

-- Insert person_email relationships
INSERT INTO person_email (person_id, email_id) VALUES (1, 1); -- Alice
INSERT INTO person_email (person_id, email_id) VALUES (2, 2); -- Bob
INSERT INTO person_email (person_id, email_id) VALUES (3, 3); -- Charlie
INSERT INTO person_email (person_id, email_id) VALUES (4, 4); -- David
INSERT INTO person_email (person_id, email_id) VALUES (5, 5); -- Eve

-- Insert phone numbers (one phone per person)
INSERT INTO phone (phone_number) VALUES ('123-456-7890');
INSERT INTO phone (phone_number) VALUES ('234-567-8901');
INSERT INTO phone (phone_number) VALUES ('345-678-9012');
INSERT INTO phone (phone_number) VALUES ('456-789-0123');
INSERT INTO phone (phone_number) VALUES ('567-890-1234');

-- Insert person_phone relationships
INSERT INTO person_phone (phone_id, person_id) VALUES (1, 1); -- Alice
INSERT INTO person_phone (phone_id, person_id) VALUES (2, 2); -- Bob
INSERT INTO person_phone (phone_id, person_id) VALUES (3, 3); -- Charlie
INSERT INTO person_phone (phone_id, person_id) VALUES (4, 4); -- David
INSERT INTO person_phone (phone_id, person_id) VALUES (5, 5); -- Eve

-- Insert instructors
INSERT INTO instructor (teachesEnsemble, person_id) VALUES (TRUE, 1); -- Alice (Instructor 1)
INSERT INTO instructor (teachesEnsemble, person_id) VALUES (TRUE, 2); -- Bob (Instructor 2)

-- Insert instrument_taught (linking instructors with instruments they teach)
INSERT INTO instrument_taught (instrument_id, instructor_id) VALUES (1, 1);  -- Alice teaches Guitar
INSERT INTO instrument_taught (instrument_id, instructor_id) VALUES (2, 2);  -- Bob teaches Piano

-- Insert student records (3 students)
INSERT INTO student (enrolled, person_id, price_scheme_id) VALUES (NOW(), 3, 1); -- Charlie
INSERT INTO student (enrolled, person_id, price_scheme_id) VALUES (NOW(), 4, 1); -- David
INSERT INTO student (enrolled, person_id, price_scheme_id) VALUES (NOW(), 5, 1); -- Eve

-- Insert sibling relationship (Charlie and David)
INSERT INTO sibling (sibling_id, student_id) VALUES (4, 3); -- Charlie and David are siblings

-- Insert lessons

-- One individual lesson (Charlie, Guitar) - using the Beginner skill level
INSERT INTO instrument_lesson (skill_level_id, instrument_id) VALUES (1, 1);  -- Guitar lesson (Beginner)
INSERT INTO individual_lesson (instrument_lesson_id, time_given, instructor_id, student_id) 
VALUES (1, NOW(), 1, 3);  -- Individual lesson for Charlie with Alice (Guitar)

-- One ensemble lesson (Bob teaches Ensemble) - Genre is Rock
INSERT INTO ensemble_lesson (group_lesson_id, genre_id) VALUES (1, 1);  -- Rock genre
INSERT INTO group_lesson (min_students, max_students, time_given, instructor_id, instrument_lesson_id)
VALUES (2, 5, NOW(), 2, NULL);  -- Group lesson with no specific instrument lesson (Ensemble lesson)

-- One group lesson (Charlie and David in the same group) - using the Intermediate skill level
INSERT INTO student_group_lesson (group_lesson_id, student_id) VALUES (1, 3);  -- Charlie in group lesson
INSERT INTO student_group_lesson (group_lesson_id, student_id) VALUES (1, 4);  -- David in group lesson

-- Insert a pricing record for the lesson type
INSERT INTO price_list (price_scheme_id, lesson_price, discount_rate, lesson_type_id) 
VALUES (1, 50.0, 0.25, 1); -- Price for group lessons with a 25% discount

-- Insert instrument rental for Eve (renting a Fender Stratocaster guitar)
INSERT INTO rental_instrument (instrument_id, type, brand) 
VALUES (1, 'Electric Guitar', 'Fender');  -- Stratocaster guitar by Fender

-- Insert rental record for Eve (renting the Stratocaster guitar)
INSERT INTO rental (lease_end, instrument_id, student_id) 
VALUES (NOW() + INTERVAL '1 year', 1, 5);  -- Eve rents the guitar for one year

-- Insert contact person for Eve (one student with contact person)
INSERT INTO contact_person (first_name, last_name, relation, student_id) 
VALUES ('John', 'Johnson', 'Father', 5);  -- Eve's father as contact person

-- Insert contact person email
INSERT INTO contact_person_email (contact_person_id, email_id) 
VALUES (1, 5);  -- Link the contact person's email (Father of Eve)
