CREATE DATABASE Film
USE Film

CREATE TABLE Movies
(
 ID INT PRIMARY KEY IDENTITY(1,1),
 Title NVARCHAR(150) NOT NULL,
 ReleaseYear INT NOT NULL,
 Rating DECIMAL NOT NULL,
 Duration INT NOT NULL,
 [Status] NVARCHAR(50)
)

CREATE TABLE MovieDetails
(
	MovieID INT FOREIGN KEY  (MovieID)
	REFERENCES Movies(ID) PRIMARY KEY,
	Budget DECIMAL,
	Country NVARCHAR(100),
	[Language] NVARCHAR(50),
	[Description] NVARCHAR(MAX)
)

CREATE TABLE Genres
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	GenreName NVARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE MovieGenres
(
	MovieID INT FOREIGN KEY (MOVIEID)
	REFERENCES Movies(ID),

	GenreID INT FOREIGN KEY (GENREID)
	REFERENCES Genres(ID)

	PRIMARY KEY(MOVIEID,GENREID)
)

CREATE TABLE Actors
(
 ID INT PRIMARY KEY IDENTITY(1,1),
 FistName NVARCHAR(50) NOT NULL,
 LastName NVARCHAR(50) NOT NULL,
 BirthDate DATETIME NOT NULL,
)

CREATE TABLE MovieActors
(
	MovieID INT FOREIGN KEY (MOVIEID)
	REFERENCES Movies(ID),

	ActorID INT FOREIGN KEY (ActorID)
	REFERENCES Actors(ID),

	PRIMARY KEY (MovieID,ActorID)
)

CREATE TABLE Halls
(
 ID int PRIMARY KEY IDENTITY(1,1),
 HallName NVARCHAR(50) NOT NULL,
 CAPACITY INT NOT NULL
)

CREATE TABLE [Sessions]
(
	ID INT PRIMARY KEY IDENTITY(1,1),

	MovieID INT FOREIGN KEY (MOVIEID)
	REFERENCES Movies(ID),

	HallId INT FOREIGN KEY (Hallid)
	REFERENCES Halls(ID),

	StartTime DATETIME NOT NULL,

	[Status] NVARCHAR(50),
)

CREATE TABLE Customers
(
 ID INT PRIMARY KEY IDENTITY,
 FirstName NVARCHAR(50) NOT NULL,
 LastName NVARCHAR(50) NOT NULL,
 Email NVARCHAR(100),
 Phone NVARCHAR(20),
 City NVARCHAR(50),
)

CREATE TABLE CustomerCards
(
	CustomerID INT FOREIGN KEY (CustomerID)
	REFERENCES Customers(ID) PRIMARY KEY,
	CardNumber NVARCHAR(20) UNIQUE NOT NULL,
	BonusPoints INT,
	[Status] NVARCHAR(20)
)

CREATE TABLE Tickets
(
	ID INT PRIMARY KEY IDENTITY(1,1),

	SessionID INT FOREIGN KEY (SessionID)
	REFERENCES [Sessions](ID),

	CustomerID INT FOREIGN KEY (CustomerID)
	REFERENCES Customers(ID),

	SeatNumber NVARCHAR(10) NOT NULL,

	PRICE DECIMAL,
	
	PURCHASEDATE DATETIME DEFAULT GETDATE(),
)

INSERT INTO Genres (GenreName) VALUES (N'Action'), (N'Drama'), (N'Comedy'), (N'Sci-Fi'), (N'Thriller'), (N'Horror'), (N'Adventure'), (N'Animation'), (N'Crime'), (N'Biography');

INSERT INTO Halls (HallName, Capacity) VALUES (N'Hall 1 - IMAX', 200), (N'Hall 2 - Standard', 100), (N'Hall 3 - Standard', 100), (N'Hall 4 - Dolby Atmos', 150), (N'VIP Hall', 35);

