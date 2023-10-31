# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int PRIMARY KEY NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(4096) NOT NULL,
    tag varchar(255) NOT NULL,
    url varchar(255),
    time_commitment int
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills VALUES (
  001, 
  'Infiltration', 
  'A master of disguise, espionage, and subterfuge. They can blend into any environment and assume various identities, making them ideal for covert operations.', 
  'Skill 1',
  'https://en.wikipedia.org/wiki/Infiltrator',
  100
);

INSERT INTO skills VALUES (
  002, 
  'Sniper', 
  'An expert marksman with unparalleled accuracy, the sniper is deadly from long distances. They can eliminate targets with precision and minimal risk of exposure.', 
  'Skill 2',
  'https://',
  200
);

INSERT INTO skills VALUES (
  003, 
  'Negotiation', 
  'Skilled in extracting information from targets through persuasion and manipulation. They can be useful in obtaining critical intel without resorting to violence.', 
  'Skill 3',
  'https://',
  50
);

INSERT INTO skills VALUES (
  004, 
  'Medicine', 
  'The medic can provide essential medical assistance to injured team members, ensuring their survival and recovery.', 
  'Skill 4',
  'https://',
  100
);

INSERT INTO skills VALUES (
  005, 
  'Getaway Driving', 
  'Skilled driver specializing in rapid escapes, ensuring the safety of the crew during missions and high-pressure situations', 
  'Skill 5',
  'https://',
  35
);

INSERT INTO skills VALUES (
  006, 
  'Hand-to-hand combat', 
  'Master of close-quarters combat, excelling in unarmed combat techniques for self-defense and offense.', 
  'Skill 6',
  'https://en.wikipedia.org/wiki/Hand-to-hand_combat',
  300
);

INSERT INTO skills VALUES (
  007, 
  'Stealth', 
  'Expert in stealth, lockpicking, and subterfuge, skilled at bypassing security measures and executing covert operations.', 
  'Skill 7',
  'https://',
  25
);

INSERT INTO skills VALUES (
  008, 
  'Chemistry', 
  'Proficient in chemistry and chemical analysis, with expertise in creating, analyzing, and manipulating chemical compounds.', 
  'Skill 8',
  'https://',
  500
);


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int PRIMARY KEY NOT NULL,
    first_name varchar(255) DEFAULT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) DEFAULT NULL,
    linkedin_url varchar(255) DEFAULT NULL,
    headshot_url varchar(255) DEFAULT NULL,
    discord_handle varchar(255) DEFAULT NULL,
    brief_bio varchar(4096) DEFAULT NULL,
    date_joined date NOT NULL DEFAULT '2000-01-01'
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people VALUES (
  101,
  'Beatrix',
  'Person 1',
  'beatrix@gmail.com',
  'https://mylinkedin.com',
  'https://myheadshot.com',
  '@beatrix',
  'Beatrix is so cool',
  '2000-01-01'
  );

INSERT INTO people VALUES (
  102,
  'Bill',
  'Person 2',
  'bill@gmail.com',
  'https://mylinkedin.com',
  'https://myheadshot.com',
  '@bill',
  'Bill is so cool',
  '2000-01-01'
  );

INSERT INTO people VALUES (
  103,
  'O-Ren',
  'Person 3',
  'o-ren@gmail.com',
  'https://mylinkedin.com',
  'https://myheadshot.com',
  '@o-ren',
  'O-ren is so cool',
  '2000-01-01'
  );

INSERT INTO people VALUES (
  104,
  'Vernita',
  'Person 4',
  'vernita@gmail.com',
  'https://mylinkedin.com',
  'https://myheadshot.com',
  '@vernita',
  'Vernita is so cool',
  '2000-01-01'
  );

INSERT INTO people VALUES (
  105,
  'Budd',
  'Person 5',
  'budd@gmail.com',
  'https://mylinkedin.com',
  'https://myheadshot.com',
  '@budd',
  'Budd is so cool',
  '2000-01-01'
  );

INSERT INTO people VALUES (
  106,
  'Elle',
  'Person 6',
  'elle@gmail.com',
  'https://mylinkedin.com',
  'https://myheadshot.com',
  '@elle',
  'Elle is so cool',
  '2000-01-01'
  );


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
  id int AUTO_INCREMENT PRIMARY KEY,
  skills_id int NOT NULL,
  people_id int NOT NULL,
  date_acquired date NOT NULL DEFAULT '2000-01-01',
  FOREIGN KEY (skills_id) REFERENCES skills(id),
  FOREIGN KEY (people_id) REFERENCES people(id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
# Person 1
INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  001, 
  101
);

INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  003, 
  101
);

INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  006, 
  101
);

# Person 2
INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  003, 
  102
);

INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  004, 
  102
);

INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  005, 
  102
);

# Person 3
INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  001, 
  103
);

INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  005, 
  103
);

# Person 5
INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  003, 
  105
);

INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  006, 
  105
);

# Person 6
INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  002, 
  106
);

INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  003, 
  106
);

INSERT INTO peopleskills(skills_id, people_id) 
VALUES (
  004, 
  106
);


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
  id int PRIMARY KEY NOT NULL,
  name varchar(255) NOT NULL,
  sort_priority int
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority) 
VALUES(
  201,
  'Designer',
  10
);

INSERT INTO roles (id, name, sort_priority) 
VALUES(  
  202,
  'Developer',
  20
);

INSERT INTO roles (id, name, sort_priority) 
VALUES(  
  203,
  'Recruit',
  30
);

INSERT INTO roles (id, name, sort_priority) 
VALUES(  
  204,
  'Team Lead',
  40
);

INSERT INTO roles (id, name, sort_priority) 
VALUES(  
  205,
  'Boss',
  50
);

INSERT INTO roles (id, name, sort_priority) 
VALUES(  
  206,
  'Mentor',
  60
);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
  id int AUTO_INCREMENT PRIMARY KEY,
  people_id int NOT NULL,
  role_id int NOT NULL,
  date_assigned date NOT NULL DEFAULT '2000-01-01',
  FOREIGN KEY (people_id) REFERENCES people(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

# Person 1
INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  101,
  201
);

# Person 2
INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  102,
  205
);

INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  102,
  206
);

# Person 3
INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  103,
  202
);

INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  103,
  204
);

# Person 4
INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  104,
  203
);

# Person 5
INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  105,
  203
);

# Person 6
INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  106,
  202
);

INSERT INTO peopleroles (people_id, role_id) 
VALUES (
  106,
  201
);

