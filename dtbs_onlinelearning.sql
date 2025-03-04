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
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID)
);



CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Description TEXT,
    Price FLOAT,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
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
    AnswerID INT PRIMARY KEY,
    IsCorrectAnswer INT CHECK (IsCorrectAnswer IN (0,1)),
    AnswerContent NVARCHAR(255),
  
);
CREATE TABLE Question (
    QuestionID INT PRIMARY KEY,
    QuestionType NVARCHAR(255),
    QuestionContent NVARCHAR(255),
    AnswerID INT FOREIGN KEY REFERENCES Answer(AnswerID)
);

CREATE TABLE Test (
    TestID INT PRIMARY KEY,
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
    EnrollmentID INT PRIMARY KEY,
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

