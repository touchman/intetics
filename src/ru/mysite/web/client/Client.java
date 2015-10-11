package ru.mysite.web.client;



public class Client {
    private int id;
    private int card_id;
    private String firstName;
    private String lastName;
    private String date;
    private String address;
    private String phone;
    private String email;

    public Client() {
        super();
    }

    public Client(int id, int card_id, String firstName, String lastName, String date, String address, String phone, String email) {
        this.id = id;
        this.card_id = card_id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.date = date;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public Client(int card_id, String firstName, String lastName, String date, String address, String phone, String email) {
        this.card_id = card_id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.date = date;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public int getCard_id() {
        return card_id;
    }

    public void setCard_id(int card_id) {
        this.card_id = card_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
