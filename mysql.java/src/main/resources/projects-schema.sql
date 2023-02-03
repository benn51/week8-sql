DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_catagory;
DROP TABLE IF EXISTS catagory;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
 project_id  INT AUTO_INCREMENT  NOT NULL,
 project_name VARCHAR(128) NOT NULL,
 estimated_hours DECIMAL(7,2),
 actual_hour DECIMAL(7,2),
 difficulty INT,
 notes TEXT,
 PRIMARY KEY(project_id)
 );

CREATE TABLE catagory (
catagory_id INT AUTO_INCREMENT  NOT NULL,
catagory_name VARCHAR(128) NOT NULL,
PRIMARY KEY(catagory_id)
);

CREATE TABLE project_catagory (
project_id INT NOT NULL,
catagory_id INT NOT NULL,
FOREIGN KEY(project_id) REFERENCES project(project_id) ON DELETE CASCADE,
FOREIGN KEY(catagory_id) REFERENCES catagory(catagory_id) ON DELETE CASCADE,
UNIQUE KEY(project_id,catagory_id)
);

CREATE TABLE step (
step_id INT  AUTO_INCREMENT NOT NULL, 
project_id INT NOT NULL,
step_text TEXT NOT NULL,
step_order INT NOT NULL,
PRIMARY KEY(step_id),
FOREIGN KEY(project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE material (
material_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT ,
cost DECIMAL(7,2),
PRIMARY KEY(material_id),
FOREIGN KEY(project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

