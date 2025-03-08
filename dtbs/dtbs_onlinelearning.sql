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





CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY  IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    Status INT CHECK (Status IN (0,1)),
    EnrolledAt DATETIME
);

INSERT INTO Roles (RoleID, RoleName) 
VALUES 
    (1, 'Admin'),
    (2, 'Expert'),
    (3, 'Sale'),
    (4, 'Customer');
	INSERT INTO [dbo].[Users]
           ([FullName]
           ,[UserName]
           ,[Email]
           ,[Password]
           ,[Avartar]
           ,[RoleID]
           ,[Status])
     VALUES
           ('Admin123@'
           ,'Admin123@'
           ,'Admin123@gmail.com'
           ,'QWRtaW4xMjNAZndlcWZ3ZTtoZml1ZHNmYXNkZmFzZGZhcw=='
           ,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjA8mLF9lMmoWREqCbb6rT8RLp7In1x_5hlA&s'
           ,1
           ,1)
INSERT INTO [dbo].[Users]
           ([FullName]
           ,[UserName]
           ,[Email]
           ,[Password]
           ,[Avartar]
           ,[RoleID]
           ,[Status])
     VALUES
           ('Hoang Cong Ninh'
           ,'Congninh123@'
           ,'ninhhche187071@fpt.edu.vn'
           ,'Q29uZ25pbmgxMjNAZndlcWZ3ZTtoZml1ZHNmYXNkZmFzZGZhcw==' --Congninh123@
           ,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjA8mLF9lMmoWREqCbb6rT8RLp7In1x_5hlA&s'
           ,2
           ,1)
INSERT INTO [dbo].[Users]
           ([FullName]
           ,[UserName]
           ,[Email]
           ,[Password]
           ,[Avartar]
           ,[RoleID]
           ,[Status])
     VALUES
           ('NinhNH123@'
           ,'NinhNH123@'
           ,'congninh@gmail.com'
           ,'TmluaE5IMTIzQGZ3ZXFmd2U7aGZpdWRzZmFzZGZhc2RmYXM=' -- NinhNH123@
           ,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjA8mLF9lMmoWREqCbb6rT8RLp7In1x_5hlA&s'
           ,2
           ,1)
INSERT INTO [dbo].[Users]
           ([FullName]
           ,[UserName]
           ,[Email]
           ,[Password]
           ,[Avartar]
           ,[RoleID]
           ,[Status])
     VALUES
           ('Nguyen Thu Uyen'
           ,'Sale123@'
           ,'nguyenuyenpb68@gmail.com'
           ,'U2FsZTEyM0Bmd2VxZndlO2hmaXVkc2Zhc2RmYXNkZmFz'
           ,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjA8mLF9lMmoWREqCbb6rT8RLp7In1x_5hlA&s'
           ,3
           ,1)
INSERT INTO [dbo].[Users]
           ([FullName]
           ,[UserName]
           ,[Email]
           ,[Password]
           ,[Avartar]
           ,[RoleID]
           ,[Status])
     VALUES
           ('Nguyen Saler'
           ,'Saler2@123'
           ,'Sale@gmail.com'
           ,'U2FsZXIyQDEyM2Z3ZXFmd2U7aGZpdWRzZmFzZGZhc2RmYXM='
           ,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjA8mLF9lMmoWREqCbb6rT8RLp7In1x_5hlA&s'
           ,3
           ,1)
INSERT INTO [dbo].[Users]
           ([FullName]
           ,[UserName]
           ,[Email]
           ,[Password]
           ,[Avartar]
           ,[RoleID]
           ,[Status])
     VALUES
           ('Pham Trung hieu'
           ,'Hieu123@'
           ,'phamtrunghieucr7@gmail.com'
           ,'SGlldTEyM0Bmd2VxZndlO2hmaXVkc2Zhc2RmYXNkZmFz'
           ,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjA8mLF9lMmoWREqCbb6rT8RLp7In1x_5hlA&s'
           ,4
           ,1)
