import 'package:flutter/material.dart';

class CarritoView extends StatelessWidget {
  const CarritoView({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de productos que simulamos que el usuario ya agregó al carrito
    final List<Map<String, dynamic>> itemsCarrito = [
      {
        'nombre': 'PLAYERA MANGA CORTA GRIS DISEÑO GTR',
        'precio': 550.00,
        'cantidad': 1,
        'imagen': 'assets/playera_gtr.jpg',
      },
      {
        'nombre': 'PLAYERA MANGA CORTA GRIS DISEÑO ZEUS',
        'precio': 450.00,
        'cantidad': 2,
        'imagen': 'assets/playera_zeus.jpg',
      },
    ];

    // Cálculos rápidos para el resumen
    double subtotal = 0;
    for (var item in itemsCarrito) {
      subtotal += (item['precio'] * item['cantidad']);
    }
    double envio = 150.00;
    double total = subtotal + envio;

    return Scaffold(
      backgroundColor: const Color(
        0xFF071A35,
      ), // El fondo azul oscuro de la app
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la sección
            const Text(
              'TU CARRITO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Diseño adaptable: Si la pantalla es ancha (Web/PC), usa dos columnas.
            // Si es chica, las encadena hacia abajo.
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  // Vista Web / Desktop (Dos columnas)
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _ListaProductosCarrito(items: itemsCarrito),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 1,
                        child: _ResumenCompra(
                          subtotal: subtotal,
                          envio: envio,
                          total: total,
                        ),
                      ),
                    ],
                  );
                } else {
                  // Vista Móvil o pantalla muy estrecha (Una columna sobre otra)
                  return Column(
                    children: [
                      _ListaProductosCarrito(items: itemsCarrito),
                      const SizedBox(height: 24),
                      _ResumenCompra(
                        subtotal: subtotal,
                        envio: envio,
                        total: total,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================================
// COMPONENTE 1: LISTA DE PRODUCTOS AGREGADOS
// =========================================================================
class _ListaProductosCarrito extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const _ListaProductosCarrito({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0C1F3D), // Fondo de la tarjeta del item
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Foto del producto
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.white,
                  child: Image.asset(
                    item['imagen'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Detalles (Nombre y Precio Unitario)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['nombre'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${item['precio'].toStringAsFixed(2)} c/u',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),

              // Controles de Cantidad (Estructura de botones - / +)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      // TODO: Lógica para restar cantidad
                    },
                  ),
                  Text(
                    '${item['cantidad']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      // TODO: Lógica para sumar cantidad
                    },
                  ),
                ],
              ),
              const SizedBox(width: 16),

              // Precio Total por ese producto e Icono de Eliminar
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${(item['precio'] * item['cantidad']).toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      // TODO: Lógica para remover por completo del carrito
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// =========================================================================
// COMPONENTE 2: TARJETA LATERAL DE RESUMEN Y PAGO
// =========================================================================
class _ResumenCompra extends StatelessWidget {
  final double subtotal;
  final double envio;
  final double total;

  const _ResumenCompra({
    required this.subtotal,
    required this.envio,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1F3D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.withOpacity(0.3),
          width: 1,
        ), // Detalle sutil de borde
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RESUMEN DE COMPRA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const Divider(height: 32, color: Colors.white24),

          // Fila Subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                '\$${subtotal.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Fila Envío
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Envío',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                '\$${envio.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          const Divider(height: 32, color: Colors.white24),

          // Fila TOTAL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // BOTÓN PRINCIPAL PARA PROCESAR EL PEDIDO
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Conectar a pasarela de pago o confirmación de orden
                print('Procesando orden de compra...');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'PROCEDER AL PAGO',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
