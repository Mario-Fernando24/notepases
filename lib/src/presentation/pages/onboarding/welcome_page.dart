import 'package:flutter/material.dart';
import 'package:notepases/src/presentation/atomic_design/organisms/onb_slide.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback onContinue;
  const WelcomePage({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return OnbSlide(
      icon: Icons.bedtime_outlined,
      title: 'StayWake',
      description: 'Duerme tranquilo,\nnosotros te avisamos.',
      primaryText: 'Continuar',
      onPrimary: onContinue,
      showArrow: true,
    );
  }
}
