import 'package:flutter/material.dart';

class NosotrosView extends StatelessWidget {
  const NosotrosView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Cuadrícula dinámica para los valores: 3 columnas en pantallas grandes, 1 en móvil
    final int crossAxisCount = size.width > 1200
        ? 3
        : (size.width > 750 ? 2 : 1);

    return Scaffold(
      backgroundColor: Colors.transparent, // Fondo negro heredado del layout
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ), // Mantiene el contenido estilizado y centrado
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LUNALIFT .ESENCIA',
                          style: TextStyle(
                            fontSize: size.width > 600 ? 40 : 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 4,

                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'NACIDOS EN LA OSCURIDAD — ENTRENANDO EN LAS SOMBRAS',
                          style: TextStyle(
                            fontSize: size.width > 600 ? 13 : 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.redAccent.shade700,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    if (size.width > 800)
                      Text(
                        '// 01',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 20),
                const Divider(color: Colors.white10, thickness: 1),
                const SizedBox(height: 40),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (size.width > 900) ...[
                      const Text(
                        'HISTORIA',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white38,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(width: 80),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'La fuerza no se regala, se construye de manera diaria.',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'LunaLift surgió de la necesidad de crear equipamiento que estuviera a la altura de esa construcción diaria. Nuestra misión es simple: empoderar a cada atleta para que supere sus propios límites, proporcionando ropa que combina tecnología de compresión avanzada con una estética visual impactante.\n\n'
                            'En LunaLift, creemos que tu ropa es tu armadura. No diseñamos para las masas, diseñamos para los guerreros modernos.',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.8,
                              color: Colors.white60,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: const [
                              CustomBadge(text: 'DISEÑOS EXCLUSIVOS'),
                              SizedBox(width: 16),
                              CustomBadge(text: 'CALIDAD PREMIUM'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),
                const Divider(color: Colors.white10, thickness: 1),
                const SizedBox(height: 60),

                size.width > 850
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildFilosofiaSeccion(
                              'MISIÓN',
                              'Levantar tu energía, confianza y actitud a través de prendas funcionales.',
                            ),
                          ),
                          const SizedBox(width: 60),
                          Expanded(
                            child: _buildFilosofiaSeccion(
                              'VISIÓN',
                              'Ser el estandarte global de quienes entrenan en las sombras, rompiendo todo límite.',
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _buildFilosofiaSeccion(
                            'MISIÓN',
                            'Levantar tu energía, confianza y actitud a través de prendas funcionales.',
                          ),
                          const SizedBox(height: 40),
                          _buildFilosofiaSeccion(
                            'VISIÓN',
                            'Ser el estandarte global de quienes entrenan en las sombras, rompiendo todo límite.',
                          ),
                        ],
                      ),

                const SizedBox(height: 60),
                const Divider(color: Colors.white10, thickness: 1),
                const SizedBox(height: 60),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'CORE VALORES',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'LUNALIFT SQUAD',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.2),
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: size.width > 1200 ? 1.4 : 1.2,
                  children: const [
                    ValorItem(
                      number: '01',
                      icon: Icons.bolt_outlined,
                      titulo: 'Pasión por el movimiento',
                      descripcion:
                          'Amamos el fitness y la energía pura que transforma cuerpos y mentes.',
                    ),
                    ValorItem(
                      number: '02',
                      icon: Icons.fingerprint_outlined,
                      titulo: 'Autenticidad salvaje',
                      descripcion:
                          'Cada quien entrena a su ritmo. Nos fascina lo que te hace radicalmente único.',
                    ),
                    ValorItem(
                      number: '03',
                      icon: Icons.trending_up_outlined,
                      titulo: 'Superación constante',
                      descripcion:
                          'No buscamos perfección artificial, buscamos ganarle al espejo día con día.',
                    ),
                    ValorItem(
                      number: '04',
                      icon: Icons.style_outlined,
                      titulo: 'Comodidad con estilo',
                      descripcion:
                          'Prendas con ingeniería textil que se sienten brutales y rinden al límite.',
                    ),
                    ValorItem(
                      number: '05',
                      icon: Icons.groups_outlined,
                      titulo: 'Comunidad de sombras',
                      descripcion:
                          'Una familia fitness que se respalda, se exige y evoluciona en conjunto.',
                    ),
                    ValorItem(
                      number: '06',
                      icon: Icons.eco_outlined,
                      titulo: 'Conciencia táctica',
                      descripcion:
                          'Procesos responsables. Cuidar de tu templo involucra respetar el entorno.',
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Creador de bloques limpios para Misión y Visión sin usar cajas contenedoras
  Widget _buildFilosofiaSeccion(String titulo, String texto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            color: Colors.redAccent.shade700,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          '"$texto"',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.4,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class CustomBadge extends StatelessWidget {
  final String text;
  const CustomBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class ValorItem extends StatelessWidget {
  final String number;
  final IconData icon;
  final String titulo;
  final String descripcion;

  const ValorItem({
    super.key,
    required this.number,
    required this.icon,
    required this.titulo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF111113),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ), // Borde casi invisible
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white24,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo.toUpperCase(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                descripcion,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white38,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
