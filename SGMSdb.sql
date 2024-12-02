CREATE TABLE adress (
    adress_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    street VARCHAR(100) NOT NULL,
    street_number VARCHAR(20) NOT NULL,
    zip VARCHAR(20) NOT NULL,
    city VARCHAR(100) NOT NULL,
    CONSTRAINT pk_adress PRIMARY KEY (adress_id)
);

CREATE TABLE email (
    email_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT pk_email PRIMARY KEY (email_id)
);

CREATE TABLE genre (
    genre_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    value VARCHAR(100) NOT NULL,
    CONSTRAINT pk_genre PRIMARY KEY (genre_id)
);

CREATE TABLE instrument (
    instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    value VARCHAR(100) NOT NULL,
    CONSTRAINT pk_instrument PRIMARY KEY (instrument_id)
);

CREATE TABLE lesson_type (
    lesson_type_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    value VARCHAR(50) NOT NULL,
    CONSTRAINT pk_lesson_type PRIMARY KEY (lesson_type_id)
);

CREATE TABLE person (
    person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    person_number VARCHAR(12) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    adress_id INT NOT NULL,
    CONSTRAINT pk_person PRIMARY KEY (person_id),
    CONSTRAINT fk_person_adress FOREIGN KEY (adress_id) REFERENCES adress(adress_id)
);

CREATE TABLE person_email (
    person_id INT NOT NULL,
    email_id INT NOT NULL,
    PRIMARY KEY (person_id, email_id),
    CONSTRAINT fk_person_email_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON DELETE CASCADE,
    CONSTRAINT fk_person_email_email FOREIGN KEY (email_id) REFERENCES email(email_id) ON DELETE CASCADE
);

CREATE TABLE phone (
    phone_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    CONSTRAINT pk_phone PRIMARY KEY (phone_id)
);

CREATE TABLE price_scheme (
    price_scheme_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    scheme VARCHAR(1000) NOT NULL,
    CONSTRAINT pk_price_scheme PRIMARY KEY (price_scheme_id)
);

CREATE TABLE rental_instrument (
    instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    type VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
	price FLOAT(2) NOT NULL,
    CONSTRAINT pk_rental_instrument PRIMARY KEY (instrument_id)
);

CREATE TABLE skill_level (
    skill_level_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    value VARCHAR(100) NOT NULL,
    CONSTRAINT pk_skill_level PRIMARY KEY (skill_level_id)
);

CREATE TABLE student (
    student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    enrolled TIMESTAMP(6) NOT NULL,
    person_id INT NOT NULL,
    price_scheme_id INT NOT NULL,
    CONSTRAINT pk_student PRIMARY KEY (student_id),
    CONSTRAINT fk_student_person FOREIGN KEY (person_id) REFERENCES person(person_id),
    CONSTRAINT fk_student_price_scheme FOREIGN KEY (price_scheme_id) REFERENCES price_scheme(price_scheme_id)
);

