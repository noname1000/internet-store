/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.store3.service;

import com.example.store3.domain.Product;
import java.util.List;

/**
 *
 * @author NoName <NoName at example.com>
 */
public interface ProductService {
    public Product findProductById(Long id);
    public List<Product> findAllProducts();
}
