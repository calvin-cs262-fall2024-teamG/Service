-- 
-- This sql is for the rentscout app
-- @author Theo Perumal
-- edited and updated by Jonathan Lundberg
-- Fall 2024

-- several pieces of data in this database are incorrect and merely for demonstration purposes
-- this includes:
-- property: pet friendly status and rating
-- landlord: phones, emails, and websites
-- student: names and emails
-- review: all

-- Drop outdated RentScout tables if they exist

DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Landlord;
DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
    ID SERIAL PRIMARY KEY,
    email varchar(255) UNIQUE NOT NULL
);

CREATE TABLE Landlord ( 
    ID SERIAL PRIMARY KEY,
    name varchar(100),
    website varchar(100),
    phoneNumber varchar(15),
    emailAddress varchar(255)
);

CREATE TABLE Property (
    ID SERIAL PRIMARY KEY,
    landlordID integer REFERENCES Landlord(ID),
    bannerImage varchar(1000),
    streetAddress varchar(100),
    bedroomNum integer,
    bathroomNum FLOAT,
    price integer,
    distanceToCalvin FLOAT,
    distanceToBusStop FLOAT,
    petFriendly BOOLEAN
);

CREATE TABLE Review (
    studentID integer REFERENCES Student(ID),
    propertyID integer REFERENCES Property(ID),
    rating integer,
    reviewText varchar(2047)
);

GRANT SELECT ON Student TO PUBLIC;
GRANT SELECT ON Landlord TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON Review TO PUBLIC;

INSERT INTO Student(email) VALUES ('jtl23@calvin.edu');
INSERT INTO Student(email) VALUES ('tkp89@calvin.edu');
INSERT INTO Student(email) VALUES ('oef45@calvin.edu');
INSERT INTO Student(email) VALUES ('mvp32@calvin.edu');
INSERT INTO Student(email) VALUES ('pql8@calvin.edu');
INSERT INTO Student(email) VALUES ('kvl1@calvin.edu');
INSERT INTO Student(email) VALUES ('pio92@calvin.edu');
INSERT INTO Student(email) VALUES ('qne12@calvin.edu');
INSERT INTO Student(email) VALUES ('kpl8@calvin.edu');
INSERT INTO Student(email) VALUES ('yyt7@calvin.edu');
INSERT INTO Student(email) VALUES ('asd123@calvin.edu');
INSERT INTO Student(email) VALUES ('jtlundberg43@gmail.com');

INSERT INTO Landlord VALUES (1, 'Erik Kraayeveld', 'https://www.kraayeveldproperties.com/', '616-123-4567', 'contact@kraayeveldproperties.com');
INSERT INTO Landlord VALUES (2, 'Cathy Sevigny', null, null, null);
INSERT INTO Landlord VALUES (3, 'Continental Properties Co', 'continentalProperties.org', '616-123-4567', 'contact@contentialProperties.org');
INSERT INTO Landlord VALUES (4, 'Brian Tagg', null, '616-987-6543', 'btagg@yahoo.com');
INSERT INTO Landlord VALUES (5, 'Shift Management LLC', null, null, null);
INSERT INTO Landlord VALUES (6, 'Aiesha Reynolds', null, '616-555-5555', 'aieshareynolds@outlook.com');
INSERT INTO Landlord VALUES (7, 'HCW Realty', null, null, null);
INSERT INTO Landlord VALUES (8, 'Rental Properties Consultant LLC', null, null, null);

