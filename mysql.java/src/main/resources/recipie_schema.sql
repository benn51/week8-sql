DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS recipie_catagory;
DROP TABLE IF EXISTS unit;
DROP TABLE IF EXISTS catagory;
DROP TABLE IF EXISTS recipie;

CREATE TABLE recipie (
 recipie_id  INT AUTO_INCREMENT  NOT NULL,
 recipie_name VARCHAR(128) NOT NULL,
 notes TEXT,
 num_servings INT,
 prep_time TIME,
 cook_time TIME,
 created_at TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(recipie_id)
 
);

CREATE TABLE catagory (
catagory_id INT AUTO_INCREMENT  NOT NULL,
catagory_name VARCHAR(64) NOT NULL,
PRIMARY KEY(catagory_id)
);

CREATE TABLE unit (
unit_id INT  AUTO_INCREMENT NOT NULL,
unit_name_singular VARCHAR(32) NOT NULL,
unit_name_plural VARCHAR(34) NOT NULL,
PRIMARY KEY(unit_id)
);

CREATE TABLE recipie_catagory (
recipie_id INT NOT NULL,
catagory_id INT NOT NULL,
FOREIGN KEY(recipie_id) REFERENCES recipie(recipie_id) ON DELETE CASCADE,
FOREIGN KEY(catagory_id) REFERENCES catagory(catagory_id) ON DELETE CASCADE,
UNIQUE KEY(recipie_id,catagory_id)
);

CREATE TABLE step (
step_id INT  AUTO_INCREMENT NOT NULL, 
recipie_id INT NOT NULL,
step_order INT NOT NULL,
step_text TEXT NOT NULL,
PRIMARY KEY(step_id),
FOREIGN KEY(recipie_id) REFERENCES recipie(recipie_id) ON DELETE CASCADE

);

CREATE TABLE ingredient (
ingredient_id INT AUTO_INCREMENT NOT NULL,
recipie_id INT NOT NULL,
unit_id INT NOT NULL,
ingredient_name VARCHAR(64) NOT NULL,
instruction VARCHAR(64),
ingredient_order INT NOT NULL,
amount DECIMAL(7,2),
PRIMARY KEY(ingredient_id),
FOREIGN KEY(recipie_id) REFERENCES recipie(recipie_id) ON DELETE CASCADE,
FOREIGN KEY(unit_id) REFERENCES unit(unit_id)

);

