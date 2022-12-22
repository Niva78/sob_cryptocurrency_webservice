package cat.urv.deim.sob.model;

import java.util.Date;

public class Purchase {
    private int id;
    private double purchasedAmount;
    private Date date;
    private Cryptocurrency cryptocurrency;
    private Customer customer;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPurchasedAmount() {
        return this.purchasedAmount;
    }

    public void setPurchasedAmount(double purchasedAmount) {
        this.purchasedAmount = purchasedAmount;
    }

    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Cryptocurrency getCryptocurrency() {
        return this.cryptocurrency;
    }

    public void setCryptocurrency(Cryptocurrency cryptocurrency) {
        this.cryptocurrency = cryptocurrency;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    
}
