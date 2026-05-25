import 'package:flutter/material.dart';

class PedidosView extends StatelessWidget {
  const PedidosView({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulada de los pedidos del usuario
    final List<Map<String, dynamic>> misPedidos = [
      {
        'id': 'LUNA-9824',
        'fecha': '24/05/2026',
        'total': 1400.00,
        'estado': 'En camino',
        'colorEstado': Colors.orange,
        'articulos': 2,
      },
      {
        'id': 'LUNA-9512',
        'fecha': '12/05/2026',
        'total': 850.00,
        'estado': 'Entregado',
        'colorEstado': Colors.green,
        'articulos': 1,
      },
      {
        'id': 'LUNA-9105',
        'fecha': '28/04/2026',
        'total': 2150.00,
        'estado': 'Cancelado',
        'colorEstado': Colors.redAccent,
        'articulos': 4,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF071A35), // El fondo oscuro oficial
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la sección
            const Text(
              'MIS PEDIDOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Historial de tus compras y estado de envío.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 32),

            // Contenedor que limita el ancho máximo en Web para que no se estire feo
            Center(
              child: Container(
                width: 1000,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: misPedidos.length,
                  itemBuilder: (context, index) {
                    final pedido = misPedidos[index];
                    return _TarjetaPedido(pedido: pedido);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================================
// COMPONENTE: TARJETA DE PEDIDO INDIVIDUAL
// =========================================================================
class _TarjetaPedido extends StatelessWidget {
  final Map<String, dynamic> pedido;
  const _TarjetaPedido({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1F3D), // Fondo oscuro de las tarjetas
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10, width: 1),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Si la pantalla es muy pequeña, acomoda los datos en columna
          bool esMovil = constraints.maxWidth < 600;

          return Flex(
            direction: esMovil ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: esMovil
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              // Bloque 1: ID, Fecha y cantidad de artículos
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pedido # ${pedido['id']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Fecha: ${pedido['fecha']}  •  ${pedido['articulos']} artículo(s)',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              if (esMovil) const SizedBox(height: 16),

              // Bloque 2: Estado del pedido (Badge con color dinámico)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: (pedido['colorEstado'] as Color).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: pedido['colorEstado'], width: 1),
                ),
                child: Text(
                  pedido['estado'],
                  style: TextStyle(
                    color: pedido['colorEstado'],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (esMovil) const SizedBox(height: 16),

              // Bloque 3: Total del pedido
              Column(
                crossAxisAlignment: esMovil
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${pedido['total'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (esMovil) const SizedBox(height: 20),

              // Bloque 4: Botón de interacción
              OutlinedButton.icon(
                onPressed: () {
                  // TODO: Lógica para abrir el detalle completo del pedido
                  print('Abriendo detalle de: ${pedido['id']}');
                },
                icon: const Icon(
                  Icons.receipt_long_outlined,
                  size: 18,
                  color: Colors.blue,
                ),
                label: const Text(
                  'Detalles',
                  style: TextStyle(color: Colors.blue),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue, width: 1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
