CREATE TABLE Professeur (
    SSN int,
    PRIMARY KEY(SSN)
);

CREATE TABLE Cours (
    courseid int,
    PRIMARY KEY(courseid)
);

CREATE TABLE enseigne (
    profId int,
    courseId int,
    PRIMARY KEY(profId, courseId),
    FOREIGN KEY(profId) REFERENCES Professeur(SSN),
    FOREIGN KEY(courseId) REFERENCES Cours(courseid)
);