INSERT INTO Actors(FistName, LastName, BirthDate) VALUES (N'Leonardo', N'DiCaprio', '1974-11-11'), (N'Brad', N'Pitt', '1963-12-18'), (N'Cillian', N'Murphy', '1976-05-25'), (N'Matthew', N'McConaughey', '1969-11-04'), (N'Morgan', N'Freeman', '1937-06-01'), (N'Christian', N'Bale', '1974-01-30'), (N'Tom', N'Hardy', '1977-09-15'), (N'Anne', N'Hathaway', '1982-11-12'), (N'Scarlett', N'Johansson', '1984-11-22'), (N'Robert', N'Downey Jr.', '1965-04-04');

INSERT INTO Movies (Title, ReleaseYear, Rating, Duration, [Status]) VALUES (N'Inception', 2010, 8.8, 148, N'Active'), (N'Interstellar', 2014, 8.7, 169, N'Active'), (N'Oppenheimer', 2023, 8.9, 180, N'Active'), (N'The Shawshank Redemption', 1994, 9.3, 142, N'Archived'), (N'Fight Club', 1999, 8.8, 139, N'Archived'), (N'The Dark Knight', 2008, 9.0, 152, N'Active'), (N'Dunkirk', 2017, 7.8, 106, N'Active'), (N'The Wolf of Wall Street', 2013, 8.2, 180, N'Archived'), (N'The Prestige', 2006, 8.5, 130, N'Active'), (N'Avengers: Endgame', 2019, 8.4, 181, N'Active');

INSERT INTO MovieDetails(MovieID, Budget, Country, [Language], [Description]) VALUES (1, 160000000.00, N'USA', N'English', N'A thief who steals corporate secrets through the use of dream-sharing technology.'), (2, 165000000.00, N'USA', N'English', N'A team of explorers travel through a wormhole in space in an attempt to ensure humanity survival.'), (3, 100000000.00, N'USA', N'English', N'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.'), (4, 25000000.00, N'USA', N'English', N'Over the course of several years, two convicts form a friendship, seeking solace and eventual redemption.'), (5, 63000000.00, N'USA', N'English', N'An insomniac office worker and a devil-may-care soap maker form an underground fight club.'), (6, 185000000.00, N'USA', N'English', N'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological tests.'), (7, 100000000.00, N'UK', N'English', N'Allied soldiers from Belgium, the British Empire, and France are surrounded by the German Army during World War II.'), (8, 100000000.00, N'USA', N'English', N'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker to his fall involving crime.'), (9, 40000000.00, N'USA', N'English', N'After a tragic accident, two stage magicians in 1890s London engage in a battle to create the ultimate illusion.'), (10, 356000000.00, N'USA', N'English', N'After the devastating events of Infinity War, the Avengers assemble once more to reverse Thanos actions.');

INSERT INTO MovieGenres(MovieID, GenreID) VALUES (1, 1), (1, 4), (1, 5), (2, 4), (2, 2), (2, 7), (3, 2), (3, 10), (4, 2), (4, 9), (5, 2), (5, 5), (6, 1), (6, 2), (6, 9), (7, 1), (7, 2), (8, 2), (8, 3), (8, 9), (9, 2), (9, 5), (10, 1), (10, 4), (10, 7);

INSERT INTO MovieActors(MovieID, ActorID) VALUES (1, 1), (1, 7), (2, 4), (2, 8), (3, 3), (3, 10), (4, 5), (5, 2), (6, 6), (6, 3), (7, 7), (7, 3), (8, 1), (9, 6), (9, 8), (10, 10), (10, 9);

INSERT INTO [Sessions](MovieID, HallID, StartTime, Status) VALUES (1, 1, '2026-09-05 15:00:00', N'Active'), (1, 2, '2026-09-05 18:00:00', N'Active'), (2, 1, '2026-09-05 20:00:00', N'Active'), (3, 5, '2026-09-06 14:00:00', N'Active'), (4, 2, '2026-09-06 17:00:00', N'Cancelled'), (6, 1, '2026-09-06 21:00:00', N'Active'), (6, 4, '2026-09-07 16:30:00', N'Active'), (8, 3, '2026-09-07 19:00:00', N'Active'), (10, 4, '2026-09-08 18:00:00', N'Active'), (9, 2, '2026-09-08 21:30:00', N'Active');

