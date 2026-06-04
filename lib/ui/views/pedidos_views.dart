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
        'colorEstado': Colors.redAccent.shade700,
        'articulos': 4,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black, // Cambiado al fondo negro oficial
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la sección estilo Premium
            const Text(
              'MIS PEDIDOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Historial de tus compras y estado de envío.',
              style: TextStyle(color: Colors.white38, fontSize: 14),
            ),
            const SizedBox(height: 32),

            // Contenedor que limita el ancho máximo en Web
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
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

class _TarjetaPedido extends StatelessWidget {
  final Map<String, dynamic> pedido;
  const _TarjetaPedido({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0C), // Mismo negro mate usado en el Carrito
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool esMovil = constraints.maxWidth < 750;

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
                    'PEDIDO # ${pedido['id']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Fecha: ${pedido['fecha']}  •  ${pedido['articulos']} artículo(s)',
                    style: const TextStyle(color: Colors.white38, fontSize: 13),
                  ),
                ],
              ),
              if (esMovil) const SizedBox(height: 16),

              // Bloque 2: Estado del pedido (Badge estilizado con opacidad baja)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: (pedido['colorEstado'] as Color).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(
                    4,
                  ), // Bordes más rectos y limpios
                  border: Border.all(color: pedido['colorEstado'], width: 1),
                ),
                child: Text(
                  pedido['estado'].toString().toUpperCase(),
                  style: TextStyle(
                    color: pedido['colorEstado'],
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
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
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${pedido['total'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              if (esMovil) const SizedBox(height: 20),

              // Bloque 4: Botón de interacción (Cambiado de Azul a Blanco/Gris minimalista)
              OutlinedButton.icon(
                onPressed: () {
                  print('Abriendo detalle de: ${pedido['id']}');
                },
                icon: const Icon(
                  Icons.receipt_long_outlined,
                  size: 18,
                  color: Colors.white70,
                ),
                label: const Text(
                  'DETALLES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white.withOpacity(0.15),
                    width: 1,
                  ),
                  backgroundColor: const Color(
                    0xFF141416,
                  ), // Sutil contraste de fondo
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
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
