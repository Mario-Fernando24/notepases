import 'package:flutter/material.dart';
import 'package:notepases/src/presentation/atomic_design/organisms/onb_slide.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback onContinue;
  const WelcomePage({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ 
        Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/fondo_onbording.png'),
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
        child: OnbSlide(
          icon: Icons.bedtime_outlined,
          title: 'StayWake',
          description: 'Duerme tranquilo,\nnosotros te avisamos.',
          primaryText: 'Continuar',
          onPrimary: onContinue,
          showArrow: true,
        ),
      ),
      ]
    );
  }
}