INSERT INTO Customers (FirstName, LastName, Email, Phone, City) VALUES (N'John', N'Doe', N'john.doe@gmail.com', N'+15550123', N'New York'), (N'Jane', N'Smith', N'jane.smith@gmail.com', N'+15550987', N'New York'), (N'Robert', N'Johnson', N'robert.j@mail.com', N'+15550333', N'Los Angeles'), (N'Alex', N'Brown', NULL, N'+15550444', N'Chicago'), (N'Emily', N'Davis', N'emily.davis@yahoo.com', N'+15550777', N'New York'), (N'Michael', N'Wilson', N'm.wilson@gmail.com', N'+15550999', N'Houston'), (N'David', N'Taylor', NULL, NULL, N'Los Angeles'), (N'Sarah', N'Anderson', N'sarah.a@gmail.com', N'+15550111', N'Chicago');

INSERT INTO CustomerCards (CustomerID, CardNumber, BonusPoints, Status) VALUES (1, N'CARD1001', 120, N'Active'), (2, N'CARD1002', 45, N'Active'), (3, N'CARD1003', 0, N'Inactive'), (5, N'CARD1004', 210, N'Active'), (6, N'CARD1005', 85, N'Active');

INSERT INTO Tickets (SessionID, CustomerID, SeatNumber, Price, PurchaseDate) VALUES (1, 1, N'A1', 12.00, '2026-09-01 10:30:00'), (1, 1, N'A2', 12.00, '2026-09-01 10:30:00'), (2, 2, N'B5', 15.00, '2026-09-02 14:15:00'), (3, 3, N'VIP1', 25.00, '2026-09-03 16:45:00'), (1, 4, N'C10', NULL, '2026-09-04 09:00:00'), (6, 5, N'A10', 18.00, '2026-09-04 11:20:00'), (6, 6, N'A11', 18.00, '2026-09-04 12:00:00'), (7, 1, N'D4', 14.00, '2026-09-04 15:30:00'), (9, 2, N'F12', 16.00, '2026-09-04 18:00:00'), (10, 8, N'B2', 10.00, '2026-09-04 19:10:00');

--Filmlər cədvəlindən buraxılış ili 2020-ci ildən sonra olan filmlərin adını və xalını (Rating) çıxarın./

SELECT Title, Rating, ReleaseYear FROM Movies WHERE ReleaseYear > 2020;

--Müştərilər cədvəlində adında "ə" hərfi olan müştərilərin siyahısını soyadına görə əlifba sırası ilə sıralayın.

SELECT FirstName,LastName  From Customers  WHERE FirstName LIKE '%a%' ORDER BY LastName;

--Reytinqi (Rating) 8.0 ilə 9.5 arasında olan filmlərin adını və reytinqini göstərin.
SELECT Title,Rating FROM Movies WHERE Rating BETWEEN 8 AND 9.5;

--Nümayiş müddəti (Duration) 120 dəqiqədən çox olan ilk 5 filmi reytinqə görə azalan sırada çıxarın (TOP işlədin).
SELECT TOP 5 Title, Duration,Rating  Movies FROM Movies WHERE Duration > 120;

--Biletlər cədvəlində qiyməti NULL olan (pulsuz verilmə ehtimalı olan) biletlərin siyahısını çıxarın.
SELECT * FROM Tickets WHERE Price = 0;

--Müştərilər cədvəlində elektron poçtu gmail.com ilə bitən müştəriləri tapın.
SELECT * FROM Customers WHERE Email LIKE '%gmail.com';

--Seanslar cədvəlindən bu günə (cari tarixə) olan seansların siyahısını seans vaxtına görə nizamlansın.
SELECT * FROM Sessions WHERE StartTime = CAST(GETDATE() AS DATE)

--Filmlərin siyahısını buraxılış ilinə görə azalan, eyni ildə olanları isə reytinqə görə artan sırada göstərin.
SELECT * FROM Movies ORDER BY ReleaseYear,Rating DESC

--Qiyməti 10, 12 və ya 15 AZN olan biletlərin unikal (DISTINCT) qiymət siyahısını çıxarın.
SELECT * FROM Tickets WHERE Price BETWEEN 10 and 15

