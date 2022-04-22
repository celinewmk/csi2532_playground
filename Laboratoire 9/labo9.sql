-- Exercice 1

CREATE TABLE Book(
    Bookid varchar(20),
    Authorid integer,
    Amount numeric(7,2),
    Rating integer,
    Booktype varchar(25),
    PRIMARY KEY(Bookid),
    FOREIGN KEY(Authorid) REFERENCES Author ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK (Rating >= 1 AND Rating <= 10),
    CHECK (Amount > 0),
    CHECK (Booktype IN ('Fiction-adulte','Non-fiction-adulte','Fiction-jeunesse',
                        'Non-fiction-jeuness'))
);

-- Exercice 2

CREATE TABLE Author(
    Authorid integer,
    Authorname varchar(20),
    PRIMARY KEY(Authorid)
);

CREATE ASSERTION limitNum
CHECK (
    (SELECT COUNT(*) FROM Book) +
    (SELECT COUNT(*) FROM Author) <= 10000
)

-- Exercice 3

CREATE TRIGGER trigger_update_rating
    BEFORE UPDATE ON Book
    FOR EACH ROW
    EXECUTE PROCEDURE check_book_rating();


-- Exercice 4

-- i)
ALTER TABLE Author
ADD author_sum_rating integer
CONSTRAINT default_val DEFAULT (0);

-- ii)
CREATE TRIGGER trigger_book_rating
    AFTER UPDATE OR INSERT ON Book
    FOR EACH ROW
    WHEN (pg_trigger_depth() = 0)
    EXECUTE PROCEDURE update_author_rating();

CREATE FUNCTION update_author_rating()
    RETURNS trigger AS $$
BEGIN
    IF NEW.Rating > 0 THEN
        UPDATE Author
        SET author_sum_rating = (
                SELECT SUM(B.Rating) 
                FROM BOOK AS B
                WHERE NEW.Authorid = B.Authorid
            )
        WHERE NEW.Authorid = Authorid;
    END IF;
    RETURN NEW;

END;

$$ LANGUAGE plpgsql;