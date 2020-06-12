-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 12, 2018 at 11:02 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recetas`
--
CREATE DATABASE IF NOT EXISTS `recetas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `recetas`;

-- --------------------------------------------------------

-- Concediendo permisos al usuario pcw con password pcw
GRANT ALL PRIVILEGES ON recetas.* to 'pcw'@127.0.0.1 identified by 'pcw';

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `texto` text NOT NULL,
  `autor` varchar(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comentario`
--

INSERT INTO `comentario` (`id`, `id_receta`, `titulo`, `texto`, `autor`, `fecha`) VALUES
(1, 1, 'Muy rica', 'La receta me parece muy sencilla y sana. Además, la sopa está buenísima.', 'usuario2', '2018-02-13 10:25:12'),
(2, 1, 'No es para tanto', 'Para mí es mucho trabajo para una sopa. La receta podía ser más sencilla.', 'usuario3', '2018-02-16 16:50:12'),
(3, 2, 'Muy buen sabor ', 'La tarta sabe bastante a zanahoria. A Mí me gusta, pero a quien no le guste los sabores fuertes ... no sé yo.', 'usuario3', '2018-03-02 14:23:02'),
(6, 3, 'Demasiado bueno!!', 'El bizcocho es demasiado bueno. Va muy bien para mojarlo en la leche.', 'usuario2', '2018-03-02 14:34:23'),
(7, 3, 'Mejorar el sabor', 'Yo le añadiría unas ralladuras de cáscara de naranja. Eso haría que estuviera mucho más bueno.', 'usuario3', '2018-03-02 14:34:23'),
(8, 4, 'Más tortitas', '¿Se puede doblar el número de tortitas doblando las cantidades de los ingredientes?', 'usuario3', '2018-03-02 16:25:22'),
(9, 4, 'Doblar la cantidad', 'No es necesario poner el doble de ingredientes. Sólo tienes que ir probando a aumentar la cantidad utilizada hasta que obtengas el número de tortitas que quieras.', 'usuario1', '2018-03-02 16:25:22'),
(10, 5, 'Sal y pimienta??', 'De verdad es necesario echarle las dos cosas??', 'usuario1', '2018-03-02 16:32:08'),
(11, 6, 'Bacalao bueno', 'El bacalao, bien hecho, está buenísimo y con esta receta se confirma.', 'usuario2', '2018-03-02 16:39:46'),
(12, 6, 'Buen momento para esta receta', 'La mejor época para consumir bacalao es de diciembre hasta abril o mayo, pero puede conseguirse sin problemas, tanto fresco como salado, durante todo el año. Para esta receta te proponemos utilizar morro, una de las partes más gruesas y más apreciadas a la hora de cocinar los platos tradicionales de nuestra gastronomía.', 'usuario1', '2018-03-02 16:39:46'),
(13, 7, 'Muy ricos', 'Los canelones es mejor que sean grandes.', 'usuario3', '2018-03-02 16:59:25'),
(14, 8, 'Energía pura', 'No hay mejor comida para combatir el frío del invierno.', 'usuario3', '2018-03-06 12:34:43'),
(15, 8, 'El hueso de rodilla', 'Pues eso, que yo no entiendo qué le aporta el hueso de rodilla', 'usuario3', '2018-03-06 12:36:37'),
(17, 7, 'Canelones de atún', '¿Se podría utilizar la misma receta, pero con atún?', 'usuario2', '2018-03-12 22:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
CREATE TABLE `foto` (
  `id` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `fichero` varchar(250) NOT NULL,
  `texto` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`id`, `id_receta`, `fichero`, `texto`) VALUES
(1, 1, '1.jpg', 'Aspecto de la sopa una vez terminada'),
(2, 1, '2.jpg', 'Se fríen las cebollas con mantequilla y aceite.'),
(3, 1, '3.png', 'Para la preparación final se añade rodajas de pan tostado.'),
(4, 2, '4.jpg', 'Aspecto de la tarta una vez finalizada'),
(5, 3, '5.jpg', 'El yogur queda esponjoso.'),
(6, 4, '6.jpg', 'Resultado: 4 tortitas buenísimas'),
(7, 5, '7.jpg', 'Plato de pasta muy nutritivo'),
(8, 6, '8.jpg', 'El emplatado también es importante'),
(9, 7, '9.jpg', 'Plato para una persona'),
(10, 8, '10.jpg', 'Todos los ingredientes juntos'),
(11, 8, '11.jpg', 'Aspecto del plato de sopa: en su punto.'),
(12, 8, '12.jpg', 'Los garbanzos a remojo');

-- --------------------------------------------------------

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
CREATE TABLE `ingrediente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `id_receta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingrediente`
--

INSERT INTO `ingrediente` (`id`, `nombre`, `id_receta`) VALUES
(1, '6 cebollas grandes y dulces', 1),
(2, '30 ml de aceite de oliva extra virgen (2 cucharadas)', 1),
(3, '60 g de mantequilla', 1),
(4, '1 diente de ajo', 1),
(5, '2 litros de caldo de carne', 1),
(6, '12 rebanadas de pan del tipo baguette', 1),
(7, '3 cucharadas de harina de trigo', 1),
(8, '1 cucharadita de azúcar', 1),
(9, 'Sal y pimienta negra recien molida (al gusto)', 1),
(10, '20 ml de brandy o coñac', 1),
(11, '100 g de queso rallado suave (tipo Gruyère)', 1),
(12, '2 tazas de harina', 2),
(13, '2 tazas de azúcar', 2),
(14, '2 cucharaditas de bicarbonato', 2),
(15, '2 cucharaditas de canela', 2),
(16, '1/2 cucharadita de sal', 2),
(17, '1 taza y media de aceite', 2),
(18, '4 huevos', 2),
(19, '3 tazas de zanahoria rallada cruda', 2),
(20, '1/2 taza de nuez picada y tostada al horno', 2),
(21, '1 yogur natural Danone', 3),
(22, '3 huevos(tamaño mediano)', 3),
(23, '3 medidas de yogur de harina', 3),
(24, '15 gramos de mantequilla', 3),
(25, '2 medidas de yogur de azúcar', 3),
(26, '1 sobre de devadura', 3),
(28, '1 medida de yogur de aceite de girasol', 3),
(29, '1 taza y media (180 g) de harina de trigo integral en lugar de harina normal ', 4),
(30, '1 cucharadita (4 g) de levadura en polvo', 4),
(31, 'Media cucharadita (2 g) de bicarbonato sódico', 4),
(32, '1 cucharadita de sal', 4),
(33, '1 taza y media (360 ml) de leche con bajo contenido en grasa (desnatada) o leche vegetal a base de arroz o soja', 4),
(34, '3 cucharadas (45 g) de aceite de girasol o margarina en vez de mantequilla', 4),
(35, '2 huevos', 4),
(36, 'Media cucharadita de extracto de vainilla', 4),
(37, '300 gramos de macarrones integrales', 5),
(38, 'Una cebolla pequeña rallada', 5),
(39, 'Unos tomates secos', 5),
(40, 'Piñones', 5),
(42, 'Un puñado de rúcula', 5),
(43, 'Queso rallado parmesano', 5),
(44, 'Aceite de oliva virgen', 5),
(45, 'Un poco de nata líquida', 5),
(46, 'Pimienta', 5),
(47, 'Sal', 5),
(48, 'Cebollino (opcional)', 5),
(49, '1 vaso\r\n\r\nde Caldo Casero de Pescado 100% Natural', 6),
(50, '1 cucharada de harina', 6),
(51, '3 dientes de ajo', 6),
(52, '4 tomates', 6),
(53, 'Sal', 6),
(54, '200 g. de morro de bacalao desalado ', 6),
(55, '1 pimiento verde', 6),
(56, 'Aceite de oliva', 6),
(57, 'Azúcar', 6),
(58, '18 canelones', 7),
(59, '300 gr. de lacón', 7),
(60, '200 gr. de grelos', 7),
(61, '100 ml. de caldo de cocción (o agua)', 7),
(62, '1 cebolla grande', 7),
(63, '1 tomate grande maduro', 7),
(64, '100 gr. de queso para gratinar', 7),
(65, 'Aceite de oliva virgen extra', 7),
(66, 'Sal y pimienta negra (al gusto)', 7),
(67, 'Para la bechamel: 500 ml. de leche entera', 7),
(68, '60 gr. de harina', 7),
(69, '80 gr. de mantequilla', 7),
(70, 'Nuez moscada y sal (al gusto)', 7),
(71, '1 puñado de garbanzos por cada comensal.', 8),
(72, 'Fideo mediano (al gusto). Yo pongo 1 puñado pequeño por persona.', 8),
(73, '2 puerros', 8),
(74, '1 nabo', 8),
(75, '3 zanahorias grandes', 8),
(76, '6 patatas medianas. (1 por personas)', 8),
(77, '1 calabacín', 8),
(78, '1 repollo y 3 dientes de ajo (para rehogar el repollo)', 8),
(79, '1/2 Kg de morcillo de ternera', 8),
(80, '1/4 Kg de costillas de cerdo', 8),
(81, '250 gr de tocino con beta fresco', 8),
(82, '1/4 de pollo (muslo y contra muslo)', 8),
(83, '1/2 pechuga de pollo', 8),
(84, '200 gr o 1 punta de jamón', 8),
(85, '1 hueso de jamón', 8),
(86, '1 hueso de caña', 8),
(87, '1 hueso de rodilla', 8),
(88, '150 gr de chorizo y 1 morcilla', 8),
(89, 'Aceite de oliva virgen extra y sal (al gusto)', 8);

-- --------------------------------------------------------

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `elaboracion` text NOT NULL,
  `comensales` tinyint(4) NOT NULL,
  `tiempo` tinyint(4) NOT NULL COMMENT 'Tiempo de elaboración de la receta',
  `dificultad` tinyint(4) NOT NULL COMMENT '0-baja; 1-media; 2-alta',
  `autor` varchar(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `positivos` int(11) NOT NULL,
  `negativos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receta`
--

INSERT INTO `receta` (`id`, `nombre`, `elaboracion`, `comensales`, `tiempo`, `dificultad`, `autor`, `fecha`, `positivos`, `negativos`) VALUES
(1, 'Sopa de cebolla. Receta tradicional francesa.', '1. En esta sopa debemos emplear cebollas dulces, las encontraremos en el mercado o cualquier supermercado. Podéis emplear otro tipo de cebolla pero el sabor no será igual de suave y meloso.\r\n2. Pelamos y cortamos en juliana (a lo largo y en finísimas rodajas) las cebollas dulces. Reservamos en un cuenco.\r\n3. Elegimos una cazuela grande, calentamos el aceite en el fondo de la cazuela. Añadimos la mantequilla, que es la verdadera base de esta sopa francesa.\r\n4. Cuando se haya derretido y mezclado con el aceite de oliva introducimos las cebollas y el ajo muy picadito. Añadimos también un poco de sal y pimienta negra. El efecto salado nos ayudará a que las cebollas suden y que se ablanden antes.\r\n5. Removemos con una cuchara de madera de manera envolvente hasta que la cebolla quede transparente o translúcida, no debe coger color.\r\n6. Este proceso es lento porque queremos tener la cebolla blandita sin que se queme. Con fuego muy suave tardaremos unos 20-25 minutos.\r\n7. Podéis tapar o no la cazuela durante la cocción aunque si la tapáis el agua que va soltando el sofrito quedará en la cazuela y evitará que la cebolla tome color tostado.', 6, 50, 0, 'usuario1', '2018-01-31 22:09:53', 23, 15),
(2, 'Tarta de zanahoria', '1) Para el pastel: Echar en un bol la harina, azúcar, bicarbonato, canela y sal. Agregar el aceite y batir bien. \r\n2) Después añadir los huevos de uno en uno batiendo bien y las zanahorias y batir 5 minutos. Finalmente, añadir las nueces. Dividir la mezcla en dos moldes redondos engrasados y enharinados. Hornear 45 minutos a 180 grados.\r\n3) Para la cobertura: Batir la mantequilla hasta que se quede cremosa, agregar el queso tibio y luego el azúcar y la vainilla. Batir hasta que quede una mezcla suave.\r\n4) Poner una capa de queso sobre un pastel y poner el otro pastel encima. Finalmente solo quedaría cubrir el pastel con el queso crema y espolvorear nuez picada. También puedes poner un poco de zanahoria rallada por encima.\r\n', 8, 75, 0, 'usuario2', '2018-03-02 14:17:18', 8, 0),
(3, 'Bizcocho de yogur al microondas', 'Además de los ingredientes, necesitarás un molde apto para microondas (recuerda que el microondas se puede estropear con materiales metálicos y tampoco es conveniente ponerle plásticos no aptos para ello). Puedes utilizar moldes de vidrio, de silicona o plásticos aptos para microondas. Si no tienes, puedes usar un bol de vidrio de ensalada.\r\n\r\nPara empezar, engrasa el molde con un poco de mantequilla. Prepara la masa de la forma habitual: bate huevos y azúcar, añade el yogur y el aceite, y, finalmente, la levadura y la harina. Vierte la masa en el molde.\r\n\r\nPrograma el microondas a media potencia (50-60%) durante unos 12 minutos. Te recomiendo este tiempo para comenzar porque cada microondas es diferente, siempre es mejor que tengas que añadir unos minutos más, y no pasarte con el tiempo. La primera vez que lo prepares comprueba pinchando con un palillo o con un cuchillo que la masa está seca por dentro. No te preocupes si la superficie te resulta un poco húmeda a la vista, interesa que no se sobrecueza para que no quede seco. Si el palillo sale arrastrando un poco de masa líquida, añade 1 minuto más y comprueba de nuevo.', 6, 35, 0, 'usuario1', '2018-03-02 14:25:35', 23, 4),
(4, 'Receta fácil de tortitas sanas y light', '1) Bate los ingredientes secos en un bol grande.\r\n2) Separa las yemas y las claras.\r\n3) En otro recipiente, mezcla los ingredientes húmedos, con excepción de las claras de huevo.\r\n4) Mezcla suavemente los ingredientes húmedos con los ingredientes secos, de forma rápida, sólo para humedecer la parte seca.\r\n5) Bate las claras de huevo, añádelas y mezcla, teniendo cuidado de no trabajar en exceso la masa.\r\n6) Cocina en una sartén caliente y sirve inmediatamente.\r\n', 2, 20, 0, 'usuario2', '2018-03-02 16:18:56', 5, 0),
(5, 'Pasta con tomates secos y piñones', 'Poner a cocer la pasta en abundante agua hirviendo. Mientras se cuece, poner en una sartén un poco de aceite de oliva a calentar, cuando esté en su punto añadir la cebolla rallada y sofreír. Poner los tomates secos muy picaditos y los piñones, y dorar ligeramente, regar con la nata, salpimentar y dar un hervor a todo junto para que se mezclen los sabores.\r\n\r\nUna vez cocida la pasta, escurrir y añadir a la salsa junto con la rúcula, mezclar bien para que la pasta se impregne de la salsa y servir rápidamente con queso rallado por encima y un poco de cebollino muy picado.', 4, 35, 1, 'usuario2', '2018-03-02 16:27:20', 19, 5),
(6, 'Bacalao con pimiento y tomate', 'Paso 1: Lamina los ajos, ponlos en una sartén con un chorro de aceite y sofríelos a fuego medio con cuidado para que no se quemen. Corta los pimientos a tiras y añádelos a los ajos cuando estos estén dorados.\r\n	\r\nPaso: Haz un corte en forma de cruz a los tomates y escáldalos en un cazo con agua hirviendo. Cuando el corte empiece a abrirse, sácalos del agua, pélalos, quítales las semillas y pícalos. Cuando el pimiento esté blando, añade el tomate, una pizca de azúcar, sal y el vaso de Caldo Casero de Pescado 100% Natural Gallina Blanca.\r\n\r\nPaso 3: Enharina el bacalao y fríelo por los dos lados en una sartén con bastante aceite. A continuación, añádelo a la salsa de tomate y pimientos. Deja cocinar todo el conjunto durante 20 minutos a fuego lento. Ya puedes servir el bacalao con tomate y pimiento.\r\n\r\n', 4, 60, 1, 'usuario1', '2018-03-02 16:35:32', 23, 9),
(7, 'Canelones de lacón con grelos', '1) Comenzamos por preparar las partes sobrantes, que formarán el relleno. Troceamos  (a cuchillo) los restos del Lacón, y reservamos.\r\n2) Picamos la cebolla en ‘brunoise’ pequeña. Lavamos el tomate, y los cortamos en pequeños dados. En una sartén con una lámina de aceite de oliva, echamos primero la cebolla y sofreímos 2/3 min. A continuación el tomate y continuamos cocinando otros 5 min.\r\n3) Es el turno del lacón. Lo añadimos al resto, removemos y seguimos a fuego medio otros 5/6 minutos.\r\n4) La carne irá soltando parte de su grasa. Vertemos el caldo, y dejamos que reduzca. De esta manera nuestro relleno tendrá un intenso sabor.\r\n5) Hemos dejado los grelos para el final, ya que no necesiten mucho más de preparación.\r\n6) Los troceamos un poco, añadimos a la sartén y mezclamos. Una vez terminado, vamos a dejarlo enfriar para cuando llegue el momento de rellenar los canelones.\r\n7) En esta receta lo mejor es hacer una bechamel ligera, que podréis preparar fácilmente siguiendo las indicaciones que ya tenemos en el blog.\r\n8) Vuelvo a insistir, que en recetas de canelones y lasaña, el relleno siempre va antes que la pasta. Para la pasta, lo más cómoda es comprar placas de canelones para cocer o incluso unas que ya vienen precocinadas.\r\n9) Si compráis de las primeras, debéis cocer la pasta en abundante agua (1 litro por cada 80 gr.). Cuando comience a hervir, añadimos un puñado generoso de sal y seguidamente los canelones en 2 tandas (mitad y mitad). Así se cocinarán mejor y no se pegarán.\r\n10) Respetad los tiempos de cocción que marca el fabricante.\r\n11) Una vez cocidos, los retiramos, escurrimos y reservamos sobre un paño seco, para que se enfríen.\r\n12) Con la segunda opción, usando pasta precocinada, basta con seguir las instrucciones del fabricante.\r\n13) Por lo general hay que sumergirlos en agua bien caliente durante unos 20 minutos. Es importante que los remováis de vez en cuando,  para evitar que se peguen.\r\n14) Con el relleno y la pasta fríos, procedemos a rellenarla y montar el plato.\r\n15) Con el relleno y la pasta fríos, procedemos a rellenarla y montar el plato.\r\n16) Escogemos una fuente para horno, con un poco de altura, que nos quepan dos pisos de canelones.\r\n17) Primero, extendemos una fina capa de bechamel en la base. Colocamos los canelones, de manera que dejemos algo de espacio entre ellos.\r\n18) Ponemos a precalentar el horno: 10 minutos, a 200ºC.\r\n19) Terminada la primera tanda, vertemos por encima de los canelones una capa de bechamel,  cubriendo por completo. Esparcimos algo de queso para gratinar en la parte superior. Repetimos el proceso con la segunda tanda de canelones. Terminamos con bechamel y esta vez con abundante queso para gratinar.\r\n20) Horneamos en dos tiempos. Primero 15 minutos a 200ºC, y después 5 minutos más con la función gratinado activada, para que se dore y gratine el queso.\r\n21) De todas maneras controlad la potencia de vuestro horno, no se vaya a quemar demasiado.\r\n22) Retiramos la bandeja del horno y dejamos reposar. El plato sale muy caliente, así que lo aconsejable es que durante unos 5 minutos lo dejemos que se asiente y coja consistencia. Así también podremos cortar las raciones sin miedo a que se desmoronen los canelones.', 6, 90, 1, 'usuario3', '2018-03-02 16:50:25', 16, 2),
(8, 'Cocido madrileño', '1) La noche de antes ponemos los garbanzos en remojo con un puñado de sal gorda y agua templada.<br>2) Con respecto a la temperatura del agua, tradicionalmente se dice que los garbanzos deben de entrar en contacto con el agua.<br>3) Cubrimos de agua templada y los dejamos a temperatura ambiente, jamás en la nevera. Al día siguiente colamos los garbanzos y reservamos.<br>4) En la olla express metemos el calabacín (lavado y sin pelar), el nabo pelado y los puerros lavados y en trozos. Añadimos también la carne y los huesos. En unas bolsas de rejilla, añadimos los garbanzos.<br>5) Podéis comprar estas bolsitas en cualquier ferretería. Recogerlos en una malla de cocción, es por presentación, limpieza y comodidad. Así no se esconden huesecillos entre los mismos, ni se estropean al recogerlos. Introducimos las bolsas con los garbanzos bien cerradas en la olla.<br>6) Vertemos agua en la olla hasta cubrir todos los ingredientes. Tapamos la olla y la ponemos a potencia máxima hasta que empieza a hervir, momento en el que lo bajamos a temperatura media.<br>7) Pelamos las zanahorias y las patatas. Reservamos.<br>8) Pasada una hora de haber arrancado la olla express a hervir, la retiramos del fuego. Cuando podamos abrirla, añadimos las zanahorias. Volvemos a cerrar la olla y la ponemos a cocer de nuevo.<br>9) Preparamos el repollo. Deshojamos el repollo y lo lavamos. Lo ponemos a cocer en una cacerola con agua y un poco de sal. Lo dejamos cocer 1 hora a fuego medio/alto.<br>10) Una vez cocido lo colamos. En una sartén añadimos un chorrito de aceite de oliva y picamos los dientes de ajo. Dejamos que se doren e incorporamos el repollo para rehogarlo todo junto durante 15 minutos aproximadamente, a fuego lento. Una vez listo, añadimos un poco de sal al gusto.<br>11) Yo nunca cocino el repollo con el resto de ingredientes. No me gusta que esta verdura se haga la protagonista del sabor de la receta.<br>12) Tal y como os indico en el paso a paso, el repollo lo cuezo y lo rehogo por separado. Si el repollo no es de vuestro agrado, podéis sustituir este ingrediente por unas judías verdes que, cocidas y rehogadas con su ajito, son una combinación perfecta para acompañar este espectacular plato.<br>13) Después de haber agregado las zanahorias y pasado 5 minutos de cocción retiramos la olla expres y cuando podamos la abrimos para añadir la patata que cocerá 12 minutos más con el resto de ingredientes. Lo justo para que queden en su punto.<br>14) Si al abrir, el caldo está muy concentrado (muy rojo por el pimentón que suelta el chorizo), podéis retirar y guardar un poco y añadir algo de agua a la olla. El caldo que retiréis, luego lo volvéis a añadir a la sopa.', 6, 120, 1, 'usuario2', '2018-03-02 17:03:59', 49, 11);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `login` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fnac` date DEFAULT NULL COMMENT 'Fecha de nacimiento',
  `clave` varchar(36) NOT NULL,
  `ultimo_acceso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`login`, `nombre`, `pwd`, `email`, `fnac`, `clave`, `ultimo_acceso`) VALUES
('usuario1', 'Usuario 1', 'usuario1', 'usuario1@pcw.es', '2017-12-13', '6fa9715cee9d8f4a53ae7ec598b01e04', '2018-03-12 20:18:13'),
('usuario2', 'Usuario 2', 'usuario2', 'usuario2@pcw.es', '2018-01-01', '42b308e0d1c3da37c0d704d8505eb9cf', '2018-03-12 22:00:10'),
('usuario3', 'Usuario 3', 'usuario3', 'usuario3@pcw.es', '2017-09-19', 'f8549fae2ed909d09d47c16ce09c4d20', '2018-03-11 15:40:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_receta` (`id_receta`),
  ADD KEY `login` (`autor`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_receta` (`id_receta`);

--
-- Indexes for table `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_receta` (`id_receta`);

--
-- Indexes for table `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`autor`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`autor`) REFERENCES `usuario` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD CONSTRAINT `ingrediente_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `usuario` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
