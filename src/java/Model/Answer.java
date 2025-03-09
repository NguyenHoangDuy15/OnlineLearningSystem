package Model;

public class Answer {
    private int answerId;
    private int questionId;
    private String content;
    private boolean isCorrect;

    public Answer() {}

    public Answer(int answerId, int questionId, String content, boolean isCorrect) {
        this.answerId = answerId;
        this.questionId = questionId;
        this.content = content;
        this.isCorrect = isCorrect;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }
}
