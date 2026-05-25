import 'package:flutter/material.dart';

class NosotrosView extends StatelessWidget {
  const NosotrosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // SECCIÓN: NUESTRA ESENCIA / HISTORIA
            // ==========================================
            const Text(
              'Nuestra Esencia',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Nacidos en la Oscuridad',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nuestra Historia',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'La fuerza no se regala, se construye. LunaLift surgió de la necesidad de crear equipamiento que estuviera a la altura de esa construcción diaria. Nuestra misión es simple: empoderar a cada atleta para que supere sus propios límites, proporcionando ropa que combina tecnología de compresión avanzada con una estética visual impactante.\n\n'
              'En LunaLift, creemos que tu ropa es tu armadura. No diseñamos para las masas, diseñamos para los guerreros modernos.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 12),
            // Viñetas de características destacadas
            const BulletPoint(text: 'Diseños Exclusivos'),
            const BulletPoint(text: 'Calidad Premium'),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),

            // ==========================================
            // SECCIÓN: NUESTRA MISIÓN
            // ==========================================
            const Text(
              'Nuestra Misión',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'En LunaLift queremos inspirarte a levantar más que peso: levantar tu energía, tu confianza y tu actitud. Creamos ropa deportiva cómoda, funcional y con estilo.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 12),
            const BulletPoint(text: 'Estilo Único'),
            const BulletPoint(text: 'Envíos Nacionales'),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),

            // ==========================================
            // SECCIÓN: NUESTRA VISIÓN
            // ==========================================
            const Text(
              'Nuestra Visión',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              '"Ser el estandarte global de quienes entrenan en las sombras."',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Convertirnos en una de las marcas fitness más influyentes, reconocida por motivar a una comunidad que vive el movimiento, la superación y el amor propio. En LunaLift, creemos que cada día es una nueva oportunidad para brillar, romper límites y elevar tu nivel.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),

            // ==========================================
            // SECCIÓN: NUESTROS VALORES
            // ==========================================
            const Text(
              'Nuestros Valores',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const ValorItem(
              titulo: 'Pasión por el movimiento',
              descripcion:
                  'Amamos el fitness y la energía que transforma cuerpos y mentes.',
            ),
            const ValorItem(
              titulo: 'Autenticidad',
              descripcion:
                  'Cada persona entrena a su ritmo y estilo. Nos encanta lo que te hace único.',
            ),
            const ValorItem(
              titulo: 'Superación constante',
              descripcion:
                  'No se trata de ser perfecto, sino de ser mejor que ayer.',
            ),
            const ValorItem(
              titulo: 'Comodidad con estilo',
              descripcion:
                  'Ropa que se ve bien, se siente mejor y rinde al máximo.',
            ),
            const ValorItem(
              titulo: 'Comunidad',
              descripcion:
                  'Somos una familia fitness que se apoya, se motiva y crece junta.',
            ),
            const ValorItem(
              titulo: 'Conciencia',
              descripcion:
                  'Apostamos por procesos responsables. Entrenar es cuidar el planeta.',
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar para las viñetas sencillas (Diseños exclusivos, calidad, etc.)
class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para estructurar cada valor con su descripción
class ValorItem extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ValorItem({super.key, required this.titulo, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            descripcion,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
