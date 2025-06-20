package com.mp.ecommerce.inventory.service;

import java.util.List;
import java.util.Optional;

import com.mp.ecommerce.inventory.dto.ProductDTO;
import com.mp.ecommerce.inventory.entity.ProductEntity;

public interface ProductService {
    
    List<ProductEntity> getAllProducts();
    
    Optional<ProductEntity> getProductById(String id);
    
    List<ProductEntity> getProductsByCategory(String categoryId);
    
    ProductEntity createProduct(ProductDTO productDTO);
    
    ProductEntity updateProduct(String id, ProductDTO productDTO);
    
    void deleteProduct(String id);
    
    List<ProductEntity> searchProducts(String keyword);
    
    ProductDTO convertToDTO(ProductEntity product);
    
    ProductEntity convertToEntity(ProductDTO productDTO);
} 