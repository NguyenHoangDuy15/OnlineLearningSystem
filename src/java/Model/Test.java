package Model;

public class Test {

    private int questionID;
 String questionType;
   String questionContent;
  String optionA;
 String optionB;
    String optionC;
     String optionD;
     int answerID;

    public Test(int questionID, String questionType, String questionContent,
            String optionA, String optionB, String optionC, String optionD, int answerID) {
        this.questionID = questionID;
        this.questionType = questionType;
        this.questionContent = questionContent;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.answerID = answerID;
    }

    // Getters & Setters
    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getOptionA() {
        return optionA;
    }

    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }

    public String getOptionB() {
        return optionB;
    }

    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }

    public String getOptionC() {
        return optionC;
    }

    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }

    public String getOptionD() {
        return optionD;
    }

    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
    }

    @Override
    public String toString() {
        return "Question{" + "questionID=" + questionID + ", questionType=" + questionType + ", questionContent=" + questionContent + ", optionA=" + optionA + ", optionB=" + optionB + ", optionC=" + optionC + ", optionD=" + optionD + ", answerID=" + answerID + '}';
    }
    
}