INSERT INTO Category (CategoryName, Description) VALUES 
(N'Java Programming', N'Learn Java from basics to advanced concepts.'),
(N'Python Programming', N'Master Python for development, data science, and AI.'),
(N'JavaScript Programming', N'Build interactive web applications with JavaScript.')
INSERT INTO Courses (Name, Description, Price, imageCources, UserID, CategoryID, CreatedAt) VALUES 
-- Java Courses

(N'Java for Beginners', N'Learn Java fundamentals, syntax, and object-oriented programming.', 150,'https://s3-sgn09.fptcloud.com/codelearnstorage/Upload/Blog/lap-trinh-java-for-beginner-63739300179.8416.jpg', 1, 1, GETDATE()),
(N'Advanced Java Development', N'Deep dive into Java frameworks, multithreading, and design patterns.', 180,'https://skilltechacademy.in/wp-content/uploads/2024/07/advanced-java-online-training-1024x585.jpeg' , 1, 1, GETDATE()),
(N'Java Spring Boot Web Development', N'Build enterprise-level web applications with Spring Boot.', 200,'https://www.adm.ee/wordpress/wp-content/uploads/2023/12/Spring-768x512.png', 1, 1, GETDATE()),

-- Python Courses
(N'Python Basics', N'Learn the core syntax, data structures, and basic programming concepts in Python.', 120, 'https://miro.medium.com/v2/resize:fit:2000/1*Zipt5ex6sSVSkciwlJoG4Q.png', 1, 2, GETDATE()),
(N'Data Science with Python', N'Master data analysis, visualization, and machine learning with Python.', 190, 'https://cdn.shopaccino.com/igmguru/products/data-science--with-python-igmguru_176161162_l.jpg?v=509', 1, 2, GETDATE()),
(N'Python for Web Development', N'Build web applications using Django and Flask frameworks.', 170, 'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20220826185259/Why-to-Use-Python-for-Web-Development.jpg', 1, 2, GETDATE()),

-- JavaScript Courses
(N'JavaScript Essentials', N'Learn JavaScript basics, including variables, loops, and functions.', 110, 'https://img-c.udemycdn.com/course/750x422/1468694_d595_2.jpg', 1, 3, GETDATE()),
(N'Frontend Development with JavaScript', N'Build interactive UI with JavaScript, HTML, and CSS.', 160, 'https://media.geeksforgeeks.org/wp-content/uploads/20240703165023/Frontend-Development-(1).webp', 1, 3, GETDATE()),
(N'Backend Development with Node.js', N'Learn to create server-side applications using Node.js.', 200, 'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20220517005132/Why-to-Use-NodeJS-for-Backend-Development.jpg', 1, 3, GETDATE());

