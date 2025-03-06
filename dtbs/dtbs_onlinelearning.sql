--Create database OnlineLearning
--Use OnlineLearning
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(255) NOT NULL
);
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(255) NOT NULL,
	UserName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(1000) NOT NULL,
	Avartar nvarchar(255),
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID),
	Status TINYINT NOT NULL DEFAULT 1 
);



CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(255) NOT NULL,
    Description TEXT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Description TEXT,
    Price FLOAT,
	imageCources nvarchar(255),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CategoryID INT FOREIGN KEY REFERENCES Category(CategoryID),
    CreatedAt DATE
);

CREATE TABLE Lessons (
    LessonID INT IDENTITY(1,1) PRIMARY KEY,
    Content NVARCHAR(MAX),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    Title NVARCHAR(255),
    Status INT CHECK (Status IN (0,1))
);

CREATE TABLE Blogs (
    BlogID INT IDENTITY(1,1) PRIMARY KEY,
    BlogTitle NVARCHAR(255) NOT NULL,
    BlogDetail NVARCHAR(1000) NOT NULL,
    BlogImage NVARCHAR(255),
    BlogDate DATE,
    UserID INT FOREIGN KEY REFERENCES Users(UserID)
);

CREATE TABLE Feedbacks (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    CourseID INT NOT NULL FOREIGN KEY REFERENCES Courses(CourseID),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(1000) NOT NULL,
    CreatedAt DATE
);

CREATE TABLE Payment (
    PayID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    Amount DECIMAL(10,2)
);

CREATE TABLE TransactionHistory (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    PayID INT NOT NULL FOREIGN KEY REFERENCES Payment(PayID),
    Status INT CHECK (Status IN (0,1)),
    CreatedAt DATETIME,
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    PaymentMethod NVARCHAR(50),
    PaymentDate DATETIME
);

CREATE TABLE Requests (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    RequestedRole INT FOREIGN KEY REFERENCES Roles(RoleID),
    UserID INT FOREIGN KEY REFERENCES Users(UserID)
);
CREATE TABLE Answer (
    AnswerID INT PRIMARY KEY IDENTITY(1,1),
    IsCorrectAnswer INT CHECK (IsCorrectAnswer IN (0,1)),
    AnswerContent NVARCHAR(255),
  
);
CREATE TABLE Question (
    QuestionID INT PRIMARY KEY IDENTITY(1,1),
    QuestionType NVARCHAR(255),
    QuestionContent NVARCHAR(255),
    AnswerID INT FOREIGN KEY REFERENCES Answer(AnswerID)
);

CREATE TABLE Test (
    TestID INT PRIMARY KEY  IDENTITY(1,1),
    Name VARCHAR(255),
    Status INT CHECK (Status IN (0,1)),
    CreatedBy NVARCHAR(50),
    QuestionID INT FOREIGN KEY REFERENCES Question(QuestionID),
    TotalMark FLOAT,
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID)
);

CREATE TABLE Test_Question ( -- Bảng trung gian để Test có nhiều Question
    TestID INT FOREIGN KEY REFERENCES Test(TestID),
    QuestionID INT FOREIGN KEY REFERENCES Question(QuestionID),
    PRIMARY KEY (TestID, QuestionID)
);

CREATE TABLE UserAnswers (--lưu câu trả lời của từng người dùn
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    TestID INT FOREIGN KEY REFERENCES Test(TestID),
    QuestionID INT FOREIGN KEY REFERENCES Question(QuestionID),
    AnswerID INT FOREIGN KEY REFERENCES Answer(AnswerID),
    PRIMARY KEY (UserID, TestID, QuestionID)
);



