-- Create flights table
CREATE TABLE flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    origin TEXT NOT NULL,
    destination TEXT NOT NULL,
    duration INTEGER NOT NULL
);

-- Inserts
INSERT INTO flights (origin, destination, duration) VALUES ("New York", "London", 415);
INSERT INTO flights (origin, destination, duration) VALUES ("Shanghai", "Paris", 760);
INSERT INTO flights (origin, destination, duration) VALUES ("Istanbul", "Tokyo", 700);
INSERT INTO flights (origin, destination, duration) VALUES ("New York", "Paris", 435);
INSERT INTO flights (origin, destination, duration) VALUES ("Moscow", "Paris", 245);
INSERT INTO flights (origin, destination, duration) VALUES ("Lima", "New York", 455);

-- Selects
SELECT * FROM flights;
SELECT origin, destination FROM flights;
SELECT * FROM flights WHERE id = 3;
SELECT * FROM flights WHERE origin = "New York";
SELECT * FROM flights WHERE duration > 500;
SELECT * FROM flights WHERE duration > 500 AND destination = "Paris";
SELECT * FROM flights WHERE duration > 500 OR destination = "Paris";
SELECT * FROM flights WHERE origin IN ("New York", "Lima");
SELECT * FROM flights WHERE origin LIKE "%a%";


-- Functions COUNT, MAX, MIN, AVG


-- Update
UPDATE flights SET duration = 430 WHERE origin = "New York" AND destination = "London";

-- Delete
DELETE FROM flights WHERE destination = "Tokyo";

 
CREATE TABLE airports (
  id integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
  code varchar(3) NOT NULL, 
  city varchar(64) NOT NULL)
  ;

  INSERT INTO airports (code, city) VALUES ("JFK", "New York");
  INSERT INTO airports (code, city) VALUES ("PVG", "Shanghai");
  INSERT INTO airports (code, city) VALUES ("IST", "Istanbul");
  INSERT INTO airports (code, city) VALUES ("LHR", "London");
  INSERT INTO airports (code, city) VALUES ("SVO", "Moscow");
  INSERT INTO airports (code, city) VALUES ("LIM", "Lima");
  INSERT INTO airports (code, city) VALUES ("CDG", "Paris");
  INSERT INTO airports (code, city) VALUES ("NRT", "Tokyo");
  
  -- Recreate flights table with FOREIGN KEY into Airport table
DROP TABLE flights;

CREATE TABLE flights (
    id integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
    origin_id integer NOT NULL REFERENCES airports (id),
    destination_id integer NOT NULL REFERENCES airports (id) , 
    duration integer NOT NULL
    );

INSERT INTO flights (origin_id, destination_id, duration) VALUES (1, 4, 415);
INSERT INTO flights (origin_id, destination_id, duration) VALUES (2, 7, 760);
INSERT INTO flights (origin_id, destination_id, duration) VALUES (3, 8, 700);
INSERT INTO flights (origin_id, destination_id, duration) VALUES (1, 7, 435);
INSERT INTO flights (origin_id, destination_id, duration) VALUES (5, 7, 245);
INSERT INTO flights (origin_id, destination_id, duration) VALUES (6, 1, 455);


-- Join
SELECT first, origin, destination FROM flights JOIN passengers ON passengers.flight_id = flights.id;


SELECT o.city, d.city, duration 
FROM flights f 
JOIN airports o ON origin_id = o.id 
JOIN airports d ON destination_id = d.id
WHERE o.code = "JFK";

