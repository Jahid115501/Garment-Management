package com.mycompany.garmentmanagement;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

class Garment {
    private String id;
    private String name;
    private String description;
    private String size;
    private String color;
    private double price;
    private int stockQuantity;
    private Fabric fabric; 

    public Garment(String id, String name, String description, String size, String color, double price, int stockQuantity, Fabric fabric) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.size = size;
        this.color = color;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.fabric = fabric;
    }

    public void updateStock(int quantity) {
        this.stockQuantity += quantity;
    }

    public double calculateDiscountPrice(double discountPercentage) {
        return price - (price * discountPercentage / 100);
    }

    @Override
    public String toString() {
        return "Garment [ID=" + id + ", Name=" + name + ", Size=" + size + ", Color=" + color + ", Price=" + price +
                ", Stock=" + stockQuantity + ", Fabric=" + fabric.getType() + "]";
    }
}