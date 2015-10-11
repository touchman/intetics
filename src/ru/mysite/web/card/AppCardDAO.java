package ru.mysite.web.card;


import ru.mysite.web.AppDAOGeneral;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppCardDAO extends AppDAOGeneral {

    public void create(ClientCard clientCard){
        String sql = "insert into client_card(card_id, make, model, year, vin) values (?,?,?,?,?)";
        Connection connection = getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, clientCard.getCard_id());
            statement.setString(2, clientCard.getMake());
            statement.setString(3, clientCard.getModel());
            statement.setString(4, clientCard.getYear());
            statement.setString(5, clientCard.getVin());
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }

    public List<ClientCard> selectAll(){
        List<ClientCard> clients = new ArrayList<ClientCard>();
        Connection connection = getConnection();
        String sql = "select * from client_card";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                clients.add(new ClientCard(result.getInt("id"),result.getInt("card_id"), result.getString("make"),
                        result.getString("model"), result.getString("year"), result.getString("vin")));
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
    public List<ClientCard> selectData(int id){
        List<ClientCard> clients = new ArrayList<ClientCard>();
        Connection connection = getConnection();
        String sql = "select * from client_card where card_id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                clients.add(new ClientCard(result.getInt("id"), result.getInt("card_id"), result.getString("make"),
                        result.getString("model"), result.getString("year"), result.getString("vin")));
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
        String sql = "delete from client_card where id=?";

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

    public ClientCard selectOneCard(int id){
        ClientCard app = null;
        String sql = "select * from client_card where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet set = statement.executeQuery();
            if(set.next()){
                id = set.getInt("id");
                int cardId = set.getInt("card_id");
                String make = set.getString("make");
                String model = set.getString("model");
                String year = set.getString("year");
                String vin = set.getString("vin");
                app = new ClientCard(id, cardId, make, model, year, vin);
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

    public ClientCard selectOne(int id){
        ClientCard app = null;
        String sql = "select * from client_card where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet set = statement.executeQuery();
            if(set.next()){
                id = set.getInt("id");
                int cardId = set.getInt("card_id");
                String make = set.getString("make");
                String model = set.getString("model");
                String year = set.getString("year");
                String vin = set.getString("vin");
                app = new ClientCard(id, cardId, make, model, year, vin);
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

    public void update(int id, ClientCard application){
        String sql = "update client_card set card_id=?, make=?, model=?, year=?, vin=? where id=?";

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, application.getCard_id());
            statement.setString(2, application.getMake());
            statement.setString(3, application.getModel());
            statement.setString(4, application.getYear() );
            statement.setString(5, application.getVin());
            statement.setInt(6, id);
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }
}
