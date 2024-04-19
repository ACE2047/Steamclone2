-- create database GameManagement
use GameManagement;

CREATE TABLE Publisher (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL,
    UNIQUE (PublisherName)
);

CREATE TABLE Game (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    PublisherID INT NOT NULL,
    Genre VARCHAR(100),
    AgeRating VARCHAR(10),
    UNIQUE (Title),
    FOREIGN KEY (PublisherID)
        REFERENCES Publisher (PublisherID)
);

CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    UserName VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Age INT,
    UNIQUE (Email),
    UNIQUE (UserName)
);

CREATE TABLE AddWishlist (
    WishlistID INT AUTO_INCREMENT PRIMARY KEY,
    GameID INT NOT NULL,
    UserID INT NOT NULL,
    DateAdded DATE NOT NULL,
    FOREIGN KEY (GameID)
        REFERENCES Game (GameID),
    FOREIGN KEY (UserID)
        REFERENCES User (UserID)
);

-- ===== May not need this table ======
-- CREATE TABLE UserWishlist (
--     LibraryID INT AUTO_INCREMENT PRIMARY KEY,
--     UserID INT NOT NULL,
--     GameID INT NOT NULL,
--     DateAdded DATE NOT NULL,
--     FOREIGN KEY (UserID)
--         REFERENCES Customer (UserID),
--     FOREIGN KEY (GameID)
--         REFERENCES Game (GameID)
-- );

-- Insert Publisher values
INSERT INTO Publisher (PublisherName) VALUES
('Valve'),
('Krafton'),
('Playstation'),
('NetEase Games Global'),
('Electronic Arts'),
('ConcernedApe'),
('Ubisoft'),
('Activision'),
('Dani'),
('Bungie'),
('Rockstar Games'),
('Larian Studios'),
('Amazon Games'),
('Facepunch Studios'),
('Smartly Dressed Games'),
('Digital Extremes'),
('Bethesda Softworks'),
('Pocketpair'),
('Ludeon Studios'),
('FromSoftware Inc.'),
('Gaijin Entertainment'),
('Grinding Gear Games'),
('2K Games'),
('Playtika Ltd.'),
('CAPCOM'),
('VRChat Inc.'),
('Zeekerss'),
('SEGA'),
('Re-Logic'),
('Behaviour Interactive Inc.'),
('Imperium Interactive Entertainment'),
('Blizzard Entertainment'),
('Square Enix'),
('Paradox Interactive'),
('Bohemia Interactive'),
('Klei Entertainment'),
('CD PROJEKT RED'),
('Mega Crit'),
('Wemade'),
('Konami'),
('Studio Wildcard'),
('Playstack'),
('The Indie Stone'),
('Orienjoy'),
('The Fun Pimps Entertainment LLC'),
('Landfall Publishing'),
('Pearl Abyss'),
('Psyonix LLC'),
('Embark Studios'),
('CenterPoint Gaming'),
('Xbox Game Studios'),
('Nicalis, Inc.'),
('FishSoft LLC'),
('Starbreeze Publishing'),
('TaleWorlds Entertainment'),
('Telltale Games'),
('Com2uS'),
('Jagex Ltd'),
('Hi-Rez Studios'),
('Nokta Games'),
('Miju Games'),
('Eleventh Hour Games'),
('SCS Software'),
('LB Game'),
('Catfood Studio'),
('Ninja Kiwi'),
('RobTop Games'),
('Playsaurus'),
('Giants Software'),
('Leppsoft'),
('Games Operators'),
('Wube Software LTD'),
('Coffee Stain Publishing'),
('Bandai Namco Entertainment'),
('Lavaflame2'),
('ProjectMoon'),
('Crytek'),
('Kinetic Games'),
('Gearbox Publishing'),
('Keen Games GmbH'),
('Offworld'),
('Funcom'),
('Warner Bros. Games'),
('Hello Games'),
('Sandbox Interactive GmbH'),
('Newnight');