CREATE TABLE contact_person (
    contact_person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    relation VARCHAR(100),
    student_id INT NOT NULL,
    CONSTRAINT pk_contact_person PRIMARY KEY (contact_person_id),
    CONSTRAINT fk_contact_person_student FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE contact_person_email (
    contact_person_id INT NOT NULL,
    email_id INT NOT NULL,
    PRIMARY KEY (contact_person_id, email_id),
    CONSTRAINT fk_contact_person_email_contact FOREIGN KEY (contact_person_id) REFERENCES contact_person(contact_person_id) ON DELETE CASCADE,
    CONSTRAINT fk_contact_person_email_email FOREIGN KEY (email_id) REFERENCES email(email_id) ON DELETE CASCADE
);

CREATE TABLE contact_person_phone (
    contact_person_id INT NOT NULL,
    phone_id INT NOT NULL,
    PRIMARY KEY (contact_person_id, phone_id),
    CONSTRAINT fk_contact_person_phone_contact FOREIGN KEY (contact_person_id) REFERENCES contact_person(contact_person_id) ON DELETE CASCADE,
    CONSTRAINT fk_contact_person_phone_phone FOREIGN KEY (phone_id) REFERENCES phone(phone_id) ON DELETE CASCADE
);

CREATE TABLE instructor (
    instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    teachesEnsemble BOOLEAN,
    person_id INT NOT NULL,
    CONSTRAINT pk_instructor PRIMARY KEY (instructor_id),
    CONSTRAINT fk_instructor_person FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE instrument_taught (
    instrument_id INT NOT NULL,
    instructor_id INT NOT NULL,
    PRIMARY KEY (instrument_id, instructor_id),
    CONSTRAINT fk_instrument_taught_instrument FOREIGN KEY (instrument_id) REFERENCES instrument(instrument_id) ON DELETE CASCADE,
    CONSTRAINT fk_instrument_taught_instructor FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id) ON DELETE CASCADE
);

CREATE TABLE person_phone (
    phone_id INT NOT NULL,
    person_id INT NOT NULL,
    PRIMARY KEY (phone_id, person_id),
    CONSTRAINT fk_person_phone_phone FOREIGN KEY (phone_id) REFERENCES phone(phone_id) ON DELETE CASCADE,
    CONSTRAINT fk_person_phone_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON DELETE CASCADE
);

CREATE TABLE price_list (
    price_scheme_id INT NOT NULL,
    lesson_price FLOAT(10) NOT NULL,
    discount_rate FLOAT(10) NOT NULL,
    lesson_type_id INT NOT NULL,
    PRIMARY KEY (price_scheme_id, lesson_price, discount_rate, lesson_type_id),
    CONSTRAINT fk_price_list_price_scheme FOREIGN KEY (price_scheme_id) REFERENCES price_scheme(price_scheme_id),
    CONSTRAINT fk_price_list_lesson_type FOREIGN KEY (lesson_type_id) REFERENCES lesson_type(lesson_type_id)
);

CREATE TABLE rental (
    rental_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    lease_end TIMESTAMP(6) NOT NULL,
    instrument_id INT NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT pk_rental PRIMARY KEY (rental_id),
    CONSTRAINT fk_rental_instrument FOREIGN KEY (instrument_id) REFERENCES rental_instrument(instrument_id),
    CONSTRAINT fk_rental_student FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE sibling (
    sibling_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (sibling_id, student_id),
    CONSTRAINT fk_sibling_student FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE
);

CREATE TABLE available_time (
    available_time TIMESTAMP(6) NOT NULL,
    instructor_id INT NOT NULL,
    PRIMARY KEY (available_time, instructor_id),
    CONSTRAINT fk_available_time_instructor FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id) ON DELETE CASCADE
);

CREATE TABLE instrument_lesson (
    instrument_lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
	group_lesson_id INT,
    skill_level_id INT NOT NULL,
    instrument_id INT NOT NULL,
    CONSTRAINT pk_instrument_lesson PRIMARY KEY (instrument_lesson_id),
    CONSTRAINT fk_instrument_lesson_skill_level FOREIGN KEY (skill_level_id) REFERENCES skill_level(skill_level_id),
    CONSTRAINT fk_instrument_lesson_instrument FOREIGN KEY (instrument_id) REFERENCES instrument(instrument_id),
	CONSTRAINT fk_instrument_lesson_group_lesson FOREIGN KEY (group_lesson_id) REFERENCES group_lesson(group_lesson_id)
);

CREATE TABLE group_lesson (
    group_lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    min_students INT NOT NULL,
    max_students INT NOT NULL,
    time_given TIMESTAMP(6) NOT NULL,
    instructor_id INT NOT NULL,
    CONSTRAINT pk_group_lesson PRIMARY KEY (group_lesson_id),
    CONSTRAINT fk_group_lesson_instructor FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
);


CREATE TABLE student_group_lesson (
    group_lesson_id INT NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT pk_student_group_lesson PRIMARY KEY (group_lesson_id, student_id),
    CONSTRAINT fk_student_group_lesson_group FOREIGN KEY (group_lesson_id) REFERENCES group_lesson(group_lesson_id) ON DELETE CASCADE,
    CONSTRAINT fk_student_group_lesson_student FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE SET NULL
);

CREATE TABLE ensemble_lesson (
    group_lesson_id INT NOT NULL,
    genre_id INT NOT NULL,
    CONSTRAINT pk_ensemble_lesson PRIMARY KEY (group_lesson_id),
	CONSTRAINT fk_ensemble_lesson_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
	);
	
CREATE TABLE individual_lesson (
	instrument_lesson_id INT NOT NULL,
	time_given TIMESTAMP(6) NOT NULL,
	instructor_id INT NOT NULL,
	student_id INT NOT NULL,
	CONSTRAINT pk_individual_lesson PRIMARY KEY (instrument_lesson_id),
	CONSTRAINT fk_individual_lesson_instructor FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
	CONSTRAINT fk_individual_lesson_student FOREIGN KEY (student_id) REFERENCES student(student_id)
);

