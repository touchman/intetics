package ru.mysite.web.client;


import ru.mysite.web.AppDAOGeneral;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AppDAO extends AppDAOGeneral {

    public void create(Client client){
        String sql = "insert into client(fname, lname, date, address, phone, email) values (?,?,?,?,?,?)";
        Connection connection = getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, client.getFirstName());
            statement.setString(2, client.getLastName());
            statement.setString(3, client.getDate());
            statement.setString(4, client.getAddress());
            statement.setString(5, client.getPhone());
            statement.setString(6, client.getEmail());
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
                clients.add(new Client(result.getInt("id"), result.getString("fname"), result.getString("lname"),
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
        String sqlCardDelete = "delete from client_card where id=?";
        String sqlOrdersDelete = "delete from orders where order_id=?";
        String sqlCard = "select id from client_card where card_id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            PreparedStatement statementCard = connection.prepareStatement(sqlCard);
            PreparedStatement statementCardDelete = connection.prepareStatement(sqlCardDelete);
            PreparedStatement statementOrderDelete = connection.prepareStatement(sqlOrdersDelete);
            statement.setInt(1, id);
            statementCard.setInt(1, id);
            ResultSet resultSet = statementCard.executeQuery();
            List<Integer> secondId = new ArrayList<>();
            while(resultSet.next()){
                secondId.add(resultSet.getInt("id"));
            }
            for (Integer integer : secondId) {
                statementCardDelete.setInt(1, integer);
                statementOrderDelete.setInt(1, integer);
                statementCardDelete.execute();
                statementOrderDelete.execute();
            }
            statement.execute();
            statement.close();
            statementCard.close();
            statementCardDelete.close();
            statementOrderDelete.close();
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
                String firstName = set.getString("fname");
                String lastName = set.getString("lname");
                String date = set.getString("date");
                String address = set.getString("address");
                String phone = set.getString("phone");
                String email = set.getString("email");
                app = new Client(id, firstName, lastName, date, address, phone, email);
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
                out = set.getString("id");
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
        String sql = "update client set fname=?, lname=?, date=?, address=?, phone=?, email=? where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, application.getFirstName());
            statement.setString(2, application.getLastName());
            statement.setString(3, application.getDate() );
            statement.setString(4, application.getAddress());
            statement.setString(5, application.getPhone());
            statement.setString(6, application.getEmail());
            statement.setInt(7, id);
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }
}
