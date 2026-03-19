import 'package:e301_login/ui/buttons/custom_outlined_button.dart';
import 'package:e301_login/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: buildInputDecoration(
                    hint: 'email',
                    label: 'Correo Electrónico',
                    icon: Icons.email_outlined
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: buildInputDecoration(
                    hint: '*******',
                    label: 'Contraseña',
                    icon: Icons.lock_clock_outlined
                  ),
                ),
                SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: (){}, 
                  text: 'Ingresar',
                  isFilled: true,
                ),
                SizedBox(height: 20),
                LinkText(texto: 'Nueva Cuenta'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withAlpha(100))
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withAlpha(100))
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon,color: Colors.grey.withAlpha(150)),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }
}
