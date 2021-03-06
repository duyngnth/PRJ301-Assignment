/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Course;
import model.Group;
import model.Lecturer;

/**
 *
 * @author duyng
 */
public class DBContextGroup extends DBContext<Group> {

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Group> list(String lecturerID) {
        ArrayList<Group> groups = new ArrayList<>();
        connection = getConnection();
        try {
            String sql = "SELECT [GroupID], [GroupName], \n"
                    + "[LecturerID], [CourseID] FROM [Group]\n"
                    + "WHERE [LecturerID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, lecturerID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("GroupID");
                String name = rs.getString("GroupName");
                DBContextLecturer dbl = new DBContextLecturer();
                Lecturer lecturer = dbl.get(lecturerID);
                DBContextCourse dbc = new DBContextCourse();
                Course course = dbc.get(rs.getString("CourseID"));
                Group group = new Group(id, name, lecturer, course);
                groups.add(group);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return groups;
    }

    public ArrayList<Group> listByStudent(String sID) {
        ArrayList<Group> groups = new ArrayList<>();
        connection = getConnection();
        try {
            String sql = "SELECT [GroupID], [GroupName], \n"
                    + "[LecturerID], [CourseID] FROM [Group]\n"
                    + "WHERE [GroupID] IN \n"
                    + "(SELECT GroupID FROM [StudentGroup]\n"
                    + "WHERE [StudentID] = ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, sID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("GroupID");
                String name = rs.getString("GroupName");
                DBContextLecturer dbl = new DBContextLecturer();
                Lecturer lecturer = dbl.get(rs.getString("LecturerID"));
                DBContextCourse dbc = new DBContextCourse();
                Course course = dbc.get(rs.getString("CourseID"));
                groups.add(new Group(id, name, lecturer, course));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return groups;
    }

    @Override
    public Group get(int id) {
        Group group = null;
        connection = getConnection();
        try {
            String sql = "SELECT [GroupID], [GroupName], \n"
                    + "[LecturerID], [CourseID] FROM [Group]\n"
                    + "WHERE [GroupID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("GroupName");
                DBContextLecturer dbl = new DBContextLecturer();
                Lecturer lecturer = dbl.get(rs.getString("LecturerID"));
                DBContextCourse dbc = new DBContextCourse();
                Course course = dbc.get(rs.getString("CourseID"));
                group = new Group(id, name, lecturer, course);
                DBContextStudent dbs = new DBContextStudent();
                group.setStudents(dbs.listByGroup(name, course.getId()));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return group;
    }

    @Override
    public Group get(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Group getBySession(int sID) {
        Group group = null;
        connection = getConnection();
        try {
            String sql = "SELECT [GroupID], [GroupName], [LecturerID], [CourseID] FROM [Group]\n"
                    + "WHERE [GroupID] = (SELECT [GroupID] FROM [Session]\n"
                    + "WHERE [SessionID] = ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, sID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("GroupID");
                String name = rs.getString("GroupName");
                DBContextLecturer dbl = new DBContextLecturer();
                Lecturer lecturer = dbl.get(rs.getString("LecturerID"));
                DBContextCourse dbc = new DBContextCourse();
                Course course = dbc.get(rs.getString("CourseID"));
                group = new Group(id, name, lecturer, course);
                DBContextStudent dbs = new DBContextStudent();
                group.setStudents(dbs.listByGroup(name, course.getId()));
            }
        } catch (SQLException e) {
        }
        return group;
    }

    @Override
    public void add(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
