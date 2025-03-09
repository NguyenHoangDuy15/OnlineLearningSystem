/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Answer_U {

    private int userId;
    private int testId;
    private int questionId;
    private int answerId;

    public Answer_U(int userId, int testId, int questionId, int answerId) {
        this.userId = userId;
        this.testId = testId;
        this.questionId = questionId;
        this.answerId = answerId;
    }

    // Getter và Setter
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    @Override
    public String toString() {
        return "UserAnswer{" + "userId=" + userId + ", testId=" + testId + ", questionId=" + questionId + ", answerId=" + answerId + '}';
    }
    
}
