package ru.mysite.web.client;


import ru.mysite.web.AppDAOGeneral;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppDAO extends AppDAOGeneral {

    public void create(Client client){
        String sql = "insert into client(card_id, fname,lname, date, address, phone, email) values (?,?,?,?,?,?,?)";
        Connection connection = getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, client.getCard_id());
            statement.setString(2, client.getFirstName());
            statement.setString(3, client.getLastName());
            statement.setString(4, client.getDate());
            statement.setString(5, client.getAddress());
            statement.setString(6, client.getPhone());
            statement.setString(7, client.getEmail());
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }

    public List<Client> selectAll(){
        List<Client> clients = new ArrayList<Client>();
        Connection connection = getConnection();
        String sql = "select * from client";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                clients.add(new Client(result.getInt("id"), result.getInt("card_id"), result.getString("fname"), result.getString("lname"),
                        result.getString("date"), result.getString("address"), result.getString("phone"), result.getString("email")));
            }
            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return clients;
    }

    public void remove(int id){
        String sql = "delete from client where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }

    public Client selectOne(int id){
        Client app = null;
        String sql = "select * from client where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet set = statement.executeQuery();
            if(set.next()){
                id = set.getInt("id");
                int cardId = set.getInt("card_id");
                String firstName = set.getString("fname");
                String lastName = set.getString("lname");
                String date = set.getString("date");
                String address = set.getString("address");
                String phone = set.getString("phone");
                String email = set.getString("email");
                app = new Client(id, cardId, firstName, lastName, date, address, phone, email);
            }
            statement.close();
            set.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return app;
    }

    public String selectOneStr(String fname, String lname){
        String out = null;
        String sql = "select * from client where fname=? and lname=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fname.toLowerCase());
            statement.setString(2, lname.toLowerCase());
            ResultSet set = statement.executeQuery();
            if(set.next()){
                out = set.getString("card_id");
            }
            statement.close();
            set.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return out;
    }
    public String selectLastCardId(){
        String out = null;
        String sql = "select max(id) from client_card";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet set = statement.executeQuery();
            if(set.next()){
                out = set.getString("max(id)");
            }
            statement.close();
            set.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return out;
    }

    public void update(int id, Client application){
        String sql = "update client set card_id=?, fname=?, lname=?, date=?, address=?, phone=?, email=? where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, application.getCard_id());
            statement.setString(2, application.getFirstName());
            statement.setString(3, application.getLastName());
            statement.setString(4, application.getDate() );
            statement.setString(5, application.getAddress());
            statement.setString(6, application.getPhone());
            statement.setString(7, application.getEmail());
            statement.setInt(8, id);
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }
}
