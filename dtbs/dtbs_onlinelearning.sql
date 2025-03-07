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
    Avartar text,  -- Giữ lại cột Avartar từ nhánh `customer`
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID),
    Status TINYINT NOT NULL DEFAULT 1  -- Giữ lại kiểu dữ liệu TINYINT với DEFAULT 1 từ nhánh `customer`
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
	imageCources text,
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
    BlogImage text,
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


-- Insert into Users table
-- Insert categories
INSERT INTO Category (CategoryName, Description) VALUES 
(N'Java Programming', N'Learn Java from basics to advanced concepts.'),
(N'Python Programming', N'Master Python for development, data science, and AI.'),
(N'JavaScript Programming', N'Build interactive web applications with JavaScript.');

-- Insert courses with adjusted prices
INSERT INTO Courses (Name, Description, Price, imageCources, UserID, CategoryID, CreatedAt) VALUES 
-- Java Courses
(N'Java for Beginners', N'Learn Java fundamentals, syntax, and object-oriented programming.', 150, NULL, 1, 1, GETDATE()),
(N'Advanced Java Development', N'Deep dive into Java frameworks, multithreading, and design patterns.', 180, NULL, 1, 1, GETDATE()),
(N'Java Spring Boot Web Development', N'Build enterprise-level web applications with Spring Boot.', 200, NULL, 1, 1, GETDATE()),

-- Python Courses
(N'Python Basics', N'Learn the core syntax, data structures, and basic programming concepts in Python.', 120, NULL, 1, 2, GETDATE()),
(N'Data Science with Python', N'Master data analysis, visualization, and machine learning with Python.', 190, NULL, 1, 2, GETDATE()),
(N'Python for Web Development', N'Build web applications using Django and Flask frameworks.', 170, NULL, 1, 2, GETDATE()),

-- JavaScript Courses
(N'JavaScript Essentials', N'Learn JavaScript basics, including variables, loops, and functions.', 110, NULL, 1, 3, GETDATE()),
(N'Frontend Development with JavaScript', N'Build interactive UI with JavaScript, HTML, and CSS.', 160, NULL, 1, 3, GETDATE()),
(N'Backend Development with Node.js', N'Learn to create server-side applications using Node.js.', 200, NULL, 1, 3, GETDATE());

