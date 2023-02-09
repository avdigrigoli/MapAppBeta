package com.victrix.victrix.models;

public class mhpModel {
    int id;
    String name;
    String address;
    String city;
    String state;
    double lat;
    double lon;
    String status;
    String property_info;
    String price_per_unit;
    String notes;
    String input_date;
    String units;
    String data_year;
    String avg_rent_per_unit;
    String total_revenue;
    String apartment_rent_revenue;
    String percent_of_apartment_rev;
    String operating_exp;
    String re_tax;
    String noi;
    String occ;
    String stable;
    String commercial;
    String margin;
    String sales_price;
    String sales_date;


    public mhpModel() {

    }
    public mhpModel(String name, String address, String city, String state, double lat, double lon)
    {
        this.name = name;
        this.address = address;
        this.city = city;
        this.state = state;
        this.lat = lat;
        this.lon = lon;
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public double getLat() {return lat;}

    public void setLat(double lat) {this.lat = lat;}

    public double getLon() {return lon;}

    public void setLon(double lon) {this.lon = lon;}

    public String getStatus() {return status;}

    public void setStatus(String status) {this.status = status;}

    public String getProperty_info() {return property_info;}

    public void setProperty_info(String property_info) {this.property_info = property_info;}

    public String getPrice_per_unit() {return price_per_unit;}

    public void setPrice_per_unit(String price_per_unit) {this.price_per_unit = price_per_unit;}

    public String getNotes() {return notes;}

    public void setNotes(String notes) {this.notes = notes;}

    public String getInput_date() {return input_date;}

    public void setInput_date(String input_date) {this.input_date = input_date;}

    public String getUnits() {return units;}

    public void setUnits(String units) {this.units = units;}

    public String getData_year() {return data_year;}

    public void setData_year(String data_year) {this.data_year = data_year;}

    public String getAvg_rent_per_unit() {return avg_rent_per_unit;}

    public void setAvg_rent_per_unit(String avg_rent_per_unit) {this.avg_rent_per_unit = avg_rent_per_unit;}

    public String getTotal_revenue() {return total_revenue;}

    public void setTotal_revenue(String total_revenue) {this.total_revenue = total_revenue;}

    public String getApartment_rent_revenue() {return apartment_rent_revenue;}

    public void setApartment_rent_revenue(String apartment_rent_revenue) {this.apartment_rent_revenue = apartment_rent_revenue;}

    public String getPercent_of_apartment_rev() {return percent_of_apartment_rev;}

    public void setPercent_of_apartment_rev(String percent_of_apartment_rev) {this.percent_of_apartment_rev = percent_of_apartment_rev;}

    public String getOperating_exp() {return operating_exp;}

    public void setOperating_exp(String operating_exp) {this.operating_exp = operating_exp;}

    public String getRe_tax() {return re_tax;}

    public void setRe_tax(String re_tax) {this.re_tax = re_tax;}

    public String getNoi() {return noi;}

    public void setNoi(String noi) {this.noi = noi;}

    public String getOcc() {return occ;}

    public void setOcc(String occ) {this.occ = occ;}

    public String getStable() {return stable;}

    public void setStable(String stable) {this.stable = stable;}

    public String getCommercial() {return commercial;}

    public void setCommercial(String commercial) {this.commercial = commercial;}

    public String getMargin() {return margin;}

    public void setMargin(String margin) {this.margin = margin;}

    public String getSales_price() {return sales_price;}

    public void setSales_price(String sales_price) {this.sales_price = sales_price;}

    public String getSales_date() {return sales_date;}

    public void setSales_date(String sales_date) {this.sales_date = sales_date;}

}
