-- Tampilkan daftar kelas yang diajar oleh guru yang sama.
SELECT c.name AS class_name, t.name AS teacher_name
FROM classes c
JOIN teachers t ON c.teacher_id = t.id;
