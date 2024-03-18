-- Check if the persons table exists, drop it if it does
DROP TABLE IF EXISTS persons;

-- Check if the roles table exists, drop it if it does
DROP TABLE IF EXISTS roles;

-- Create the roles table
CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50)
);

-- Insert initial role data
INSERT INTO roles (role_name) VALUES 
    ('member'),
    ('librarian'),
    ('admin');

-- Create the persons table
CREATE TABLE persons (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    surname VARCHAR(50),
    address VARCHAR(100),
    postcode VARCHAR(20),
    phonenumber VARCHAR(20),
    username VARCHAR(50),
    password VARCHAR(50),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Inserting sample data into the persons table
INSERT INTO persons (firstname, surname, address, postcode, phonenumber, username, password, role_id) 
VALUES 
    ('Mickey', 'Mouse', 'Disneyland', '12345', '555-1234', 'mickeymouse', 'password123', 3),  
    ('Minnie', 'Mouse', 'Disneyland', '12345', '555-5678', 'minniemouse', 'password456', 1),  
    ('Donald', 'Duck', 'Disneyland', '12345', '555-4321', 'donaldduck', 'password789', 1),  
    ('Goofy', 'Goof', 'Disneyland', '12345', '555-8765', 'goofy', 'password012', 2),  
    ('Pluto', 'Dog', 'Disneyland', '12345', '555-2109', 'pluto', 'password345', 1),  
    ('Cinderella', 'Princess', 'Disney Castle', '54321', '555-6789', 'cinderella', 'password678', 3),  
    ('Snow', 'White', 'Dwarf Cottage', '54321', '555-9012', 'snowwhite', 'password901', 1),  
    ('Ariel', 'Mermaid', 'Under the Sea', '54321', '555-3456', 'ariel', 'password234', 3),  
    ('Belle', 'Beauty', 'Beast Castle', '54321', '555-7890', 'belle', 'password567', 1),  
    ('Simba', 'Lion', 'Pride Rock', '54321', '555-1234', 'simba', 'password890', 1),  
    ('Mufasa', 'Lion', 'Pride Rock', '54321', '555-5678', 'mufasa', 'password123', 3),  
    ('Timon', 'Meerkat', 'Pride Rock', '54321', '555-4321', 'timon', 'password456', 2),  
    ('Pumbaa', 'Warthog', 'Pride Rock', '54321', '555-8765', 'pumbaa', 'password789', 1),  
    ('Aladdin', 'Prince', 'Agrabah', '67890', '555-9876', 'aladdin', 'password012', 3),  
    ('Jasmine', 'Princess', 'Agrabah', '67890', '555-6543', 'jasmine', 'password345', 1),  
    ('Genie', 'Genie', 'Lamp', '67890', '555-3210', 'genie', 'password678', 1),  
    ('Hercules', 'Hero', 'Mount Olympus', '67890', '555-8765', 'hercules', 'password901', 3),  
    ('Megara', 'Heroine', 'Mount Olympus', '67890', '555-5432', 'megara', 'password234', 1),  
    ('Pocahontas', 'Princess', 'Powhatan Village', '67890', '555-2109', 'pocahontas', 'password567', 1),  
    ('Tarzan', 'Tarzan', 'Jungle', '67890', '555-7890', 'tarzan', 'password890', 3);