INSERT INTO Lessons (Title, Content, CourseID, Status) VALUES 
('Java Programming for Beginner-Full-Course', 'https://www.youtube.com/watch?v=A74TOX803D0&t=3s', 1, 1),
('Advanced Java Programming A Comprehensive Full-Course', 'https://www.youtube.com/watch?v=I_qP7H3STMg', 1, 1),
('Java Spring Boot Web Development-Full-Course', 'https://www.youtube.com/watch?v=I_qP7H3STMg', 1, 1),
('Python Full Course for Beginners', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, 1),
('Data Science with Python-Full Course', 'https://www.youtube.com/watch?v=nHAPcZRg9VM', 2, 1),
('Web Development with Python Tutorial – Flask & Dynamic Database-Driven Web Apps', 'https://www.youtube.com/watch?v=yBDHkveJUf4', 2, 1),
('JavaScript Course for Beginners 2024', 'https://www.youtube.com/watch?v=Zi-Q0t4gMC8', 3, 1),
('Frontend Web Development Bootcamp Course (JavaScript, HTML, CSS)', 'https://www.youtube.com/watch?v=zJSY8tbf_ys', 3, 1),
('Node.js and Express.js - Full Course', 'https://www.youtube.com/watch?v=Oe421EPjeBE', 3, 1)
INSERT INTO Blogs (BlogTitle, BlogDetail, BlogImage, BlogDate, UserID)
VALUES 
    (N'Bắt đầu học lập trình: Lộ trình cho người mới', 
     N'Bạn mới học lập trình? Đây là hướng dẫn chi tiết giúp bạn bắt đầu với ngôn ngữ phù hợp và tài nguyên học tập. Để bắt đầu học lập trình hiệu quả, bạn cần xác định mục tiêu rõ ràng: muốn làm web, ứng dụng di động hay AI? Hãy chọn một ngôn ngữ phù hợp như Python, JavaScript hoặc Java. Tiếp theo, xây dựng nền tảng vững chắc với thuật toán và cấu trúc dữ liệu. Đừng quên tham gia cộng đồng lập trình để học hỏi và rèn luyện tư duy giải quyết vấn đề. Quan trọng nhất, hãy thực hành qua các dự án thực tế để nâng cao kỹ năng.',
     'https://iviettech.vn/wp-content/uploads/2024/01/lo-trinh-hoc-lap-trinh.png', GETDATE(), 4),

    (N'Top 5 ngôn ngữ lập trình nên học trong năm 2025', 
     N'Python, JavaScript, Java, C#, Go - Đâu là lựa chọn tốt nhất cho bạn trong năm nay? 
	 Python tiếp tục dẫn đầu với ứng dụng mạnh mẽ trong AI và khoa học dữ liệu. JavaScript vẫn là lựa chọn số một cho lập trình web, đặc biệt với các framework như React, Vue. Java giữ vững vị trí trong các hệ thống doanh nghiệp. C# phát triển mạnh trong game development với Unity. Go nổi lên như một lựa chọn hàng đầu cho backend nhờ hiệu suất cao. Chọn ngôn ngữ phù hợp với định hướng nghề nghiệp của bạn để phát triển nhanh nhất.',
     'https://st.quantrimang.com/photos/image/2022/12/08/top-20-ngon-ngu-lap-trinh-nen-hoc.jpg', GETDATE(), 4),

    (N'Dự án lập trình đầu tay: Viết một To-Do List đơn giản', 
     N'Hướng dẫn từng bước tạo một ứng dụng danh sách công việc bằng HTML, CSS, và JavaScript. Bắt đầu với HTML để tạo giao diện, CSS để thiết kế, và JavaScript để xử lý sự kiện. Hãy sử dụng `localStorage` để lưu dữ liệu trên trình duyệt, giúp danh sách công việc không bị mất khi tải lại trang. Thêm các tính năng như đánh dấu hoàn thành, chỉnh sửa hoặc xóa công việc để ứng dụng trở nên thực tế hơn. Khi đã nắm vững cơ bản, hãy thử nâng cấp dự án bằng React hoặc Vue để làm quen với framework hiện đại.',
     'https://glints.com/vn/blog/wp-content/uploads/2022/09/ma%CC%82%CC%83u-to-do-list.jpeg', GETDATE(), 4),

    (N'Học lập trình có cần giỏi toán không?',
N'Nhiều người nghĩ lập trình yêu cầu toán cao cấp, nhưng sự thật không hẳn như vậy. Cùng tìm hiểu! Nhiều lĩnh vực lập trình không yêu cầu toán cao cấp, nhưng tư duy logic và giải quyết vấn đề là bắt buộc. Nếu bạn hướng đến AI, khoa học dữ liệu hay mật mã học, kiến thức toán sẽ rất quan trọng. Ngược lại, phát triển web hay ứng dụng di động chủ yếu cần kỹ năng lập trình hơn là toán. Thay vì lo lắng về toán, hãy tập trung vào tư duy thuật toán, phân tích yêu cầu và cách viết code sạch, dễ bảo trì.',
     'https://cdn.codegym.vn/wp-content/uploads/2021/09/hoc-lap-trinh-co-can-gioi-toan-khong-8.jpg', GETDATE(), 4),

    (N'100 ngày code: Hành trình từ newbie đến lập trình viên', 
     N'Bạn có thể trở thành lập trình viên sau 100 ngày học tập? Hãy thử thách bản thân với kế hoạch này! Cam kết dành ít nhất 1 giờ mỗi ngày để code, học từ các nguồn uy tín như FreeCodeCamp, Codecademy. Mỗi tuần, chọn một chủ đề như HTML, CSS, JavaScript, API, hoặc database để thực hành. Theo dõi tiến trình bằng cách viết blog hoặc chia sẻ dự án trên GitHub. Nếu duy trì đủ 100 ngày, bạn sẽ không chỉ có kiến thức vững vàng mà còn hình thành thói quen lập trình, sẵn sàng cho công việc thực tế.',
     'https://niithanoi.edu.vn/pic/News/100-ngay-hoc-code.png', GETDATE(), 5);


	 INSERT INTO [dbo].[Feedbacks]
           ([UserID]
           ,[CourseID]
           ,[Rating]
           ,[Comment]
           ,[CreatedAt])
     VALUES
           (6
           ,1
           ,5
           ,'Good'
           ,GETDATE())
