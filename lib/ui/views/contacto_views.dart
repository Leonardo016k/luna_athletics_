import 'package:flutter/material.dart';

class ContactoView extends StatelessWidget {
  const ContactoView({super.key});

  @override
  Widget build(BuildContext context) {
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
            // 1. ENCABEZADO (Títulos)
            // ==========================================
            const Text(
              'CONTÁCTANOS',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '¿DUDAS? HABLEMOS.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),

            // ==========================================
            // 2. FILA DE INFORMACIÓN DIRECTA
            // ==========================================
            const Wrap(
              spacing: 64, // Espacio horizontal entre bloques
              runSpacing:
                  24, // Espacio vertical si saltan de línea en pantallas chicas
              alignment: WrapAlignment.center,
              children: [
                _InfoContactoItem(
                  icon: Icons.location_on,
                  titulo: 'Ubicación',
                  subtitulo: 'CD. Hidalgo, Michoacán',
                ),
                _InfoContactoItem(
                  icon: Icons.phone,
                  titulo: 'Teléfono',
                  subtitulo: '+52 715-157-52-59',
                ),
                _InfoContactoItem(
                  icon: Icons.email,
                  titulo: 'Email',
                  subtitulo: 'Bluna375@gmail.com',
                ),
              ],
            ),
            const SizedBox(height: 64),

            // ==========================================
            // 3. BLOQUE INFERIOR RESPONSIVO (Mapa y Formulario)
            // ==========================================
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  // Vista Web / Desktop (Lado a lado)
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 1, child: _ContenedorMapa()),
                      const SizedBox(width: 48),
                      Expanded(flex: 1, child: _FormularioContacto()),
                    ],
                  );
                } else {
                  // Vista Móvil o Estrecha (Uno abajo del otro)
                  return const Column(
                    children: [
                      _ContenedorMapa(),
                      SizedBox(height: 40),
                      _FormularioContacto(),
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
// WIDGET AUXILIAR: ITEM DE INFORMACIÓN (Icono + Título + Subtítulo)
// =========================================================================
class _InfoContactoItem extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;

  const _InfoContactoItem({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 36),
          const SizedBox(height: 12),
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitulo,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// =========================================================================
// WIDGET AUXILIAR: CONTENEDOR DEL MAPA
// =========================================================================
class _ContenedorMapa extends StatelessWidget {
  const _ContenedorMapa();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:
          1.2, // Mantiene una proporción cuadrada/rectangular armoniosa
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/mapa_placeholder.jpg', // Ruta de tu captura del mapa
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.map_outlined, size: 64, color: Colors.grey),
              );
            },
          ),
        ),
      ),
    );
  }
}

// =========================================================================
// WIDGET AUXILIAR: FORMULARIO DE CONTACTO
// =========================================================================
class _FormularioContacto extends StatelessWidget {
  const _FormularioContacto();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(hint: 'Tu Nombre'),
        const SizedBox(height: 16),
        _buildTextField(hint: 'Tu Email'),
        const SizedBox(height: 16),
        _buildTextField(hint: 'Asunto (Ej: Devolución, Tallas)'),
        const SizedBox(height: 16),
        _buildTextField(hint: 'Escribe tu mensaje aquí...', maxLines: 5),
        const SizedBox(height: 24),

        // BOTÓN ENVIAR MENSAJE
        OutlinedButton(
          onPressed: () {
            // TODO: Agregar lógica para enviar el formulario por HTTP o Email
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.blue, width: 2),
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'Enviar Mensaje',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Helper para generar los inputs rápidamente de forma uniforme
  Widget _buildTextField({required String hint, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFF0C1F3D), // Fondo oscuro de los inputs
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.white12, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.blue, width: 1),
        ),
      ),
    );
  }
}
