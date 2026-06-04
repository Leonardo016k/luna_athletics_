import 'package:flutter/material.dart';

class ProductosView extends StatelessWidget {
  const ProductosView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> productos = [
      {
        'nombre': 'PLAYERA MANGA CORTA NEGRA DISEÑO LUNALIFT',
        'precio': 850.00,
        'imagen': 'assets/playerlift1.jpg',
      },
      {
        'nombre': 'PLAYERA MANGA CORTA GRIS DISEÑO GTR',
        'precio': 550.00,
        'imagen': 'assets/gtr.jpg',
      },
      {
        'nombre': 'PLAYERA MANGA CORTA GRIS DISEÑO ZEUS',
        'precio': 450.00,
        'imagen': 'assets/zeus.png',
      },
      {
        'nombre': 'TANK TOP "OVERSIZE"',
        'precio': 380.00,
        'imagen': 'assets/lunalift1.jpg',
      },
      {
        'nombre': 'JOGGERS "ARTIC FLOW"',
        'precio': 700.00,
        'imagen': 'assets/pants.jpg',
      },
      {
        'nombre': 'SHORTS "URBAN SHAOS"',
        'precio': 250.00,
        'imagen': 'assets/shorts.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CATÁLOGO',
                  style: TextStyle(
                    color: Colors.redAccent.shade700,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'EQUIPAMIENTO DE ELITE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  width: 600,
                  child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      hintText: 'Buscar prenda (Ej: Hoodie, Shorts...)',
                      hintStyle: const TextStyle(
                        color: Colors.white38,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search_sharp,
                        color: Colors.white54,
                        size: 20,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF111113),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.05),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.redAccent.shade700,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productos.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 320,
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 24,
                    mainAxisExtent: 460,
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
        ),
      ),
    );
  }
}

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
        color: const Color(0xFF111113),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Container(
                color: const Color(0xFF161619),
                child: Image.asset(
                  imagen,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.fitness_center_sharp,
                    size: 48,
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      height: 1.3,
                    ),
                  ),
                  Text(
                    '\$${precio.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.redAccent.shade100,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print('Producto enviado al flujo del carrito: $nombre');
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart_sharp,
                        size: 16,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'AGREGAR',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.shade700,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
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
