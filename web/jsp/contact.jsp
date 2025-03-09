<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Quiz Test</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container mt-5">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Câu hỏi <%= request.getAttribute("questionIndex") %>:</h3>
                    <p class="card-text"><%= request.getAttribute("questionText") %></p>
                    <form action="QuizServlet" method="post">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="answer" value="A" required>
                            <label class="form-check-label"><%= request.getAttribute("optionA") %></label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="answer" value="B">
                            <label class="form-check-label"><%= request.getAttribute("optionB") %></label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="answer" value="C">
                            <label class="form-check-label"><%= request.getAttribute("optionC") %></label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="answer" value="D">
                            <label class="form-check-label"><%= request.getAttribute("optionD") %></label>
                        </div>
                        <input type="hidden" name="questionIndex" value="<%= request.getAttribute("questionIndex") %>">
                        <div class="mt-3">
                            <% if ((int) request.getAttribute("questionIndex") > 1) { %>
                                <button type="submit" name="action" value="previous" class="btn btn-secondary">Quay lại</button>
                            <% } %>
                            <% if ((int) request.getAttribute("questionIndex") < (int) request.getAttribute("totalQuestions")) { %>
                                <button type="submit" name="action" value="next" class="btn btn-primary">Tiếp tục</button>
                            <% } else { %>
                                <button type="submit" name="action" value="submit" class="btn btn-success">Nộp bài</button>
                            <% } %>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