-- Insert Game values
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Counter-Strike 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Valve'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Dota 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Valve'),
        'MOBA', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('PUBG: BATTLEGROUNDS', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Krafton'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('NARAKA: BLADEPOINT', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'NetEase Games Global'),
        'Action', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('HELLDIVERS 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'PlayStation'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Stardew Valley', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'ConcernedApe'),
        'RPG', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Apex Legends', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Electronic Arts'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Rainbow Six Siege', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Ubisoft'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Call of Duty', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Activision'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Team Fortress 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Valve'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Crab Game', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Dani'),
        'Action', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Destiny 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bungie'),
        'Shooter', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Grand Theft Auto 5', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Rockstar Games'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Baldur's Gate 3", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Larian Studios'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Lost Ark', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Amazon Games'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Rust', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Facepunch Studios'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Unturned', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Smartly Dressed Games'),
        'Survival', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Warframe', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Digital Extremes'),
        'Action', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Fallout 4', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bethesda Softworks'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Palworld', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Pocketpair'),
        'Survival', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('RimWorld', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Ludeon Studios'),
        'Strategy', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('ELDEN RING', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'FromSoftware Inc.'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('War Thunder', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Gaijin Entertainment'),
        'Shooter', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Path of Exile', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Grinding Gear Games'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Sid Meier's Civilization VI", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = '2K Games'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Governor of Poker 3', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Playtika Ltd.'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Monster Hunter: World', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'CAPCOM'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('VRChat', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'VRChat Inc.'),
        'Casual', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Lethal Company', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Zeekerss'),
        'Horror', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Football Manager 2024', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'SEGA'),
        'Sports', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Terraria', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Re-Logic'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('EA SPORTS FC 24', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Electronic Arts'),
        'Sports', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Dead by Daylight', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Behaviour Interactive Inc.'),
        'Horror', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("The Sims 4", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Electronic Arts'),
        'Casual', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Myth of Empires', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Imperium Interactive Entertainment'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Overwatch 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Blizzard Entertainment'),
        'Shooter', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Red Dead Redemption 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Rockstar Games'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Fallout 76', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bethesda Softworks'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Final Fantasy XIV Online', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Square Enix'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Hearts of Iron IV', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Paradox Interactive'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('DayZ', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bohemia Interactive'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Don't Starve Together", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Klei Entertainment'),
        'Survival', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Cyberpunk 2077", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'CD PROJEKT RED'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Slay the Spire', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Mega Crit'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('MIR4', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Wemade'),
        'RPG', 'T');
        ------------
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Yu-Gi-Oh! Master Duel', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Konami'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('ARK: Survival Ascended', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Studio Wildcard'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Balatro', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Playstack'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Project Zomboid', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'The Indie Stone'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Left 4 Dead 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Valve'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Hero's Land", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Orienjoy'),
        'Survival', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('7 Days to Die', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'The Fun Pimps Entertainment LLC'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("ARK: Survival Evolved", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Studio Wildcard'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Content Warning', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Landfall Publishing'),
        'Horror', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Black Desert', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Pearl Abyss'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Rocket League', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Psyonix LLC'),
        'Sports', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('The Elder Scrolls Online', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bethesda Softworks'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('The Elder Scrolls V: Skyrim Special Edition', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bethesda Softworks'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Total War: WARHAMMER III', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'SEGA'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Fallout: New Vegas', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bethesda Softworks'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('THE FINALS', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Embark Studios'),
        'Shooter', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Crosshair X', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'CenterPoint Gaming'),
        'Shooter', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Age of Empires II: Definitive Edition', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Xbox Game Studios'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("The Binding of Isaac: Rebirth", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Nicalis, Inc.'),
        'Action', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Russian Fishing 4', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'FishSoft LLC'),
        'Sports', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('PAYDAY 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Starbreeze Publishing'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Mount & Blade II: Bannerlord', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'TaleWorlds Entertainment'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Spacewar', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Telltale Games'),
        'Casual', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('NBA 2K24', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = '2K Games'),
        'Sports', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Summoners War', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Com2uS'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Garry's Mod", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Valve'),
        'Shooter', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Sid Meier's Civilization V", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = '2K Games'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("SCUM", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Jagex Ltd'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Supermarket Simulator', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Nokta Games'),
        'Strategy', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('The Planet Crafter', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Miju Games'),
        'Survival', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Last Epoch', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Eleventh Hour Games'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Euro Truck Simulator 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'SCS Software'),
        'Casual', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('VPet', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'LB Game'),
        'Casual', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Mahjong Soul', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Catfood Studio'),
        'Horror', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Bloons TD 6", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Ninja Kiwi'),
        'Strategy', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Geometry Dash", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'RobTop Games'),
        'Casual', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Stellaris', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Paradox Interactive'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Crusader Kings III', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Paradox Interactive'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Cookie Clicker', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Playsaurus'),
        'Casual', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Battlefield V', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Electronic Arts'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Farming Simulator 22', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Giants Software'),
        'Casual', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Soundpad', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Leppsoft'),
        'Casual', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Infection Free Zone", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Games Operators'),
        'Strategy', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Factorio", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Wube Software LTD'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Brawlhalla', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Ubisoft'),
        'Action', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Valheim', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Coffee Stain Publishing'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('TEKKEN 8', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bandai Namco Entertainment'),
        'Action', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Europa Universalis IV', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Paradox Interactive'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Legends of Idleon MMO', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Lavaflame2'),
        'RPG', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Limbus Company', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'ProjectMoon'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Phasmophobia", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Kinetic Games'),
        'Horror', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Hunt: Showdown", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Crytek'),
        'Strategy', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Risk of Rain 2', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Gearbox Publishing'),
        'Action', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Horizon Forbidden West', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Playstation'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Arma 3', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bohemia Interactive'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Enshrouded', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Keen Games GmbH'),
        'Survival', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Satisfactory', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Coffee Stain Publishing'),
        'Survival', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Squad', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Offworld'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('New World', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Amazon Games'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Conan Exiles', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Funcom'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Deep Rock Galatic', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Coffee Stain Publishing'),
        'Shooter', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("No Man's Sky", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Hello Games'),
        'Survival', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Hogwarts Legacy', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Warner Bros. Games'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Street Fighter 6', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'CAPCOM'),
        'Action', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Albion Online', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Sandbox Interactive GmbH'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('The Witcher 3: Wild Hunt', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'CD PROJEKT RED'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Cities: Skylines", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Paradox Interactive'),
        'Strategy', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Age of Empires IV: Anniversary Edition', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Xbox Game Studios'),
        'Strategy', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Battlefield 2042', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Electronic Arts'),
        'Shooter', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Sons Of The Forest', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Newnight'),
        'Survival', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Fallout 3 - Game of the Year Edition", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Bethesda Softworks'),
        'RPG', 'M');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Forza Horizon 5', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Xbox Game Studios'),
        'Sports', 'E');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ('Sea of Thieves', 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Xbox Game Studios'),
        'RPG', 'T');
        
