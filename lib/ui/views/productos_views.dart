import 'package:flutter/material.dart';

class ProductosView extends StatelessWidget {
  const ProductosView({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulada con los datos de tu catálogo
    final List<Map<String, dynamic>> productos = [
      {
        'nombre': 'PLAYERA MANGA CORTA NEGRA DISEÑO LUNALIFT',
        'precio': 850.00,
        'imagen': 'assets/playerlift1.jpg',
      },
      {
        'nombre': 'PLAYERA MANGA CORTA GRIS DISEÑO GTR',
        'precio': 550.00,
        'imagen': 'assets/playera_gtr.jpg',
      },
      {
        'nombre': 'PLAYERA MANGA CORTA GRIS DISEÑO ZEUS',
        'precio': 450.00,
        'imagen': 'assets/playera_zeus.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(
        0xFF071A35,
      ), // Fondo oscuro base del proyecto
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ==========================================
            // ENCABEZADO (Títulos)
            // ==========================================
            const Text(
              'CATÁLOGO',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'EQUIPAMIENTO DE ELITE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // ==========================================
            // BARRA DE BÚSQUEDA
            // ==========================================
            Container(
              width: 800, // Limita el ancho máximo en pantallas web
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Buscar prenda (Ej: Hoodie, Shorts...)',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.black12,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),

            // ==========================================
            // REJILLA DE PRODUCTOS (GridView)
            // ==========================================
            GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // El scroll lo maneja el SingleChildScrollView externo
              itemCount: productos.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350, // Ancho máximo de cada tarjeta
                mainAxisSpacing: 24, // Espacio vertical entre tarjetas
                crossAxisSpacing: 24, // Espacio horizontal entre tarjetas
                mainAxisExtent:
                    460, // Altura fija optimizada para incluir el botón
              ),
              itemBuilder: (context, index) {
                final prod = productos[index];
                return TarjetaProducto(
                  nombre: prod['nombre'],
                  precio: prod['precio'],
                  imagen: prod['imagen'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// COMPONENTE: TARJETA DE PRODUCTO
// ==========================================
class TarjetaProducto extends StatelessWidget {
  final String nombre;
  final double precio;
  final String imagen;

  const TarjetaProducto({
    super.key,
    required this.nombre,
    required this.precio,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0C1F3D), // Color oscuro de la tarjeta
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Contenedor de la Imagen
          Expanded(
            flex: 5, // Proporción asignada a la foto
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  imagen,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 2. Información del Producto e Interacción
          Expanded(
            flex:
                4, // Proporción asignada al bloque inferior (Texto, Precio, Botón)
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Título del artículo
                  Text(
                    nombre,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Precio formalizado
                  Text(
                    '\$${precio.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // 3. Botón para enviar a la sección del Carrito
                  SizedBox(
                    width: double
                        .infinity, // Forzar expansión horizontal completa dentro del padding
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implementar el manejador de estado global para persistir la selección al carrito
                        print('Producto enviado al flujo del carrito: $nombre');
                      },
                      icon: const Icon(Icons.add_shopping_cart, size: 18),
                      label: const Text('Agregar'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
