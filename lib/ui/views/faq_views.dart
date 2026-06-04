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
      backgroundColor: Colors.black, // Fondo puramente negro oficial
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Alineado a la izquierda como "TU CARRITO" y "MIS PEDIDOS"
          children: [
            // ==========================================
            // ENCABEZADO (Títulos estilizados en blanco)
            // ==========================================
            const Text(
              'SOPORTE',
              style: TextStyle(
                color: Colors.white38, // Gris sutil deportivo
                fontSize: 14,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'PREGUNTAS FRECUENTES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Encuentra respuestas rápidas sobre envíos, tallas y nuestras políticas.',
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
            const SizedBox(height: 48),

            // Contenedor para limitar el ancho en Web y mantener consistencia simétrica
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: faqs.length,
                  itemBuilder: (context, index) {
                    final categoria = faqs[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título de la Categoría (Estilo premium en mayúsculas firmes)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                            top: 24,
                            bottom: 16,
                          ),
                          child: Text(
                            categoria['categoria'].toString().toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                            ),
                          ),
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
                                0xFF0A0A0C,
                              ), // Negro mate idéntico a los otros componentes
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.08),
                                width: 1,
                              ),
                            ),
                            child: Theme(
                              // Limpia la línea divisoria interna que por defecto trae ExpansionTile
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              child: ExpansionTile(
                                iconColor: Colors
                                    .white, // Flecha blanca al desplegarse
                                collapsedIconColor: Colors
                                    .white38, // Flecha gris al estar cerrado
                                title: Text(
                                  faq['pregunta'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight
                                        .w900, // Tipografía agresiva y marcada
                                    fontSize: 15,
                                    letterSpacing: 0.5,
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
                                        color: Colors
                                            .white54, // Gris limpio legible para la respuesta
                                        fontSize: 14,
                                        height: 1.5,
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
