CREATE TABLE artists (
    name varchar(20),
    birthplace varchar(20),
    style varchar(20),
    dateofbirth DATE,
    PRIMARY KEY(name)
);

CREATE TABLE customers (
    id integer,
    name varchar(20),
    address varchar(20),
    amount numeric(8,2),
    PRIMARY KEY(id)
);

CREATE TABLE artworks (
    title varchar(20),
    year integer,
    type varchar(20),
    price numeric(8,2),
    artist_name varchar(20),
    PRIMARY KEY(title),
    FOREIGN KEY(artist_name) REFERENCES artists(name)
);

CREATE TABLE likeartists (
    customer_id integer,
    artist_name varchar(20),
    PRIMARY KEY(artist_name, customer_id),
    FOREIGN KEY(artist_name) REFERENCES artists(name),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);