CREATE TABLE MyCourses (
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    PRIMARY KEY (UserID, CourseID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY  IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    Status INT CHECK (Status IN (0,1)),
    EnrolledAt DATETIME
);

--bang  Role
INSERT INTO Roles (RoleID, RoleName) 
VALUES 
    (1, 'Admin'),
    (2, 'Expert'),
    (3, 'Sale'),
    (4, 'Customer');

-- bang user 
INSERT INTO [dbo].[Users]
           ([FullName]
           ,[UserName]
           ,[Email]
           ,[Password]
           ,[RoleID])
     VALUES
           ('Admin123@'
           ,'Admin123@'
           ,'admin@gmail.com'
           ,'QWRtaW4xMjNAZndlcWZ3ZTtoZml1ZHNmYXNkZmFzZGZhcw=='
           ,1)
		  

-- Thêm dữ liệu vào bảng Users

-- Insert data into Users



-- Insert data into Users table (Experts can create courses, Sales can create blogs)
INSERT INTO Users (FullName, UserName, Email, Password, RoleID, Status) VALUES
(N'Nguyen Van A', N'nguyenvana', N'nguyenvana@example.com', 'password123', 2, 1), -- Expert
(N'Tran Thi B', N'tranthib', N'tranthib@example.com', 'password123', 2, 1), -- Expert
(N'Le Hoang C', N'lehoangc', N'lehoangc@example.com', 'password123', 2, 1), -- Expert
(N'Pham Van D', N'phamvand', N'phamvand@example.com', 'password123', 3, 1), -- Sale
(N'Nguyen Thi E', N'nguyenthie', N'nguyenthie@example.com', 'password123', 3, 1); -- Sale

-- Insert data into Category table (Programming lesson types)
INSERT INTO Category (CategoryName, Description) VALUES
(N'Java Programming', N'Java programming course from basic to advanced'),
(N'Python Programming', N'Learn Python for beginners'),
(N'Web Development', N'Design and develop websites with HTML, CSS, JavaScript');

-- Insert data into Courses table (only Experts can create courses)
INSERT INTO Courses (Name, Description, Price, UserID, CategoryID, CreatedAt) VALUES
(N'Java Core', N'Fundamental Java course', 500.00, 1, 1, '2024-03-01'),
(N'Python for Beginners', N'Learn Python from scratch', 300.00, 2, 2, '2024-03-05'),
(N'Fullstack Web Development', N'Comprehensive web development course', 700.00, 3, 3, '2024-03-10');

-- Insert data into Lessons table
INSERT INTO Lessons (Content, CourseID, Title, Status) VALUES
(N'Introduction to Java', 1, N'Java Basics', 1),
(N'Python Data Types', 2, N'Python Fundamentals', 1),
(N'HTML & CSS Overview', 3, N'Web Design Basics', 1);

-- Insert data into Blogs table (only Sales can create blogs)
INSERT INTO Blogs (BlogTitle, BlogDetail, BlogImage, BlogDate, UserID) VALUES
(N'Why Learn Java?', N'Java is one of the most popular programming languages...', NULL, '2024-03-12', 4),
(N'Python vs JavaScript', N'Comparing Python and JavaScript for web development...', NULL, '2024-03-14', 5);

-- Insert data into Feedbacks table
INSERT INTO Feedbacks (UserID, CourseID, Rating, Comment, CreatedAt) VALUES
(1, 1, 5, N'Great Java course!', '2024-03-15'),
(2, 2, 4, N'Helpful Python lessons', '2024-03-16'),
(3, 3, 5, N'Best web development guide!', '2024-03-17');

-- Insert data into Payment table
INSERT INTO Payment (UserID, CourseID, Amount) VALUES
(1, 1, 500.00),
(2, 2, 300.00),
(3, 3, 700.00);

-- Insert data into TransactionHistory table
INSERT INTO TransactionHistory (PayID, Status, CreatedAt, CourseID, PaymentMethod, PaymentDate) VALUES
(1, 1, '2024-03-15 10:00:00', 1, N'Credit Card', '2024-03-15 10:05:00'),
(2, 1, '2024-03-16 11:00:00', 2, N'PayPal', '2024-03-16 11:10:00'),
(3, 1, '2024-03-17 12:00:00', 3, N'Bank Transfer', '2024-03-17 12:20:00');

-- Insert data into Requests table
INSERT INTO Requests (RequestedRole, UserID) VALUES
(2, 1),
(2, 2),
(2, 3);

-- Insert data into Answer table
INSERT INTO Answer (IsCorrectAnswer, AnswerContent) VALUES
(1, N'Correct Answer 1'),
(0, N'Wrong Answer 1'),
(1, N'Correct Answer 2');

-- Insert data into Question table
INSERT INTO Question (QuestionType, QuestionContent, AnswerID) VALUES
(N'Multiple Choice', N'What is Java?', 1),
(N'True/False', N'Python is a compiled language.', 2),
(N'Short Answer', N'What is HTML?', 3);

-- Insert data into Test table
INSERT INTO Test (Name, Status, CreatedBy, QuestionID, TotalMark, CourseID) VALUES
(N'Java Test', 1, N'Nguyen Van A', 1, 100, 1),
(N'Python Test', 1, N'Tran Thi B', 2, 100, 2),
(N'Web Development Test', 1, N'Le Hoang C', 3, 100, 3);

-- Insert data into Test_Question table
INSERT INTO Test_Question (TestID, QuestionID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert data into UserAnswers table
INSERT INTO UserAnswers (UserID, TestID, QuestionID, AnswerID) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- Insert data into MyCourses table
INSERT INTO MyCourses (UserID, CourseID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert data into Enrollments table
INSERT INTO Enrollments (UserID, CourseID, Status, EnrolledAt) VALUES
(1, 1, 1, '2024-03-15 09:00:00'),
(2, 2, 1, '2024-03-16 10:00:00'),
(3, 3, 1, '2024-03-17 11:00:00');
INSERT INTO Feedbacks (UserID, CourseID, Rating, Comment, CreatedAt) VALUES (?, ?, ?, ?, ?)
select * from Feedbacks
SELECT 
    u.FullName AS Customer,
    c.Name AS Course,
    f.Comment AS Feedback
FROM Feedbacks f
JOIN Users u ON f.UserID = u.UserID
JOIN Courses c ON f.CourseID = c.CourseID
WHERE u.RoleID = 4 -- Chỉ lấy phản hồi từ khách hàng

SELECT 
    u.FullName AS username, 
    c.Name AS name 
FROM Users u 
JOIN Courses c ON u.UserID = c.UserID 
JOIN Roles r ON u.RoleID = r.RoleID 
WHERE r.RoleID = 2;
select * from Users
select *  from Feedbacks