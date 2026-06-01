-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2026 a las 15:22:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia_stock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` bigint(20) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `id_pedido` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `cantidad`, `nombre_producto`, `precio_unitario`, `subtotal`, `id_pedido`) VALUES
(1, 1, 'Buscapina Fem', 10000, 10000, 1),
(2, 1, 'Bloqueador Solar SPF 60 x 60g Dermabelll', 45000, 45000, 1),
(3, 1, 'Ibuprofeno 400mg', 3200, 3200, 2),
(4, 1, 'Vitamina C 1000mg', 8900, 8900, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` bigint(20) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fecha_pedido` datetime(6) DEFAULT NULL,
  `gestionado_por` varchar(255) DEFAULT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL,
  `motivo_cancelacion` text DEFAULT NULL,
  `notas` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `direccion`, `estado`, `fecha_pedido`, `gestionado_por`, `metodo_pago`, `motivo_cancelacion`, `notas`, `telefono`, `total`, `id_usuario`) VALUES
(1, 'calle 15 #56-18 barrio el poblado', 'PENDIENTE', '2026-06-01 02:45:43.000000', NULL, 'NEQUI', NULL, '', '3154829753', 55000, 13),
(2, 'calle 15 #56-18 barrio el poblado', 'ENTREGADO', '2026-06-01 13:05:59.000000', 'Alejandra', 'TARJETA', NULL, '', '3156516516', 12100, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `categoria` varchar(255) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `categoria`, `imagen_url`) VALUES
(2, 'Vitamina C 1000mg', 'Suplemento vitamina C', 8900, 50, 'Vitamina', 'https://locatelcolombia.vtexassets.com/arquivos/ids/335611/7702057700409_1_Vita-C-Mk-1G--Sabor-Naranja-Tubo-X-10-Tabletas-Efervescentes.jpg?v=638155673842130000'),
(3, 'Ibuprofeno 400mg', 'Antiinflamatorio', 3200, 75, 'Medicamento', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_B8pRrfuJ8rCwtIec07KNtcyDkhn1GAFV3A&s'),
(5, 'Acetaminofen 500mg', 'es un analgésico y antipirético de venta libre. Se utiliza principalmente para aliviar dolores leves a moderados (dolor de cabeza, muscular, dental) y para reducir la fiebre.', 2000, 50, 'Medicamento', 'https://habibdroguerias.vtexassets.com/arquivos/ids/159819/100022514_1.jpg?v=638459696454270000'),
(6, 'Omega 3 1000 mg', 'es un ácido grasos esencial que tu cuerpo no puede producir y debe obtener mediante la dieta. Es fundamental para la salud cardiovascular, la función cerebral y el control de la inflamación.', 50000, 25, 'Suplemento', 'https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt01601/y/24.jpg'),
(7, 'Buscapina Fem', 'medicamento analgésico y antiespasmódico diseñado específicamente para el alivio de los dolores y cólicos menstruales', 10000, 30, 'Medicamento', 'https://copservir.vtexassets.com/arquivos/ids/1884310/BUSCAPINA-FEM-DOBLE-ACCION_F.png?v=639108997050770000'),
(8, 'Bloqueador Solar SPF 60 x 60g Dermabelll', 'son fórmulas fotoestables de nivel profesional diseñadas con triple acción: absorción, reflexión y dispersión de la radiación UV-A y UV-B.', 45000, 28, 'Cuidado personal', 'https://static.wixstatic.com/media/a560f4_41bf311b8ef841fe999a24da6692fc4b~mv2.png/v1/fill/w_560,h_560,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/a560f4_41bf311b8ef841fe999a24da6692fc4b~mv2.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `usuario`, `rol`, `contrasena`) VALUES
(7, 'Juan Vega', 'Juanve', 'EMPLEADO', 'admin123'),
(10, 'Admin Principal', 'ADMINISTRADOR', 'ADMINISTRADOR', 'admin123'),
(12, 'Alejandra Diaz', 'Alejandra', 'EMPLEADO', 'ApoloHidalgo'),
(13, 'Mariana Vargas', 'mariana12', 'CLIENTE', 'mariana123'),
(14, 'Lizeth Blanco', 'Lizeth23', 'CLIENTE', 'Lizeth65');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `FKq3rb2epiiobwcybsy6p15400a` (`id_producto`),
  ADD KEY `FKkg5h8ejijsgwfr68aoggh4l8m` (`id_usuario`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `FKh10qteor08f4cbxhsf97qtgyk` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `FK4a0lfwlpmytywxpwjfa1a3ar2` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `FKkg5h8ejijsgwfr68aoggh4l8m` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `FKq3rb2epiiobwcybsy6p15400a` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `FKh10qteor08f4cbxhsf97qtgyk` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK4a0lfwlpmytywxpwjfa1a3ar2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
