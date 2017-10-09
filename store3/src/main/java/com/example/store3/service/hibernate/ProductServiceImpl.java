/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.store3.service.hibernate;

import com.example.store3.dao.ProductDao;
import com.example.store3.domain.Product;
import com.example.store3.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 *
 * @author NoName <NoName at example.com>
 */
@Service("productService")
@Repository
public class ProductServiceImpl implements ProductService {
    
    @Autowired 
    private ProductDao productDao;
    
    public Product findProductById(Long id) {
        return productDao.findProductById(id);
    }
    
    public List<Product> findAllProducts() {
        return productDao.findAllProducts();
    }
}
