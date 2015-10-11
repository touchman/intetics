package ru.mysite.web.order;


import ru.mysite.web.AppDAOGeneral;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppOrderDAO extends AppDAOGeneral {

    public void create(Orders orders){
        String sql = "insert into orders(order_id, date, amount, status) values (?,?,?,?)";
        Connection connection = getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orders.getOrder_id());
            statement.setString(2, orders.getDate());
            statement.setInt(3, orders.getAmount());
            statement.setString(4, orders.getStatus());
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }

    public List<Orders> selectAll(){
        List<Orders> orderses = new ArrayList<Orders>();
        Connection connection = getConnection();
        String sql = "select * from orders";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                orderses.add(new Orders(result.getInt("id") ,result.getInt("order_id"),result.getString("date"), result.getInt("amount"),
                        result.getString("status")));
            }
            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeConnection(connection);
        }
        return orderses;
    }

    public List<Orders> selectData(int id){
        List<Orders> clients = new ArrayList<Orders>();
        Connection connection = getConnection();
        String sql = "select * from orders where order_id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                clients.add(new Orders(result.getInt("id"),result.getInt("order_id"),result.getString("date"), result.getInt("amount"),
                        result.getString("status")));
            }
            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeConnection(connection);
        }
        return clients;
    }

    public void remove(int id){
        String sql = "delete from orders where id=?";

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

    public Orders selectOneCard(int id){
        Orders app = null;
        String sql = "select * from orders where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet set = statement.executeQuery();
            if(set.next()){
                id = set.getInt("id");
                int order_id = set.getInt("order_id");
                String date = set.getString("date");
                int amount = set.getInt("amount");
                String status = set.getString("status");
                app = new Orders(id, order_id, date, amount, status);
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

    public Orders selectOne(int id){
        Orders app = null;
        String sql = "select * from orders where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet set = statement.executeQuery();
            if(set.next()){
                id = set.getInt("id");
                int order_id = set.getInt("order_id");
                String date = set.getString("date");
                int amount = set.getInt("amount");
                String status = set.getString("status");
                app = new Orders(id, order_id, date, amount, status);
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

    public void update(int id, Orders application){
        String sql = "update orders set order_id=?, date=?, amount=?, status=? where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, application.getOrder_id());
            statement.setString(2, application.getDate());
            statement.setInt(3, application.getAmount());
            statement.setString(4, application.getStatus());
            statement.setInt(5, id);
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }
}
