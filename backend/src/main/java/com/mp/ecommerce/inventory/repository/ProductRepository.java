package com.mp.ecommerce.inventory.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mp.ecommerce.inventory.entity.ProductEntity;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, String> {
    
    List<ProductEntity> findByCategoryId(String categoryId);
    
    List<ProductEntity> findByIsActiveTrue();
    
    @Query("SELECT p FROM ProductEntity p WHERE p.isActive = true AND " +
           "(LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(p.description) LIKE LOWER(CONCAT('%', :keyword, '%')))")
    List<ProductEntity> searchActiveProducts(@Param("keyword") String keyword);
    
    boolean existsByName(String name);
} 