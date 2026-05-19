package com.farmacia.controller;

import com.farmacia.model.Producto;
import com.farmacia.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/empleado")
public class EmpleadoController {

    @Autowired
    private ProductoService productoService;

    // Dashboard con lista de productos
    @GetMapping("/dashboard")
    public String dashboard(Model model, Authentication auth) {
        model.addAttribute("usuario", auth.getName());
        model.addAttribute("productos", productoService.listarTodos());
        return "empleado/dashboard";
    }

    // Formulario nuevo producto
    @GetMapping("/producto/nuevo")
    public String nuevoProducto(Model model) {
        model.addAttribute("producto", new Producto());
        model.addAttribute("accion", "Crear");
        return "empleado/formulario-producto";
    }

    // Guardar nuevo producto
    @PostMapping("/producto/guardar")
    public String guardarProducto(@ModelAttribute Producto producto) {
        productoService.guardar(producto);
        return "redirect:/empleado/dashboard";
    }

    // Formulario editar producto
    @GetMapping("/producto/editar/{id}")
    public String editarProducto(@PathVariable Long id, Model model) {
        Producto producto = productoService.buscarPorId(id)
            .orElseThrow(() -> new RuntimeException("Producto no encontrado"));
        model.addAttribute("producto", producto);
        model.addAttribute("accion", "Editar");
        return "empleado/formulario-producto";
    }

    // Eliminar producto
    @GetMapping("/producto/eliminar/{id}")
    public String eliminarProducto(@PathVariable Long id) {
        productoService.eliminar(id);
        return "redirect:/empleado/dashboard";
    }

    // Buscar producto
    @GetMapping("/producto/buscar")
    public String buscarProducto(@RequestParam String nombre, Model model, Authentication auth) {
        model.addAttribute("usuario", auth.getName());
        model.addAttribute("productos", productoService.buscarPorNombre(nombre));
        model.addAttribute("busqueda", nombre);
        return "empleado/dashboard";
    }
}