INSERT INTO Game (Title, PublisherID, Genre, AgeRating)
VALUES ("Halo Infinite", 
        (SELECT PublisherID FROM Publisher WHERE PublisherName = 'Xbox Game Studios'),
        'Shooter', 'T');
        
Insert User values
INSERT INTO User (FirstName, LastName, Email, Username, Password, Age) VALUES
('John', 'Doe', 'johndoe@example.com', 'johndoe', 'password123', 23),
('Jane', 'Smith', 'janesmith@example.com', 'janesmith', 'securepass456', 12),
('Alice', 'Johnson', 'alicejohnson@example.com', 'alicejohnson', 'mypassword789', 18),
('Bob', 'Brown', 'bobbrown@example.com', 'bobbrown', 'bobpassword234', 25),
('Nancy', 'Davis', 'nancydavis@example.com', 'nancydavis', 'davispass567', 19),
('Gary', 'White', 'garywhite@example.com', 'garywhite', 'white123password', 15),
('Lisa', 'Walker', 'lisawalker@example.com', 'lisawalker', 'walkerpassword891', 22), 
('David', 'Hall', 'davidhall@example.com', 'davidhall', 'hallpass345', 20),
('Karen', 'Green', 'karengreen@example.com', 'karengreen', 'greenpass234', 16),
('James', 'Adams', 'jamesadams@example.com', 'jamesadams', 'adams123456', 24),
('Maria', 'Campbell', 'mariacampbell@example.com', 'mariacampbell', 'campbellpass789', 13),
('Michael', 'Allen', 'michaelallen@example.com', 'michaelallen', 'allenpassword891', 25),
('Jessica', 'Wright', 'jessicawright@example.com', 'jessicawright', 'wrightpass654', 21),
('Frank', 'Scott', 'frankscott@example.com', 'frankscott', 'scottpass321', 17),
('Angela', 'Baker', 'angelabaker@example.com', 'angelabaker', 'bakerpass432', 23),
('Edward', 'Nelson', 'edwardnelson@example.com', 'edwardnelson', 'nelson123pass', 14),
('Sara', 'Carter', 'saracarter@example.com', 'saracarter', 'carterpass789', 25),
('Andrew', 'Evans', 'andrewevans@example.com', 'andrewevans', 'evanspassword987', 20),
('Sharon', 'Collins', 'sharoncollins@example.com', 'sharoncollins', 'collinspass321', 24),
('Steven', 'Stewart', 'stevenstewart@example.com', 'stevenstewart', 'stewartpass123', 19),
('Laura', 'Sanchez', 'laurasanchez@example.com', 'laurasanchez', 'sanchezpass456', 15),
('Brad', 'Young', 'bradyoung@example.com', 'bradyoung', 'young123password', 22),
('Melissa', 'King', 'melissaking@example.com', 'melissaking', 'kingpass789', 18),
('Benjamin', 'Lee', 'benjaminlee@example.com', 'benjaminlee', 'leepassword891', 16),
('Amanda', 'Turner', 'amandaturner@example.com', 'amandaturner', 'turnerpass345', 13),
 ('Jeffrey', 'Parker', 'jeffreyparker@example.com', 'jeffreyparker', 'parkerpassword234', 21),
