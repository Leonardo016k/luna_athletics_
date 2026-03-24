import 'package:e301_login/router/router.dart';
import 'package:e301_login/ui/buttons/custom_outlined_button.dart';
import 'package:e301_login/ui/buttons/link_text.dart';
import 'package:e301_login/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'email',
                    label: 'Correo Electrónico',
                    icon: Icons.email_outlined,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: '*******',
                    label: 'Contraseña',
                    icon: Icons.lock_clock_outlined,
                  ),
                ),
                SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Crear Cuenta',
                  isFilled: true,
                ),
                SizedBox(height: 20),
                LinkText(
                  texto: 'Ir al login',
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.loginRoute);
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
