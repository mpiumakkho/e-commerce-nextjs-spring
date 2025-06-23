package com.mp.ecommerce.inventory.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mp.ecommerce.inventory.entity.StockMovementEntity;

@Repository
public interface StockMovementRepository extends JpaRepository<StockMovementEntity, String> {

} 