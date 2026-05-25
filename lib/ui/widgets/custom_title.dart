import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('logoluna.png', width: 50, height: 50),
        SizedBox(height: 20),
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Bienvenido a Luna Athletics',
            style: GoogleFonts.montserratAlternates(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
