-- ajout de la note de passage d'un cours
ALTER TABLE courses
ADD passing_grade varchar(255)
Default 'D'