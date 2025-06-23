package com.mp.ecommerce.catalog.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "product_variants", schema = "catalog")
public class ProductVariantEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String variantId;
    @NotBlank
    private String sku;
    @NotBlank
    private String name;
    @NotNull
    private BigDecimal priceAdjustment;
    @NotNull
    private BigDecimal weightAdjustment;
    private Boolean isActive;
    private LocalDateTime createdAt;
    private String createdBy;
    private LocalDateTime updatedAt;
    private String updatedBy;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private ProductEntity product;
    
    public ProductVariantEntity() {}
    
    public ProductVariantEntity(String sku, String name, BigDecimal priceAdjustment, BigDecimal weightAdjustment) {
        this.sku = sku;
        this.name = name;
        this.priceAdjustment = priceAdjustment;
        this.weightAdjustment = weightAdjustment;
        this.isActive = true;
        this.createdAt = LocalDateTime.now();
    }
    
    public String getVariantId() { return variantId; }
    public void setVariantId(String variantId) { this.variantId = variantId; }
    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public BigDecimal getPriceAdjustment() { return priceAdjustment; }
    public void setPriceAdjustment(BigDecimal priceAdjustment) { this.priceAdjustment = priceAdjustment; }
    public BigDecimal getWeightAdjustment() { return weightAdjustment; }
    public void setWeightAdjustment(BigDecimal weightAdjustment) { this.weightAdjustment = weightAdjustment; }
    public Boolean getIsActive() { return isActive; }
    public void setIsActive(Boolean isActive) { this.isActive = isActive; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    public String getUpdatedBy() { return updatedBy; }
    public void setUpdatedBy(String updatedBy) { this.updatedBy = updatedBy; }
    public String getAttribute1() { return attribute1; }
    public void setAttribute1(String attribute1) { this.attribute1 = attribute1; }
    public String getAttribute2() { return attribute2; }
    public void setAttribute2(String attribute2) { this.attribute2 = attribute2; }
    public String getAttribute3() { return attribute3; }
    public void setAttribute3(String attribute3) { this.attribute3 = attribute3; }
    public String getAttribute4() { return attribute4; }
    public void setAttribute4(String attribute4) { this.attribute4 = attribute4; }
    public String getAttribute5() { return attribute5; }
    public void setAttribute5(String attribute5) { this.attribute5 = attribute5; }
    public ProductEntity getProduct() { return product; }
    public void setProduct(ProductEntity product) { this.product = product; }
    
    // business method
    public BigDecimal getFinalPrice() {
        if (product != null && product.getPrice() != null) {
            return product.getPrice().add(priceAdjustment != null ? priceAdjustment : BigDecimal.ZERO);
        }
        return priceAdjustment != null ? priceAdjustment : BigDecimal.ZERO;
    }
    
    public BigDecimal getFinalWeight() {
        if (product != null && product.getWeight() != null) {
            return product.getWeight().add(weightAdjustment != null ? weightAdjustment : BigDecimal.ZERO);
        }
        return weightAdjustment != null ? weightAdjustment : BigDecimal.ZERO;
    }
} 