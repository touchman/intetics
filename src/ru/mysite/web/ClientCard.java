package ru.mysite.web;


public class ClientCard {
    private int id = -1;
    private int card_id;
    private int order_id;
    private String make;
    private String model;
    private String year;
    private String vin;

    public ClientCard() {
        super();
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public ClientCard(int id, int card_id, int order_id, String make, String model, String year,String vin ) {
        this.id = id;
        this.vin = vin;
        this.order_id = order_id;
        this.make = make;
        this.model = model;
        this.year = year;
        this.card_id = card_id;
    }

    public ClientCard(int card_id, int order_id ,String make, String model, String year, String vin) {
        this.order_id = order_id;
        this.make = make;
        this.model = model;
        this.year = year;
        this.vin = vin;
        this.card_id = card_id;
    }

    public int getCard_id() {
        return card_id;
    }

    public void setCard_id(int card_id) {
        this.card_id = card_id;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
