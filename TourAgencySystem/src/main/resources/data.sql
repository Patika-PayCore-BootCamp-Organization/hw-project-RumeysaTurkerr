DROP TABLE IF EXISTS hotel;

CREATE TABLE hotel
(
    id      INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name    VARCHAR(50)  NOT NULL,
    type    VARCHAR(50)  NOT NULL,
    address VARCHAR(250) NOT NULL,
    description  VARCHAR(250) NOT NULL
);
CREATE TABLE manager(
    id        INT PRIMARY KEY NOT NULL,
    firstname VARCHAR(25)        NOT NULL,
    lastname  VARCHAR(25)        NOT NULL,
)
CREATE TABLE traveller
(
    id        INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    firstname VARCHAR(25)        NOT NULL,
    lastname  VARCHAR(25)        NOT NULL,
    gender    VARCHAR(10),
    age       INT DEFAULT 0,
    phone     VARCHAR(15),
    email     VARCHAR(25) UNIQUE NOT NULL
);

CREATE TABLE vehicle(
   id  INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
   type SMALLINT NOT NULL
)

CREATE TABLE tour(
    id     INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name  VARCHAR(50)  NOT NULL,
    seats INT NOT NULL,
    numberOfDays INT NOT NULL,
    price NUMERIC(5,2) NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle (id),
    FOREIGN KEY (route_id) REFERENCES route (id),
)
CREATE TABLE ticket
(
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    traveller_id INT NOT NULL,
    tour_id    INT NOT NULL,
    FOREIGN KEY (traveller_id) REFERENCES traveller (id),
    FOREIGN KEY (tour_id) REFERENCES tour (id)
);
CREATE TABLE route
(
   id  INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
   places VARCHAR(500) NOT NULL,

);