INSERT INTO Property VALUES (1, 1, 'https://media.discordapp.net/attachments/715308386941403141/1318663633202315264/1610_Rossman.png?ex=676324b5&is=6761d335&hm=b02870c8f8a258ec1d27cafab912964d79057328356cba1315d5393625f6a7a1&=&format=webp&quality=lossless&width=449&height=392', '1610 Rossman Ave, Grand Rapids MI, 49507', 5, 2.5, 2200, 2.2, 0.6, true);
INSERT INTO Property VALUES (2, 1, 'https://media.discordapp.net/attachments/715308386941403141/1318663634850676796/1024_Burton.png?ex=676324b6&is=6761d336&hm=da3d3994d457acd3337ab9a6b790035381ca0a886dffa2c76d890f08c533d604&=&format=webp&quality=lossless&width=640&height=584', '1024 Burton St SE, Grand Rapids, MI 49507', 4, 2, 1750, 2.8, 0.3, false);
INSERT INTO Property VALUES (3, 1, 'https://media.discordapp.net/attachments/715308386941403141/1318663633487659153/1421_Sherman.png?ex=676324b5&is=6761d335&hm=567fa0b6c7a9bbb3f64bc9ce8354a7bf52881a342e8083ff7843d500a85fd43f&=&format=webp&quality=lossless&width=473&height=473', '1421 Sherman St SE, Grand Rapids, MI 49506', 5, 2, 2000, 2.8, 0.4, false);
INSERT INTO Property VALUES (4, 1, 'https://media.discordapp.net/attachments/715308386941403141/1318663632208396458/249_Alger.png?ex=676324b5&is=6761d335&hm=a872e6b1f91bc92e3657d17b0e63c6c037c09a5162d3750793f0323c49770120&=&format=webp&quality=lossless&width=473&height=473', '249 Alger St SE, Grand Rapids, MI 49507', 5, 2, 1950, 3.8, 0.3, false);
INSERT INTO Property VALUES (5, 1, 'https://media.discordapp.net/attachments/715308386941403141/1318663633848238161/1314_Boston.png?ex=676324b5&is=6761d335&hm=a8cac8f3f333a5aa1d8bf77d82c2de6e21bcd9973a5609c06605430075845faa&=&format=webp&quality=lossless&width=471&height=433', '1314 Boston St SE, Grand Rapids, MI 40507', 4, 2, 1700, 2.5, 0.2, true);
INSERT INTO Property VALUES (6, 2, 'https://media.discordapp.net/attachments/715308386941403141/1318663634129387581/118_National.png?ex=676324b5&is=6761d335&hm=614cad3e760c6abbf7eb14c658d4c3aac52b8c9d1383b13bec7ae1113906e4b5&=&format=webp&quality=lossless&width=410&height=430    ', '118 National Ave SW, Grand Rapids, MI 49504', 2, 1, 1475, 5.4, 0.2, true);
INSERT INTO Property VALUES (7, 3, 'https://media.discordapp.net/attachments/715308386941403141/1318663632883810437/2010_Deciduous.png?ex=676324b5&is=6761d335&hm=f26390a8efbee0bef68cf689077ab8c95098bdf64b8deb385ad58dd92601d0c3&=&format=webp&quality=lossless&width=545&height=548', '2010 Deciduous Dr, Grand Rapids MI 49505', 2, 3, 2280, 4.8, 0.7, false);
INSERT INTO Property VALUES (8, 4, 'https://media.discordapp.net/attachments/715308386941403141/1318663632556527646/2142_Stafford.png?ex=676324b5&is=6761d335&hm=b2b50e1f7f059bb4b3ef0c3b5ae01a44a2832f63bd4e1d9315ce3d26c0f7360a&=&format=webp&quality=lossless&width=346&height=367', '2142 Stafford Ave SW, Grand Rapids, MI 49507', 3, 1, 2000, 4.5, 0.3, true);
INSERT INTO Property VALUES (9, 4, 'https://media.discordapp.net/attachments/715308386941403141/1318663589598335057/3476_Bluebird.png?ex=676324ab&is=6761d32b&hm=7993ee63f4aab08eef5c1ac7b88f271a645e37bf12a0dd69745fe7b44090ec9f&=&format=webp&quality=lossless&width=403&height=369', '3476 Bluebird Ave SW, Wyoming MI, 49519', 3, 1, 2100, 7.4, 0.3, false);
INSERT INTO Property VALUES (10, 5, 'https://media.discordapp.net/attachments/715308386941403141/1318663634565730415/1126_Merrifield.png?ex=676324b6&is=6761d336&hm=2d8a6a40c5fd9c196f519f8584e8773c046e6e4d09f2d43ba033ffb64c920fc7&=&format=webp&quality=lossless&width=498&height=443', '1126 Merrifield St SE, Grand Rapids, MI 49507', 4, 1, 1895, 2.7, 0.2, false);
INSERT INTO Property VALUES (11, 6, 'https://media.discordapp.net/attachments/715308386941403141/1318663588994355200/636_Innes.png?ex=676324ab&is=6761d32b&hm=04f167cc30ae5f0324e61ca017acbd87466d09ce7d366c5b16095524e2de0481&=&format=webp&quality=lossless&width=537&height=496', '636 Innes St NE, Grand Rapids, MI 49503', 2, 1, 1000, 4.2, 0.4, true);
INSERT INTO Property VALUES (12, 7, 'https://media.discordapp.net/attachments/715308386941403141/1318663589283758250/471_Emerald.png?ex=676324ab&is=6761d32b&hm=d3594d38c7e3fe13233f6f7594c9565da03c8c1b6c7bb49240f9db64dccd3f7d&=&format=webp&quality=lossless&width=410&height=369', '471 Emerald Ave NE, Grand Rapids, MI 49503', 4, 1, 1900, 4.2, 0.2, false);
INSERT INTO Property VALUES (13, 8, 'https://media.discordapp.net/attachments/715308386941403141/1318663631755415714/1020_Sigsbee.png?ex=676324b5&is=6761d335&hm=ad6a3f39dde4118057b986ca532646a950e5734743468624e5de77c42e26b322&=&format=webp&quality=lossless&width=337&height=334', '1020 Sigsbee St SE, Grand Rapids, MI 49506', 5, 2, 3200, 3.3, 0.1, true);

