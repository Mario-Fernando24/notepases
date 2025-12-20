import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notepases/src/presentation/atomic_design/atoms/app_primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
                  SizedBox(height: MediaQuery.of( context).size.height * 0.60),

                  Text(
                    'Accede de tu cuenta',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 16),


                  AppPrimaryButton(
                    showIcon: true,
                    icon: FontAwesomeIcons.google,
                    backgroundColor: Colors.transparent,
                    outlined: true,
                    text: 'Continuar con Google',
                    onPressed: () => testGoogleLogin(),
                  ),

                  const SizedBox(height: 16),

                  AppPrimaryButton(
                    showIcon: true,
                    icon: FontAwesomeIcons.facebook,
                    backgroundColor: Colors.transparent,
                    outlined: true,
                    text: 'Continuar con Facebook',
                    onPressed: () => signInWithFacebook(),
                  ),
                   const SizedBox(height: 16),

                  // AppPrimaryButton(
                  //   siceIcono: 25,
                  //   showIcon: true,
                  //   icon: FontAwesomeIcons.apple,
                  //   backgroundColor: Colors.transparent,
                  //   outlined: true,
                  //   text: 'Continuar con Apple ID',
                  //   onPressed: () {},
                  // ),
                  // const SizedBox(height: 40),

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

Future<void> testGoogleLogin() async {
  final googleSignIn = GoogleSignIn();
  final account = await googleSignIn.signIn();

  if (account == null) {
    print('Login cancelado');
    return;
  }

  final auth = await account.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: auth.accessToken,
    idToken: auth.idToken,
  );

  final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

  print('Usuario Google UID => ${userCredential.user?.uid}');
}

Future<void> signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['public_profile'], // ✅ QUITAR email por ahora
    );

    debugPrint('Facebook status => ${result.status}');
    debugPrint('Facebook message => ${result.message}');

    if (result.status != LoginStatus.success) {
      debugPrint('Facebook: login cancelado o fallido');
      return;
    }

    final token = result.accessToken;
    if (token == null) {
      debugPrint('Facebook: accessToken es null');
      return;
    }

    debugPrint('Facebook token (preview) => ${token.tokenString.substring(0, 10)}...');

    final OAuthCredential credential =
        FacebookAuthProvider.credential(token.tokenString);

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    debugPrint('Facebook UID => ${userCredential.user?.uid}');
    debugPrint('Facebook email => ${userCredential.user?.email}'); // puede venir null y es normal
    debugPrint('Facebook data => ${userCredential.user?.toString()}'); // puede venir null y es normal
    debugPrint('??????????????? => ${userCredential.additionalUserInfo?.toString()}'); // puede venir null y es normal
    debugPrint('***************  => ${userCredential.credential?.toString()}'); // puede venir null y es normal

  } catch (e) {
    debugPrint('Facebook error: $e');
    // Si no quieres que crashee la app, NO uses rethrow
  }
}
