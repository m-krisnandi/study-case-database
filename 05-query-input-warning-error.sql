-- Buat query input, yang akan memberikan warning error jika ada data yang sama pernah masuk:
ALTER TABLE students
ADD CONSTRAINT unique_student_name_class UNIQUE (name, class_id);


DELIMITER //

CREATE PROCEDURE insert_student(IN student_name VARCHAR(100), IN student_age INT, IN student_class_id INT)
BEGIN
    DECLARE duplicate_entry CONDITION FOR SQLSTATE '23000';

    DECLARE EXIT HANDLER FOR duplicate_entry
    BEGIN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Duplicate entry for student in the same class.';
    END;

    INSERT INTO students (name, age, class_id)
    VALUES (student_name, student_age, student_class_id);
END //

DELIMITER ;
