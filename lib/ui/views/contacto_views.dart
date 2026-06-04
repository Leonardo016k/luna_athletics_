import 'package:flutter/material.dart';

class ContactoView extends StatelessWidget {
  const ContactoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro oficial
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alineación consistente a la izquierda
              children: [
                const Text(
                  'CONTÁCTANOS',
                  style: TextStyle(
                    color: Colors.white38, // Gris sutil deportivo
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '¿DUDAS? HABLEMOS.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 48),

                Center(
                  child: Wrap(
                    spacing: 40, // Espacio horizontal equilibrado
                    runSpacing: 24, // Espacio vertical responsivo
                    alignment: WrapAlignment.center,
                    children: const [
                      _InfoContactoItem(
                        icon: Icons.location_on_sharp,
                        titulo: 'UBICACIÓN',
                        subtitulo: 'CD. Hidalgo, Michoacán',
                      ),
                      _InfoContactoItem(
                        icon: Icons.phone_sharp,
                        titulo: 'TELÉFONO',
                        subtitulo: '+52 715-157-52-59',
                      ),
                      _InfoContactoItem(
                        icon: Icons.email_sharp,
                        titulo: 'EMAIL',
                        subtitulo: 'Bluna375@gmail.com',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 64),

                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 900) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(flex: 1, child: _ContenedorMapa()),
                          const SizedBox(width: 48),
                          Expanded(flex: 1, child: _FormularioContacto()),
                        ],
                      );
                    } else {
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
        ),
      ),
    );
  }
}

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
      width: 280,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0C), // Negro mate
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 30), // Íconos limpios en blanco
          const SizedBox(height: 14),
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitulo,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white54, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _ContenedorMapa extends StatelessWidget {
  const _ContenedorMapa();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0C),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/mapa_placeholder.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.map_outlined,
                  size: 48,
                  color: Colors.white24,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FormularioContacto extends StatelessWidget {
  const _FormularioContacto();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(hint: 'TU NOMBRE'),
        const SizedBox(height: 16),
        _buildTextField(hint: 'TU EMAIL'),
        const SizedBox(height: 16),
        _buildTextField(hint: 'ASUNTO (EJ: DEVOLUCIÓN, TALLAS)'),
        const SizedBox(height: 16),
        _buildTextField(hint: 'ESCRIBE TU MENSAJE AQUÍ...', maxLines: 5),
        const SizedBox(height: 24),

        // BOTÓN ENVIAR MENSAJE (Estilo deportivo rojo sólido de la marca)
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent.shade700,
            padding: const EdgeInsets.symmetric(vertical: 20),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'ENVIAR MENSAJE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({required String hint, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.3),
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        filled: true,
        fillColor: const Color(0xFF0A0A0C), // Fondo oscuro unificado de inputs
        contentPadding: const EdgeInsets.all(18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.08),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Colors.white38,
            width: 1,
          ), // Foco limpio sin azules
        ),
      ),
    );
  }
}
