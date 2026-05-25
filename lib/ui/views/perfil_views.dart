import 'package:flutter/material.dart';

class PerfilViews extends StatelessWidget {
  const PerfilViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF071A35), // Fondo oscuro base
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Títulos de la sección
            const Text(
              'MI CUENTA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Administra tus datos personales y configuración de seguridad.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 40),

            // Layout Adaptable (Dos columnas para Web, una sola para Móvil)
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 850) {
                  // Vista para pantallas anchas (Web)
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 1, child: _TarjetaPerfil()),
                      const SizedBox(width: 40),
                      Expanded(flex: 2, child: _FormularioDatos()),
                    ],
                  );
                } else {
                  // Vista para pantallas estrechas (Móvil)
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
    );
  }
}

// =========================================================================
// COMPONENTE 1: TARJETA DE PERFIL (AVATAR Y RESUMEN)
// =========================================================================
class _TarjetaPerfil extends StatelessWidget {
  const _TarjetaPerfil();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1F3D), // Fondo de las tarjetas
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10, width: 1),
      ),
      child: Column(
        children: [
          // Contenedor del Avatar / Foto de Perfil
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.withOpacity(0.2),
                child: const Icon(Icons.person, size: 64, color: Colors.blue),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 16,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // TODO: Lógica para cambiar la imagen de perfil
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Información básica del usuario
          const Text(
            'Leonardo Reyes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Atleta LunaLift',
            style: TextStyle(
              color: Colors.blue.shade300,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white12),
          const SizedBox(height: 8),

          // Miembro desde...
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                'Miembro desde: Mayo 2026',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =========================================================================
// COMPONENTE 2: FORMULARIO DE DETALLES Y CONFIGURACIÓN
// =========================================================================
class _FormularioDatos extends StatelessWidget {
  const _FormularioDatos();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1F3D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INFORMACIÓN PERSONAL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const Divider(height: 32, color: Colors.white12),

          // Inputs en fila doble si hay espacio (Nombre y Correo)
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
            child: Divider(color: Colors.white12),
          ),

          const Text(
            'SEGURIDAD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 32),

          // BOTÓN PARA GUARDAR LOS CAMBIOS
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Enlazar con la base de datos o Provider para guardar cambios
                print('Guardando cambios del perfil...');
              },
              icon: const Icon(Icons.save_outlined, size: 18),
              label: const Text('GUARDAR CAMBIOS'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper para construir los campos de texto del perfil rápidamente
  Widget _buildInputField({
    required String hint,
    required IconData icon,
    bool obscureText = false,
    int maxLines = 1,
  }) {
    return TextField(
      obscureText: obscureText,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        prefixIcon: Icon(icon, color: Colors.white60, size: 20),
        filled: true,
        fillColor: const Color(
          0xFF071A35,
        ), // Fondo un poco más oscuro para que resalte dentro de la tarjeta
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white12, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 1),
        ),
      ),
    );
  }
}
