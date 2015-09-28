package ru.mysite.web;


public class Orders {
    private int order_id;
    private int id;
    private String date;
    private int amount;
    private String status;

    public Orders() {
        super();
    }

    public Orders(int id,int order_id, String date, int amount, String status) {
        this.id = id;
        this.order_id = order_id;
        this.date = date;
        this.amount = amount;
        this.status = status;
    }

    public Orders(int order_id,String date, int amount, String status) {
        this.date = date;
        this.order_id = order_id;
        this.amount = amount;
        this.status = status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAmount() {
        return amount;
    }

    public String getDate() {
        return date;
    }

    public int getId() {
        return id;
    }
}