--Aktyorlar cədvəlində doğum tarixi 1980-ci ildən əvvəl olan aktyorların ad və soyadını gətirin.
SELECT FistName,LastName,BirthDate FROM Actors WHERE '1980' > BirthDate

--Xalı (Rating) 5.0-dən aşağı olan filmlərin statusunu UPDATE edərək "Arxiv" edin.
SELECT * FROM Movies WHERE 5 > Rating
UPDATE Movies SET Status = 'Archived' WHERE 5 > Rating

--Telefon nömrəsi NOT NULL şərtini ödəməyən (yəni nömrəsi olmayan) müştərilərin siyahısını göstərin.
SELECT * FROM Customers Where Phone is NULL

--Qiyməti 5 AZN-dən az olan biletlərin qiymətini 1 AZN artırın.
SELECT * FROM Tickets WHERE 5 > Price
UPDATE Tickets SET Price += 1 WHERE 5 > Price

--Ləğv olunmuş seanslara (Status = 'Cancelled') satılmış biletləri Biletlər cədvəlindən silin (DELETE).
DELETE FROM [Sessions] Where [Status] = 'Cancelled'

--MüştəriKartları cədvəlində balı 0 olan kartların statusunu "Deaktiv" olaraq yeniləyin.
SELECT * FROM CustomerCards 
UPDATE CustomerCards SET Status = 'Deactive' Where BonusPoints = 0

--Kinoteatrda olan bütün filmlərin ortalama reytinq xalını (AVG) hesablayın.
SELECT AVG(Rating) AS Rating FROM Movies

--Bazada ümumi neçə müştərinin qeydiyyatdan keçdiyini (COUNT) tapın.
SELECT COUNT(id) AS Total FROM Customers

--Satılmış bütün biletlərdən əldə olunan ümumi gəliri (SUM) hesablayın.
SELECT SUM(PRICE) AS Total FROM Tickets

--Sistemdəki en baha biletin qiymətini (MAX) tapın.
SELECT MAX(PRICE) AS Expensive FROM Tickets

--Ən qısa filmin neçə dəqiqə olduğunu (MIN) tapın.
SELECT MIN(Duration) AS MinDur FROM Movies

--Elektron poçtu qeyd olunmuş (yəni NULL olmayan) müştərilərin sayını çıxarın.
SELECT * FROM Customers WHERE Email is NOT NULL

--Biletlər cədvəlində orta bilet qiyməti ilə ən baha bilet qiyməti arasındakı fərqi hesablayın.
SELECT MAX(PRICE) - AVG(PRICE) AS Ferq FROM Tickets

--Filmlər və FilmTəfərrüatları cədvəlini birləşdirərək filmin adı ilə onun çəkiliş büdcəsini göstərin.
SELECT Movies.Title, MovieDetails.Budget
FROM Movies
INNER JOIN MovieDetails 
ON Movies.ID = MovieDetails.MovieID;

--Müştərilər və MüştəriKartları cədvəllərini INNER JOIN edərək müştərinin adı, soyadı və kartındakı bonus balını çıxarın.
SELECT Customers.FirstName , Customers.LastName, CustomerCards.BonusPoints
FROM Customers
INNER JOIN CustomerCards
ON Customers.ID = CustomerCards.CustomerID

--Hələ heç bir bonus kartı olmayan müştəriləri tapmaq üçün Müştərilər cədvəlini MüştəriKartları ilə LEFT JOIN edin və kart hissəsi NULL olanları süzgəcləyin.
SELECT Customers.FirstName
FROM Customers
LEFT JOIN CustomerCards
ON Customers.ID = CustomerCards.CustomerID
WHERE CustomerCards.CustomerID IS NULL;

--Büdcəsi 50 milyon dollardan çox olan filmlərin adını və istehsalçı ölkəsini (FilmTəfərrüatları cədvəlindən) göstərin.
SELECT Movies.Title, MovieDetails.Country
FROM Movies
LEFT JOIN MovieDetails
ON Movies.ID = MovieDetails.MovieID

