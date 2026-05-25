import 'package:flutter/material.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista con las preguntas y respuestas estructuradas por categorías
    final List<Map<String, dynamic>> faqs = [
      {
        'categoria': 'ENVÍOS Y ENTREGAS',
        'preguntas': [
          {
            'pregunta': '¿Cuánto tiempo tarda en llegar mi pedido?',
            'respuesta':
                'Los envíos nacionales tardan entre 3 a 5 días hábiles en llegar a tu domicilio dependiendo de la zona postal.',
          },
          {
            'pregunta': '¿Cómo puedo rastrear mi paquete?',
            'respuesta':
                'Una vez que tu pago sea procesado, recibirás un correo electrónico con el número de guía (DHL o FedEx) para rastrear tu pedido en tiempo real desde la sección "Mis Pedidos".',
          },
        ],
      },
      {
        'categoria': 'CAMBIOS Y DEVOLUCIONES',
        'preguntas': [
          {
            'pregunta': '¿Puedo hacer un cambio de talla si no me queda?',
            'respuesta':
                '¡Claro! Tienes hasta 15 días naturales después de recibir tu paquete para solicitar un cambio de talla. La prenda debe estar nueva, con etiquetas y sin usar.',
          },
          {
            'pregunta':
                '¿Qué hago si mi producto llega con un defecto de fábrica?',
            'respuesta':
                'Si tu armadura LunaLift llega con algún detalle, ponte en contacto inmediatamente a través de nuestra sección de Soporte/Contacto enviando tu número de orden y una foto del defecto para hacer la reposición sin costo.',
          },
        ],
      },
      {
        'categoria': 'PRODUCTOS Y CUIDADO',
        'preguntas': [
          {
            'pregunta': '¿Cómo debo lavar mis prendas de compresión avanzada?',
            'respuesta':
                'Para maximizar la vida útil de la tecnología de compresión, recomendamos lavar las prendas al revés con agua fría, usar detergente suave y secar al aire libre (evitar el uso de secadora).',
          },
          {
            'pregunta': '¿Manejan lanzamientos de diseños exclusivos?',
            'respuesta':
                'Sí, trabajamos bajo un formato de drops limitados. Una vez que un diseño exclusivo se agota, no se vuelve a fabricar para mantener la exclusividad de nuestra comunidad.',
          },
        ],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(
        0xFF071A35,
      ), // Fondo oscuro oficial de la app
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ==========================================
            // ENCABEZADO (Títulos)
            // ==========================================
            const Text(
              'SOPORTE',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'PREGUNTAS FRECUENTES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Encuentra respuestas rápidas sobre envíos, tallas y nuestras políticas.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            // Contenedor para limitar el ancho en Web y que se lea cómodo
            Center(
              child: Container(
                width: 850,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: faqs.length,
                  itemBuilder: (context, index) {
                    final categoria = faqs[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título de la Categoría (Gris con tracking)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 24,
                            bottom: 12,
                          ),
                          child: Text(categoria['categoria']),
                        ),

                        // Lista de acordeones ExpansionTile para esa categoría
                        ...List.generate(categoria['preguntas'].length, (
                          pIndex,
                        ) {
                          final faq = categoria['preguntas'][pIndex];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF0C1F3D,
                              ), // Fondo oscuro de la tarjeta
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white10,
                                width: 0.5,
                              ),
                            ),
                            child: Theme(
                              // Limpia la línea divisoria interna que por defecto trae ExpansionTile
                              data: Theme.of(
                                context,
                              ).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                iconColor: Colors
                                    .blue, // Color de la flecha al abrirse
                                collapsedIconColor: Colors
                                    .white60, // Color de la flecha cerrada
                                title: Text(
                                  faq['pregunta'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      bottom: 20,
                                      top: 4,
                                    ),
                                    child: Text(
                                      faq['respuesta'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    );
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
