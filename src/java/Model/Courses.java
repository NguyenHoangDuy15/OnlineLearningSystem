/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Courses {

    int userid;
    
    int courseID;
    String name;
    String description;
    float price; // Đổi từ double thành float

    public Courses() {
    }


    public Courses(int courseID, String name, String description, float price) {
        this.courseID = courseID;
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    

    // Getter và Setter
    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Courses{" + "courseID=" + courseID + ", name=" + name + ", description=" + description + ", price=" + price + '}';
    }

}