('Rebecca', 'Lewis', 'rebeccalewis@example.com', 'rebeccalewis', 'lewisspass567', 14),
('Eric', 'Harris', 'ericharris@example.com', 'ericharris', 'harrispass678', 17),
('Kimberly', 'Clark', 'kimberlyclark@example.com', 'kimberlyclark', 'clarkpassword789', 23),
('Samuel', 'Robinson', 'samuelrobinson@example.com', 'samuelrobinson', 'robinsonpass891', 20),
('Deborah', 'Perez', 'deborahperez@example.com', 'deborahperez', 'perezpass345', 25),
('Joseph', 'Moore', 'josephmoore@example.com', 'josephmoore', 'moorepass234', 15),
('Katherine', 'Thompson', 'katherinethompson@example.com', 'katherinethompson', 'thompsonpass123', 19),
('Brian', 'Anderson', 'briananderson@example.com', 'briananderson', 'andersonpass456', 12),
('Ann', 'Wilson', 'annwilson@example.com', 'annwilson', 'wilsonpass789', 22),
('Charles', 'Taylor', 'charlestaylor@example.com', 'charlestaylor', 'taylorpassword891', 24),
('Susan', 'Martin', 'susanmartin@example.com', 'susanmartin', 'martinpass654', 21),
('Paul', 'Thomas', 'paulthomas@example.com', 'paulthomas', 'thomaspass321', 14),
('Dorothy', 'Jackson', 'dorothyjackson@example.com', 'dorothyjackson', 'jacksonpass432', 18),
('Mark', 'Roberts', 'markroberts@example.com', 'markroberts', 'robertspassword123', 20),
('Linda', 'Gonzalez', 'lindagonzalez@example.com', 'lindagonzalez', 'gonzalezpass456', 17),
('Steven', 'James', 'stevenjames@example.com', 'stevenjames', 'jamespassword789', 23),
('Elizabeth', 'Hill', 'elizabethhill@example.com', 'elizabethhill', 'hillpass891', 16),
('Matthew', 'Lopez', 'matthewlopez@example.com', 'matthewlopez', 'lopezpassword345', 24),
('Donna', 'Clark', 'donnaclark@example.com', 'donnaclark', 'clarkpass234', 13),
('Anthony', 'Johnson', 'anthonyjohnson@example.com', 'anthonyjohnson', 'johnsonpass567', 22);

drop table if exists UserWishlist;
select * from AddWishlist;
select * from User;
select * from Publisher;
select * from Game;

SELECT g.Title, aw.DateAdded
FROM Game g
JOIN AddWishlist aw ON g.GameID = aw.GameID
WHERE aw.UserID = 53;