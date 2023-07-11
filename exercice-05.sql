-- Exo 5
-- Requêtes avec jointure « many to many »

-- Exo 5.1
-- Listez tous les students avec leurs tags

-- Reponse 1
SELECT student.firstname, student.lastname, tag.name
FROM student_tag
INNER JOIN student ON student_tag.student_id = student.id
INNER JOIN tag ON student_tag.tag_id = tag.id;

-- Reponse 2
SELECT student.firstname, student.lastname, tag.name
FROM student 
INNER JOIN student_tag ON student_tag.student_id = student.id 
INNER JOIN tag ON tag.id = student_tag.tag_id;

-- Exo 5.2
-- Listez tous les tags avec leurs students

-- Reponse 1
SELECT tag.name, student.firstname, student.lastname 
FROM student_tag
INNER JOIN student ON student_tag.student_id = student.id
INNER JOIN tag ON student_tag.tag_id = tag.id;

-- Reponse 2
SELECT student.firstname, student.lastname, tag.name 
FROM tag 
INNER JOIN student_tag ON student_tag.student_id = student.id 
INNER JOIN student ON student.id = student_tag.student_id;

-- Exo 5.3
-- Listez le student dont l'id est `2` avec ses tags

-- Reponse 1
SELECT student.firstname, student.lastname, tag.name
FROM student_tag
INNER JOIN student ON student_tag.student_id = student.id
INNER JOIN tag ON student_tag.tag_id = tag.id
WHERE student.id = 2;

-- Reponse 2
SELECT student.firstname, student.lastname, tag.name
FROM student 
INNER JOIN student_tag ON student_tag.student_id = student.id 
INNER JOIN tag ON tag.id = student_tag.tag_id
WHERE student.id = 2;

-- Exo 5.4
-- Listez le tag dont l'id est `2` avec ses students

-- Reponse 1
SELECT tag.name, student.firstname, student.lastname 
FROM student_tag
INNER JOIN student ON student_tag.student_id = student.id
INNER JOIN tag ON student_tag.tag_id = tag.id
WHERE tag.id = 2;

-- Reponse 2
SELECT student.firstname, student.lastname, tag.name 
FROM tag 
INNER JOIN student_tag ON student_tag.student_id = student.id 
INNER JOIN student ON student.id = student_tag.student_id
WHERE tag.id = 2;