-- To generate demo reviews to show the system working, we will generate
-- 11 reviews for property 1, 10 for property 2, 9 for property 3, and so on

INSERT INTO Review VALUES (1, 1, 5, 'Great place to live! The landlord is very responsive and the property is well maintained.');
INSERT INTO Review VALUES (1, 2, 4, 'The property is nice, but the landlord is not very responsive.');
INSERT INTO Review VALUES (1, 3, 2, 'the property is not well maintained and the landlord is not responsive.');
INSERT INTO Review VALUES (1, 4, 3, 'The property is nice, but the landlord is not very responsive.');
INSERT INTO Review VALUES (1, 5, 5, 'Great place to live! The landlord is very responsive and the property is well maintained.');
INSERT INTO Review VALUES (1, 6, 1, 'I hate this place!!!');
INSERT INTO Review VALUES (1, 7, 4, 'The property is nice, but the landlord is not very responsive.');
INSERT INTO Review VALUES (1, 8, 3, 'The property is nice, but the landlord is not very responsive.');
INSERT INTO Review VALUES (1, 9, 5, 'Great place to live! The landlord is very responsive and the property is well maintained.');
INSERT INTO Review VALUES (1, 10, 2, 'the property is not well maintained and the landlord is not responsive.');
INSERT INTO Review VALUES (1, 11, 5, 'Great place to live! The landlord is very responsive and the property is well maintained.'); 
INSERT INTO Review VALUES (2, 1, 4, 'Excellent product, will buy again!');
INSERT INTO Review VALUES (2, 2, 3, 'Not bad, but could be improved.');
INSERT INTO Review VALUES (2, 3, 5, 'Would recommend to others.');
INSERT INTO Review VALUES (2, 4, 2, 'Pretty decent, but the quality isn’t top-notch.');
INSERT INTO Review VALUES (2, 5, 5, 'Five stars! Very satisfied with this purchase.');
INSERT INTO Review VALUES (2, 6, 2, 'Not great, had a few issues with it.');
INSERT INTO Review VALUES (2, 7, 4, 'It’s okay, but the price is a bit high.');
INSERT INTO Review VALUES (2, 8, 3, 'Good value for the money.');
INSERT INTO Review VALUES (2, 9, 1, 'The product arrived damaged, not happy with it.');
INSERT INTO Review VALUES (2, 10, 5, 'Amazing! Exceeded my expectations, highly recommend.');
INSERT INTO Review VALUES (3, 1, 4, 'Excellent product, will buy again!');
INSERT INTO Review VALUES (3, 2, 3, 'Not bad, but could be improved.');
INSERT INTO Review VALUES (3, 3, 5, 'Would recommend to others.');
INSERT INTO Review VALUES (3, 4, 2, 'Pretty decent, but the quality isn’t top-notch.');
INSERT INTO Review VALUES (3, 5, 5, 'Five stars! Very satisfied with this purchase.');
INSERT INTO Review VALUES (3, 6, 2, 'Not great, had a few issues with it.');
INSERT INTO Review VALUES (3, 7, 4, 'It’s okay, but the price is a bit high.');
INSERT INTO Review VALUES (3, 8, 3, 'Good value for the money.');
INSERT INTO Review VALUES (3, 9, 1, 'The product arrived damaged, not happy with it.');
INSERT INTO Review VALUES (4, 1, 4, 'Excellent product, will buy again!');
INSERT INTO Review VALUES (4, 2, 3, 'Not bad, but could be improved.');
INSERT INTO Review VALUES (4, 3, 5, 'Would recommend to others.');
INSERT INTO Review VALUES (4, 4, 2, 'Pretty decent, but the quality isn’t top-notch.');
INSERT INTO Review VALUES (4, 5, 5, 'Five stars! Very satisfied with this purchase.');
INSERT INTO Review VALUES (4, 6, 2, 'Not great, had a few issues with it.');
INSERT INTO Review VALUES (4, 7, 4, 'It’s okay, but the price is a bit high.');
INSERT INTO Review VALUES (4, 8, 3, 'Good value for the money.');
INSERT INTO Review VALUES (5, 1, 4, 'Excellent product, will buy again!');
INSERT INTO Review VALUES (5, 2, 3, 'Not bad, but could be improved.');
INSERT INTO Review VALUES (5, 3, 5, 'Would recommend to others.');
INSERT INTO Review VALUES (5, 4, 2, 'Pretty decent, but the quality isn’t top-notch.');
INSERT INTO Review VALUES (5, 5, 5, 'Five stars! Very satisfied with this purchase.');
INSERT INTO Review VALUES (5, 6, 2, 'Not great, had a few issues with it.');
INSERT INTO Review VALUES (5, 7, 4, 'It’s okay, but the price is a bit high.');
INSERT INTO Review VALUES (6, 1, 4, 'Excellent product, will buy again!');
INSERT INTO Review VALUES (6, 2, 3, 'Not bad, but could be improved.');
INSERT INTO Review VALUES (6, 3, 5, 'Would recommend to others.');
INSERT INTO Review VALUES (6, 4, 2, 'Pretty decent, but the quality isn’t top-notch.');
INSERT INTO Review VALUES (6, 5, 5, 'Five stars! Very satisfied with this purchase.');
INSERT INTO Review VALUES (6, 6, 2, 'Not great, had a few issues with it.');
INSERT INTO Review VALUES (7, 1, 4, 'Excellent product, will buy again!');
INSERT INTO Review VALUES (7, 2, 3, 'Not bad, but could be improved.');
INSERT INTO Review VALUES (7, 3, 5, 'Would recommend to others.');
INSERT INTO Review VALUES (7, 4, 2, 'Pretty decent, but the quality isn’t top-notch.');
INSERT INTO Review VALUES (7, 5, 5, 'Five stars! Very satisfied with this purchase.');
INSERT INTO Review VALUES (8, 1, 4, 'Excellent product, will buy again!');
INSERT INTO Review VALUES (8, 2, 3, 'Not bad, but could be improved.');
INSERT INTO Review VALUES (8, 3, 5, 'Would recommend to others.');
INSERT INTO Review VALUES (8, 4, 2, 'Pretty decent, but the quality isn’t top-notch.');
INSERT INTO Review VALUES (9, 1, 4, 'Excellent product, will buy again!');
INSERT INTO Review VALUES (9, 2, 3, 'Not bad, but could be improved.');
INSERT INTO Review VALUES (9, 3, 5, 'Would recommend to others.');
INSERT INTO Review VALUES (10, 1, 2, 'Pretty decent, but the quality isn’t top-notch.');
INSERT INTO Review VALUES (10, 2, 4, 'Good value for the money!');
INSERT INTO Review VALUES (11, 1, 5, 'Five stars! Very satisfied with this purchase.');