<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Quiz Test</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="card">
                <div class="card-body">

<p>Current Index: ${currentIndex}</p>
<p>Total Questions: ${questions}</p>


                    <c:set var="currentIndex" value="${sessionScope.currentIndex != null ? sessionScope.currentIndex : 0}" />


                    <c:set var="totalQuestions" value="${questions.size()}" />
                    <c:set var="q" value="${questions[currentIndex]}" />
                    <form action="testAnswer" method="post">


                        <h5 class="card-title">Question ${q.questionID}:</h5>
                        <p class="card-text">${q.questionContent}</p>

                        <c:set var="selectedAnswer" value="${userAnswers[q.questionID]}" />
                        <c:set var="options" value="A,B,C,D" />

                        <c:forEach var="option" items="${fn:split(options, ',')}">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="answer" value="${option}"
                                       ${selectedAnswer == option ? 'checked' : ''} required>
                                <label class="form-check-label">${q['option'.concat(option)]}</label>
                            </div>
                        </c:forEach>

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