--Bonus kartında 100-dən çox balı olan müştərilərin adını, soyadını və kart nömrəsini siyahılayın.
SELECT Customers.FirstName , Customers.LastName,CustomerCards.BonusPoints
FROM Customers
LEFT JOIN CustomerCards
ON CustomerCards.CustomerID = Customers.ID
WHERE BonusPoints > 100

--Filmlər və Seanslar cədvəllərini birləşdirərək hər seansın hansı filmə aid olduğunu və seans vaxtını göstərin.
SELECT Movies.Title,Sessions.HallId,Sessions.StartTime
FROM Movies
RIGHT JOIN Sessions
ON Sessions.MovieID = Movies.ID

--Zallar və Seanslar cədvəllərini INNER JOIN edərək "Zal 1"-də keçiriləcək seansların siyahısını çıxarın.
SELECT Halls.HallName, Sessions.StartTime, Sessions.Status
FROM Halls
INNER JOIN Sessions
ON Sessions.HallId = Halls.ID
WHERE Halls.HallName Like 'Hall 1%'

--Biletlər və Müştərilər cədvəllərini birləşdirərək "John" adlı müştərinin aldığı biletlərin siyahısını göstərin.
SELECT Customers.FirstName,Tickets.PRICE, Tickets.PURCHASEDATE
FROM Tickets
RIGHT JOIN Customers
ON Customers.ID = Tickets.CustomerID
WHERE Customers.FirstName = 'John'

--Bütün filmləri və varsa onların seanslarını göstərin. Seansı olmayan filmlər də siyahıda çıxsın (LEFT JOIN).
SELECT Movies.Title, Sessions.HallId, Sessions.StartTime
FROM Movies
LEFT JOIN Sessions
ON Sessions.ID = Movies.ID

--Seanslar və Biletlər cədvəlini birləşdirərək saat 18:00-da başlayan seanslara satılan biletləri tapın.
SELECT Tickets.PRICE , Tickets.PURCHASEDATE
FROM Tickets
RIGHT JOIN Sessions
ON Sessions.ID = Tickets.SessionID
WHERE Sessions.StartTime = '18:00:00';

--Hələ heç bir bilet almamış müştərilərin siyahısını tapın (LEFT JOIN və WHERE BiletID IS NULL).
SELECT Customers.FirstName
FROM Customers
LEFT JOIN Tickets
ON Tickets.CustomerID = Customers.ID
WHERE Tickets.ID IS NULL

--Hələ heç bir seansı təyin olunmamış filmlərin siyahısını çıxarın.
SELECT Movies.Title , Movies.ID
FROM MOVIES
LEFT JOIN Sessions
ON Sessions.MovieID = Movies.id
WHERE Sessions.MovieID is NULL

--Müştərinin adı, aldığı biletin otacaq yeri (SeatNumber) və seansın başlama vaxtını eyni sorğuda göstərin.
SELECT Customers.FirstName , Tickets.SeatNumber, Sessions.StartTime
FROM Customers
INNER JOIN Tickets
ON Tickets.CustomerID = Customers.ID
INNER JOIN Sessions
ON Sessions.ID = Tickets.SessionID

--Tutumu (Capacity) 100-dən çox olan zallarda təşkil olunan seansların siyahısını çıxarın.
SELECT Halls.HallName ,Sessions.StartTime
FROM Halls
INNER JOIN Sessions
ON Sessions.HallId = Halls.ID
WHERE Halls.CAPACITY > 100

--Filmlər, FilmJanrları və Janrlar cədvəllərini birləşdirərək filmlərin adını və qarşısında janrının adını göstərin.
SELECT Movies.Title, Genres.GenreName
FROM Movies
INNER JOIN MovieGenres 
ON Movies.ID = MovieGenres.MovieID
INNER JOIN Genres 
ON MovieGenres.GenreID = Genres.ID;

--Filmlər, FilmAktyorları və Aktyorlar cədvəllərini birləşdirərək "Inception" filmində çəkilən bütün aktyorların siyahısını çıxarın.

SELECT Movies.Title , Actors.FistName
FROM Movies
LEFT JOIN MovieActors
ON Movies.ID = MovieActors.MovieID
LEFT JOIN Actors
ON Actors.ID = MovieActors.ActorID
WHERE Movies.Title = 'Inception'