INSERT INTO [dbo].[Feedbacks]
           ([UserID]
           ,[CourseID]
           ,[Rating]
           ,[Comment]
           ,[CreatedAt])
     VALUES
           (6
           ,1
           ,4
           ,'Well'
           ,GETDATE())
INSERT INTO [dbo].[Feedbacks]
           ([UserID]
           ,[CourseID]
           ,[Rating]
           ,[Comment]
           ,[CreatedAt])
     VALUES
           (6
           ,1
           ,3
           ,'Fantastic'
           ,GETDATE())

		   INSERT INTO Payment (UserID, CourseID, Amount) VALUES 
(6, 3, 200.00),  -- Java Spring Boot Web Development
(6, 5, 190.00);  -- Data Science with Python
-- Giao dịch cho khóa học "Java Spring Boot Web Development"
INSERT INTO TransactionHistory (PayID, Status, CreatedAt, CourseID, PaymentMethod, PaymentDate) 
VALUES (1, 1, GETDATE(), 3, N'VNPay', GETDATE());

-- Giao dịch cho khóa học "Data Science with Python"
INSERT INTO TransactionHistory (PayID, Status, CreatedAt, CourseID, PaymentMethod, PaymentDate) 
VALUES (2, 1, GETDATE(), 5, N'VNPay', GETDATE());
INSERT INTO [dbo].[Requests]
           ([RequestedRole]
           ,[UserID])
     VALUES
           (2
           ,6)
INSERT INTO [dbo].[Requests]
           ([RequestedRole]
           ,[UserID])
     VALUES
           (2
           ,6)
INSERT INTO [dbo].[Requests]
           ([RequestedRole]
           ,[UserID])
     VALUES
           (3
           ,6)
