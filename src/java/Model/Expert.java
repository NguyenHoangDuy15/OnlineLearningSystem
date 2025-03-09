/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Administrator
 */


   public class Expert {
     String username;
    String courseName;
    String avatar;

    public Expert(String username, String courseName, String avatar) {
        this.username = username;
        this.courseName = courseName;
        this.avatar = avatar;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

        @Override
        public String toString() {
            return "Expert{" + "username=" + username + ", courseName=" + courseName + ", avatar=" + avatar + '}';
        }



}
