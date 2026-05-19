package com.farmacia.model;

import jakarta.persistence.*;

@Entity
@Table(name = "productos")
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProducto;

    private String nombre;

    @Column(columnDefinition = "TEXT")
    private String descripcion;

    private Double precio;
    private Integer stock;
    private String categoria;
    private String imagenUrl;

    // Getters
    public Long getIdProducto()    { return idProducto; }
    public String getNombre()      { return nombre; }
    public String getDescripcion() { return descripcion; }
    public Double getPrecio()      { return precio; }
    public Integer getStock()      { return stock; }
    public String getCategoria()   { return categoria; }
    public String getImagenUrl()   { return imagenUrl; }

    // Setters
    public void setIdProducto(Long idProducto)    { this.idProducto = idProducto; }
    public void setNombre(String nombre)          { this.nombre = nombre; }
    public void setDescripcion(String descripcion){ this.descripcion = descripcion; }
    public void setPrecio(Double precio)          { this.precio = precio; }
    public void setStock(Integer stock)           { this.stock = stock; }
    public void setCategoria(String categoria)    { this.categoria = categoria; }
    public void setImagenUrl(String imagenUrl)    { this.imagenUrl = imagenUrl; }
}