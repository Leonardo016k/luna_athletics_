import 'package:e301_login/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class InicioView extends StatefulWidget {
  const InicioView({super.key});

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  // Controlador para manejar el cambio de fotos
  final PageController _pageController = PageController();

  final List<String> _images = ['assets/lunalift1.jpg', 'assets/lunalift2.jpg'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. CAPA DEL CARRUSEL DE FOTOS (Al fondo)
        PageView.builder(
          controller: _pageController,
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),

        // 3. FLECHA IZQUIERDA (<)
        Positioned(
          left: 20,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white60,
                size: 30,
              ),
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),

        // 4. FLECHA DERECHA (>)
        Positioned(
          right: 20,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white60,
                size: 30,
              ),
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),

        // 5. TEXTO CENTRAL (Hasta el frente)
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LUNALIFT',
                style: CustomLabels.h1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 70, // Tamaño grande para el título principal
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'GYM CLOTHING',
                style: CustomLabels.h1.copyWith(
                  color: Colors.white70, // Blanco sutil o gris claro
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Extensión temporal por si no tienes configurado el color blanco opaco
extension on TextStyle {
  TextStyle get writeColor => copyWith(color: Colors.white70);
}
