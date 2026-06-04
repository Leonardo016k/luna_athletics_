import 'package:flutter/material.dart';

class PerfilViews extends StatelessWidget {
  const PerfilViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Hereda el fondo negro del Layout principal
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- ENCABEZADO DE SECCIÓN ---
                const Text(
                  'MI CUENTA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900, // Estilo deportivo grueso
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 4,
                      color: Colors.redAccent.shade700,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Administra tus datos personales y configuración de seguridad.',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 850) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(flex: 1, child: _TarjetaPerfil()),
                          const SizedBox(width: 40),
                          Expanded(flex: 2, child: _FormularioDatos()),
                        ],
                      );
                    } else {
                      return const Column(
                        children: [
                          _TarjetaPerfil(),
                          SizedBox(height: 32),
                          _FormularioDatos(),
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

class _TarjetaPerfil extends StatelessWidget {
  const _TarjetaPerfil();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF111113),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white.withOpacity(0.03),
                child: const Icon(
                  Icons.person_outline_sharp,
                  size: 64,
                  color: Colors.white70,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.redAccent.shade700,
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 16,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Leonardo Reyes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'ATLETA LUNALIFT',
            style: TextStyle(
              color: Colors.redAccent.shade100,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white10),
          const SizedBox(height: 12),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: Colors.white38,
              ),
              SizedBox(width: 8),
              Text(
                'Miembro desde: Mayo 2026',
                style: TextStyle(color: Colors.white38, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FormularioDatos extends StatelessWidget {
  const _FormularioDatos();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF111113), // Grafito mate integrado
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INFORMACIÓN PERSONAL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const Divider(height: 32, color: Colors.white10),

          _buildInputField(hint: 'Nombre Completo', icon: Icons.person_outline),
          const SizedBox(height: 20),
          _buildInputField(
            hint: 'Correo Electrónico',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 20),
          _buildInputField(
            hint: 'Teléfono de Contacto',
            icon: Icons.phone_android_outlined,
          ),
          const SizedBox(height: 20),
          _buildInputField(
            hint: 'Dirección de Envío predeterminada',
            icon: Icons.home_outlined,
            maxLines: 2,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Divider(color: Colors.white10),
          ),

          const Text(
            'SEGURIDAD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          _buildInputField(
            hint: 'Contraseña Actual',
            icon: Icons.lock_outline,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          _buildInputField(
            hint: 'Nueva Contraseña',
            icon: Icons.lock_open_outlined,
            obscureText: true,
          ),
          const SizedBox(height: 40),

          // BOTÓN PARA GUARDAR LOS CAMBIOS
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                print('Guardando cambios del perfil...');
              },
              icon: const Icon(
                Icons.check_circle_outline,
                size: 18,
                color: Colors.white,
              ),
              label: const Text(
                'GUARDAR CAMBIOS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .redAccent
                    .shade700, // Cambiado de azul a rojo puro de marca
                padding: const EdgeInsets.symmetric(vertical: 20),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    4,
                  ), // Bordes más rectos para look industrial
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper para construir los campos de texto oscuros
  Widget _buildInputField({
    required String hint,
    required IconData icon,
    bool obscureText = false,
    int maxLines = 1,
  }) {
    return TextField(
      obscureText: obscureText,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      cursorColor: Colors.redAccent,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(color: Colors.white38, fontSize: 14),
        prefixIcon: Icon(icon, color: Colors.white54, size: 20),
        filled: true,
        fillColor: const Color(
          0xFF161619,
        ), // Fondo un paso más oscuro para el contraste interno del input
        contentPadding: const EdgeInsets.all(18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.05),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.redAccent.shade700,
            width: 1,
          ), // Foco rojo sutil
        ),
      ),
    );
  }
}
