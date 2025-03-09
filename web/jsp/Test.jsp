<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <form action="test" method="post">
                    <c:set var="currentIndex" value="${param.index != null ? param.index : 0}" />
                    <c:set var="totalQuestions" value="${questions.size()}" />
                    <c:set var="q" value="${questions[currentIndex]}" />

                    <div class="mb-4">
                        <h5 class="card-title">Question ${q.questionID}:</h5>
                        <p class="card-text">${q.questionContent}</p>

                        <c:set var="selectedAnswer" value="${userAnswers[q.questionID]}" />

                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="answer" value="A"
                                ${selectedAnswer == 'A' ? 'checked' : ''} required>
                            <label class="form-check-label">${q.optionA}</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="answer" value="B"
                                ${selectedAnswer == 'B' ? 'checked' : ''}>
                            <label class="form-check-label">${q.optionB}</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="answer" value="C"
                                ${selectedAnswer == 'C' ? 'checked' : ''}>
                            <label class="form-check-label">${q.optionC}</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="answer" value="D"
                                ${selectedAnswer == 'D' ? 'checked' : ''}>
                            <label class="form-check-label">${q.optionD}</label>
                        </div>
                    </div>

                    <input type="hidden" name="currentIndex" value="${currentIndex}">
                    <input type="hidden" name="questionID" value="${q.questionID}">

                    <div class="mt-3">
                        <c:if test="${currentIndex > 0}">
                            <button type="submit" name="action" value="previous" class="btn btn-secondary">Previous</button>
                        </c:if>

                        <c:if test="${currentIndex < totalQuestions - 1}">
                            <button type="submit" name="action" value="next" class="btn btn-primary">Next</button>
                        </c:if>

                        <c:if test="${currentIndex == totalQuestions - 1}">
                            <button type="submit" name="action" value="submit" class="btn btn-success">Submit</button>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
