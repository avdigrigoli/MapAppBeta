package com.victrix.victrix.daos;
import com.victrix.victrix.models.mhpModel;
import com.victrix.victrix.Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class mhpDao {

    public List<mhpModel> getAllProps() {
        List<mhpModel> book = new ArrayList<>();
        try {
            Connection con = Utils.getConnection();
            String query = "select * from victrix.mhcportfolio";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                mhpModel row = new mhpModel();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setStatus(rs.getString("status"));
                row.setProperty_info(rs.getString("property_info"));
                row.setPrice_per_unit(rs.getString("price_per_unit"));
                row.setNotes(rs.getString("notes"));
                row.setAddress(rs.getString("address"));
                row.setInput_date(rs.getString("input_date"));
                row.setCity(rs.getString("city"));
                row.setState(rs.getString("state"));
                row.setUnits(rs.getString("units"));
                row.setData_year(rs.getString("data_year"));
                row.setAvg_rent_per_unit(rs.getString("avg_rent_per_unit"));
                row.setTotal_revenue(rs.getString("total_revenue"));
                row.setApartment_rent_revenue(rs.getString("apartment_rent_revenue"));
                row.setPercent_of_apartment_rev(rs.getString("percent_of_apt_rev"));
                row.setOperating_exp(rs.getString("operating_exp"));
                row.setRe_tax(rs.getString("re_tax"));
                row.setNoi(rs.getString("noi"));
                row.setOcc(rs.getString("occ"));
                row.setStable(rs.getString("stable"));
                row.setCommercial(rs.getString("commercial"));
                row.setMargin(rs.getString("margin"));
                row.setSales_price(rs.getString("sales_price"));
                row.setSales_date(rs.getString("sales_date"));
                row.setLat(rs.getDouble("latitude"));
                row.setLon(rs.getDouble("longitude"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

    private static final String INSERT_SQL = "insert into victrix.mhcportfolio(name,address," +
            "city, state) values(?,?,?,?)";

    public static void addProperty(String name, String address, String city, String state)
    {
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(INSERT_SQL)){
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, address);
            preparedStatement.setString(3, city);
            preparedStatement.setString(4, state);
            preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