INSERT INTO Answer (IsCorrectAnswer, AnswerContent)  
VALUES  
    (1, 'B. extends'),  
    (0, 'A. implements'),  
    (0, 'C. inherits'),  
    (0, 'D. interface'),  
    (1, 'A. public static void main(String[] args)'),  
    (0, 'B. static void main(String[] args)'),  
    (0, 'C. public void main(String[] args)'),  
    (0, 'D. void main(String args[])'),  
    (1, 'C. int'),  
    (0, 'A. String'),  
    (0, 'B. ArrayList'),  
    (0, 'D. Integer'),  
    (1, 'A. Scanner scanner = new Scanner(System.in)'),  
    (0, 'B. Input input = new Input(System.in)'),  
    (0, 'C. System.console().readLine()'),  
    (0, 'D. new Scanner()'),  
    (1, 'B. Inside a method or block'),  
    (0, 'A. The entire program'),  
    (0, 'C. The entire class'),  
    (0, 'D. Inside a package'),  
    (1, 'D. All of the above'),  
    (0, 'A. A variable cannot be changed'),  
    (0, 'B. A method cannot be overridden'),  
    (0, 'C. A class cannot be inherited'),  
    (1, 'C. Abstract methods'),  
    (0, 'A. Methods with a body'),  
    (0, 'B. Mutable variables'),  
    (0, 'D. Constructor'),  
    (1, 'A. java.util'),  
    (0, 'B. java.lang'),  
    (0, 'C. java.io'),  
    (0, 'D. java.sql'),  
    (1, 'B. get(int index)'),  
    (0, 'A. fetch(int index)'),  
    (0, 'C. retrieve(int index)'),  
    (0, 'D. find(int index)'),  
    (1, 'C. new'),  
    (0, 'A. create'),  
    (0, 'B. build'),  
    (0, 'D. instance'),  
    (1, 'B. false'),  
    (0, 'A. true'),  
    (0, 'C. null'),  
    (0, 'D. 0'),  
    (1, 'B. Compare the contents of two objects'),  
    (0, 'A. Compare memory addresses of two objects'),  
    (0, 'C. Copy an object'),  
    (0, 'D. Compare two integers'),  
    (1, 'A. (Dog) animal;'),  
    (0, 'B. (int) 3.5'),  
    (0, 'C. Integer.parseInt("123")'),  
    (0, 'D. String.valueOf(123);'),  
    (1, 'A. FileReader'),  
    (0, 'B. FileScanner'),  
    (0, 'C. FileWriter'),  
    (0, 'D. FileOutputStream'),  
    (1, 'A. Exception handling'),  
    (0, 'B. Defining loops'),  
    (0, 'C. Ending a program'),  
    (0, 'D. Initializing variables'),  
    (1, 'B. Throw an exception'),  
    (0, 'A. Declare an exception'),  
    (0, 'C. Handle an exception'),  
    (0, 'D. Catch an exception'),  
    (1, 'B. An interface'),  
    (0, 'A. A class'),  
    (0, 'C. A package'),  
    (0, 'D. An annotation'),  
    (1, 'A. Call the constructor of the parent class'),  
    (0, 'B. Call a static method'),  
    (0, 'C. Access a private method'),  
    (0, 'D. Access a global variable'),  
    (1, 'A. == compares memory addresses, equals() compares content'),  
    (0, 'B. Both compare memory addresses'),  
    (0, 'C. == compares content, equals() compares memory addresses'),  
    (0, 'D. No difference'),  
    (1, 'C. break'),  
    (0, 'B. continue'),  
    (0, 'A. stop'),  
    (0, 'D. exit'),  
    (1, 'D. PrintStream'),  
    (0, 'A. System'),  
    (0, 'B. Console'),  
    (0, 'C. OutputStream'),  
    (1, 'B. A floating-point number in the range [0,1)'),  
    (0, 'A. An integer'),  
    (0, 'C. A floating-point number in the range (0,1]'),  
    (0, 'D. An integer in the range [0,10]'),  
    (1, 'B. 32 bits'),  
    (0, 'A. 16 bits'),  
    (0, 'C. 64 bits'),  
    (0, 'D. 8 bits'),  
    (1, 'C. final'),  
    (0, 'A. static'),  
    (0, 'B. private'),  
    (0, 'D. protected'),  
    (1, 'B. It will compile but not run'),  
    (0, 'A. It will compile and run'),  
    (0, 'C. It will not compile'),  
    (0, 'D. It will throw an exception'),  
    (1, 'B. constructor'),  
    (0, 'A. finalize()'),  
    (0, 'D. run()'),  
    (0, 'C. start()'),  
    (1, 'D. default (no modifier)'),  
    (0, 'A. public'),  
    (0, 'B. private'),  
    (0, 'C. protected'),  
    (1, 'A. Object'),  
    (0, 'B. Class'),  
    (0, 'C. Super'),  
    (0, 'D. Base'),  
    (1, 'A. Throws ArithmeticException'),  
    (0, 'B. Returns Infinity'),  
    (0, 'C. Returns NaN'),  
    (0, 'D. Returns 0'),  
    (1, 'B. super'),  
    (0, 'A. this'),  
    (0, 'C. extends'),  
    (0, 'D. parent');