--"Komediya" janrında olan bütün filmlərin adlarını və reytinqlərini siyahılayın.
SELECT Movies.Title, Movies.Rating
FROM Movies
LEFT JOIN MovieGenres
ON MovieGenres.MovieID = Movies.ID

LEFT JOIN Genres
ON MovieGenres.GenreID = Genres.ID

WHERE Genres.GenreName = 'Comedy';

--"Bred Pitt" adlı aktyorun çəkildiyi bütün filmlərin adını və buraxılış ilini çıxarın.
SELECT	 Movies.Title , Movies.ReleaseYear, Actors.FistName
FROM Movies
INNER JOIN MovieActors
ON MovieActors.MovieID = Movies.ID
INNER JOIN Actors
ON Actors.ID = MovieActors.ActorID

--Həm "Dram", həm də "Aksiyon" janrında olan filmləri tapmaq üçün uyğun JOIN sorğusu yazın
SELECT Movies.Title, Genres.GenreName
FROM Movies
INNER JOIN MovieGenres ON MovieGenres.MovieID = Movies.ID
INNER JOIN Genres ON MovieGenres.GenreID = Genres.ID
WHERE Genres.GenreName = 'Action' OR Genres.GenreName = 'Drama'

--Hələ heç bir janr mənsubiyyəti təyin olunmamış filmləri çıxarın.
SELECT Movies.Title ,Genres.GenreName FROM Movies
LEFT JOIN MovieGenres ON MovieGenres.MovieID = Movies.ID
LEFT JOIN Genres ON MovieGenres.GenreID = Genres.ID
WHERE MovieGenres.GenreID IS NULL

--Hələ heç bir filmə çəkilməmiş aktyorların siyahısını LEFT JOIN vasitəsilə tapın.
SELECT Actors.FistName , Actors.LastName FROM Actors
LEFT JOIN MovieActors ON Actors.ID = MovieActors.ActorID
WHERE MovieActors.ActorID IS NULL

--"Aksiyon" janrında olan və reytinqi 8.0-dən yüksək olan filmlərin siyahısını çıxarın.
SELECT Movies.Title , Movies.Rating, Genres.GenreName FROM Movies
INNER JOIN MovieGenres ON MovieGenres.MovieID = Movies.ID
INNER JOIN Genres ON MovieGenres.GenreID = Genres.ID
WHERE Genres.GenreName = 'Action' AND Movies.Rating > 8

--Çoxlu JOIN: Müştərinin adı, aldığı biletin qiyməti,
--filmin adı və biletin aid olduğu zalın adını eyni sorğuda göstərin
--(Müştərilər + Biletlər + Seanslar + Filmlər + Zallar).
SELECT Customers.FirstName ,Tickets.SeatNumber ,Tickets.PRICE , Halls.HallName , Movies.Title FROM Customers
LEFT JOIN Tickets ON Tickets.CustomerID = Customers.ID
INNER JOIN [Sessions] ON [Sessions].ID = Tickets.SessionID
LEFT JOIN Movies ON Movies.ID = [Sessions].MovieID
INNER JOIN Halls ON [Sessions].HallId = Halls.ID

--Aksiyon" janrındakı filmlərə satılmış biletlərin ümumi məbləğini (SUM) hesablayın.
SELECT SUM(Tickets.Price) AS TotalAmount FROM Movies
INNER JOIN MovieGenres ON Movies.ID = MovieGenres.MovieID
INNER JOIN Genres ON MovieGenres.GenreID = Genres.ID
INNER JOIN [Sessions] ON Movies.ID = [Sessions].MovieID
INNER JOIN Tickets ON [Sessions].ID = Tickets.SessionID
WHERE Genres.GenreName = 'Action';

--FULL  JOIN istifadə edərək 
--bütün zalları və bütün seansları eşləşdirin (uyğunlaşmayanlar da daxil olmaqla).
SELECT Halls.HallName , Sessions.Status FROM Halls
FULL JOIN [Sessions] ON Sessions.HallId = Halls.ID

-- JOIN istifadə edərək bütün zallar 
--ilə bütün seanslar arasında mümkün olan bütün kombinasiyaları generasiya edin.

