package com.farmacia.model;

import jakarta.persistence.*;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idUsuario;

    private String nombre;

    @SuppressWarnings({ "unused" })
	@Column(unique = true)
    private String usuario;

    @Column(name = "contrasena")
    private String contrasena;

    private String rol;

    // Getters
    @SuppressWarnings("unused")
	public Long getIdUsuario() { return idUsuario; }
    public String getNombre()  { return nombre; }
    public String getUsuario() { return usuario; }
    public String getContrasena() { return contrasena; }
    public String getRol()     { return rol; }

    // Setters
    public void setIdUsuario(Long idUsuario) { this.idUsuario = idUsuario; }
    public void setNombre(String nombre)     { this.nombre = nombre; }
    public void setUsuario(String usuario)   { this.usuario = usuario; }
    public void setContrasena(String contrasena) { this.contrasena = contrasena; }
    public void setRol(String rol)           { this.rol = rol; }
}