INSERT INTO Question (QuestionType, QuestionContent, AnswerID)
VALUES 
('multiple choice', 'Which keyword is used to inherit a class in Java? 
A. implements 
B. extends 
C. inherits 
D. interface', 1),

('multiple choice', 'Which of the following is the correct declaration of the main method in Java? 
A. public static void main(String[] args) 
B. static void main(String[] args) 
C. public void main(String[] args) 
D. void main(String args[])', 5),

('multiple choice', 'Which data type is a primitive type in Java? 
A. String 
B. ArrayList 
C. int 
D. Integer', 9),

('multiple choice', 'Which statement is used to read input from the keyboard in Java? 
A. Scanner scanner = new Scanner(System.in); 
B. Input input = new Input(System.in); 
C. System.console().readLine(); 
D. new Scanner();', 13),

('multiple choice', 'What is the scope of a local variable? 
A. The entire program 
B. Inside a method or block 
C. The entire class 
D. Inside a package', 17),

('multiple choice', 'What does the final keyword mean in Java? 
A. A variable cannot be changed 
B. A method cannot be overridden 
C. A class cannot be inherited 
D. All of the above', 21),

('multiple choice', 'An interface in Java can contain: 
A. Methods with a body 
B. Mutable variables 
C. Abstract methods 
D. Constructors', 25),

('multiple choice', 'Which package does the ArrayList class belong to? 
A. java.util 
B. java.lang 
C. java.io 
D. java.sql', 29),

('multiple choice', 'Which method of ArrayList is used to retrieve an element by index? 
A. fetch(int index) 
B. get(int index) 
C. retrieve(int index) 
D. find(int index)', 33),

('multiple choice', 'Which keyword is used to create an object in Java? 
A. create 
B. build 
C. new 
D. instance', 37),

('multiple choice', 'What is the default value of a boolean variable in Java? 
A. true 
B. false 
C. null 
D. 0', 41),

('multiple choice', 'What is the purpose of the equals() method? 
A. Compare memory addresses of two objects 
B. Compare the contents of two objects 
C. Copy an object 
D. Compare two integers', 45),

('multiple choice', 'Which of the following is an example of downcasting? 
A. (Dog) animal; 
B. (int) 3.5; 
C. Integer.parseInt("123"); 
D. String.valueOf(123);', 49),

('multiple choice', 'Which class is used to read data from a file in Java? 
A. FileReader 
B. FileScanner 
C. FileWriter 
D. FileOutputStream', 53),

('multiple choice', 'What is try-catch-finally used for? 
A. Exception handling 
B. Defining loops 
C. Ending a program 
D. Initializing variables', 57),

('multiple choice', 'What is the purpose of the throw keyword? 
A. Declare an exception 
B. Throw an exception 
C. Handle an exception 
D. Catch an exception', 61),

('multiple choice', 'What is Runnable in Java? 
A. A class 
B. An interface 
C. A package 
D. An annotation', 65),

('multiple choice', 'What is the purpose of the super keyword? 
A. Call the constructor of the parent class 
B. Call a static method 
C. Access a private method 
D. Access a global variable', 69),

('multiple choice', 'What is the difference between == and equals()? 
A. == compares memory addresses, equals() compares content 
B. Both compare memory addresses 
C. == compares content, equals() compares memory addresses 
D. No difference', 73),

('multiple choice', 'Which statement is used to exit a loop? 
A. stop 
B. continue 
C. break 
D. exit', 77),

('multiple choice', 'Which class does System.out.println() belong to? 
A. System 
B. Console 
C. OutputStream 
D. PrintStream', 81),

('multiple choice', 'What does Math.random() return? 
A. An integer 
B. A floating-point number in the range [0,1) 
C. A floating-point number in the range (0,1] 
D. An integer in the range [0,10]', 85),

('multiple choice', 'What is the size of an int variable in Java? 
A. 16 bits 
B. 32 bits 
C. 64 bits 
D. 8 bits', 89),

('multiple choice', 'Which keyword is used to prevent a method from being overridden? 
A. static 
B. private 
C. final 
D. protected', 93),

('multiple choice', 'What will happen if we try to execute a program without a main method in Java? 
A. It will compile and run 
B. It will compile but not run 
C. It will not compile 
D. It will throw an exception', 97),

('multiple choice', 'Which method is called automatically when an object is created? 
A. finalize() 
B. constructor 
C. start() 
D. run()', 101),

('multiple choice', 'Which access modifier allows a variable to be accessed only within the same package? 
A. public 
B. private 
C. protected 
D. default (no modifier)', 105),

('multiple choice', 'What is the parent class of all classes in Java? 
A. Object 
B. Class 
C. Super 
D. Base', 109),

('multiple choice', 'What happens when you divide an integer by zero in Java? 
A. Throws ArithmeticException 
B. Returns Infinity 
C. Returns NaN 
D. Returns 0', 113),

('multiple choice', 'Which keyword is used to call the constructor of the parent class? 
A. this 
B. super 
C. extends 
D. parent', 117);

INSERT INTO [dbo].[Test] ([Name], [Status], [CreatedBy], [TotalMark], [CourseID]) 
VALUES ('Test 1', 0, 'Hoang Cong Ninh', 0, 1);


INSERT INTO [dbo].[Test]
           ([Name]
           ,[Status]
           ,[CreatedBy]
           ,[TotalMark]
           ,[CourseID])
     VALUES
           ('Test 1'
           ,0
           ,'Hoang Cong Ninh'
           ,0
           ,1)


INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,1)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,2)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,3)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,4)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,5)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,6)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,7)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,8)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,9)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,10)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,11)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,12)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,13)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,14)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,15)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,16)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,17)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,18)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,19)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,20)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,21)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,22)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,23)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,24)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,25)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,26)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,27)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,28)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,29)
INSERT INTO [dbo].[Test_Question]
           ([TestID]
           ,[QuestionID])
     VALUES
           (1
           ,30)
INSERT INTO [dbo].[Enrollments]
           ([UserID]
           ,[CourseID]
           ,[Status]
           ,[EnrolledAt])
     VALUES
           (6
           ,1
           ,1
           ,GETDATE())
INSERT INTO [dbo].[Enrollments]
           ([UserID]
           ,[CourseID]
           ,[Status]
           ,[EnrolledAt])
     VALUES
           (6
           ,2
           ,1
           ,GETDATE())
INSERT INTO [dbo].[Enrollments]
           ([UserID]
           ,[CourseID]
           ,[Status]
           ,[EnrolledAt])
     VALUES
           (6
           ,3
           ,1
           ,GETDATE())

		   select * from Users
		   select * from Courses
		SELECT 
    c.CourseID, 
    c.Name, 
    u.FullName AS ExpertName, 
    c.Price, 
    COALESCE(AVG(f.Rating), 0) AS AverageRating, 
    COUNT(f.Rating) AS TotalReviews 
FROM Courses c
JOIN Users u ON c.UserID = u.UserID
LEFT JOIN Feedbacks f ON c.CourseID = f.CourseID
WHERE c.CourseID = 1
GROUP BY c.CourseID, c.Name, u.FullName, c.Price;

