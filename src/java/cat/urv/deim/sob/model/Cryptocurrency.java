package cat.urv.deim.sob.model;

import java.util.Date;

public class Cryptocurrency {
    private int id;
    
    private String description;

    private String name;

    private double price;
    
    private Date priceTimestamp;
    
    public Cryptocurrency(){
    }
    
    public Cryptocurrency(String description, String name, double price, Date priceTimestamp){
        this.description = description;
        this.name = name;
        this.price = price;
        this.priceTimestamp = priceTimestamp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getPriceTimestamp() {
        return priceTimestamp;
    }

    public void setPriceTimestamp(Date priceTimestamp) {
        this.priceTimestamp = priceTimestamp;
    }
}
