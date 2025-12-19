import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notepases/src/presentation/atomic_design/atoms/app_primary_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0D),
      body: Stack(
        children: [
          // 🔹 Fondo con imagen
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/fondo_auth.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(flex: 4),

                  Text(
                    'Accede de tu cuenta',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  AppPrimaryButton(
                    showIcon: true,
                    icon: FontAwesomeIcons.google,
                    backgroundColor: Colors.transparent,
                    outlined: true,
                    text: 'Continuar con Google',
                    onPressed: () {},
                  ),

                  const SizedBox(height: 16),

                  AppPrimaryButton(
                    showIcon: true,
                    icon: FontAwesomeIcons.facebook,
                    backgroundColor: Colors.transparent,
                    outlined: true,
                    text: 'Continuar con Facebook',
                    onPressed: () {},
                  ),
                     const SizedBox(height: 16),

                  AppPrimaryButton(
                    siceIcono: 25,
                    showIcon: true,
                    icon: FontAwesomeIcons.apple,
                    backgroundColor: Colors.transparent,
                    outlined: true,
                    text: 'Continuar con Apple ID',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 40),

                  Text(
                    'Mas opciones',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'familyText',
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
