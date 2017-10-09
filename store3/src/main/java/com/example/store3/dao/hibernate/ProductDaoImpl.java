/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.store3.dao.hibernate;

import com.example.store3.dao.ProductDao;
import com.example.store3.domain.Product;
import java.util.List;
import javax.annotation.Resource;
import javax.websocket.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author NoName <NoName at example.com>
 */
@Repository("productDao")
@Transactional
public class ProductDaoImpl implements ProductDao {
    private SessionFactory sessionFactory;
    private Session session;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }
    
    @Transactional(readOnly = true)
    @Override
    public Product findProductById(Long id) {
        return (Product) sessionFactory.getCurrentSession().getNamedQuery("Product.findProductByIfd").
                setParameter("id", id).uniqueResult();
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<Product> findAllProducts() {
        return sessionFactory.getCurrentSession().getNamedQuery("Product.findAllProduct").list();
    }
}
