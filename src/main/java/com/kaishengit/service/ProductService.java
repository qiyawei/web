package com.kaishengit.service;

import com.kaishengit.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService {

    public List<Product> findAll(){
        List<Product> list = new ArrayList<Product>();
        Product product1 = new Product();
        product1.setId(110);
        product1.setNum(24);
        product1.setPrice(98F);
        product1.setProductName("计算机");
        Product product2 = new Product();
        product2.setId(120);
        product2.setNum(43);
        product2.setPrice(132F);
        product2.setProductName("显示器");
        Product product3= new Product();
        product3.setId(130);
        product3.setNum(15);
        product3.setPrice(985F);
        product3.setProductName("鼠标");
        list.add(product1);
        list.add(product2);
        list.add(product3);
        return list;
    }

}
