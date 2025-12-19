import 'package:flutter/material.dart';
import 'package:notepases/src/presentation/atomic_design/organisms/onb_slide.dart';

class LocationPage extends StatelessWidget {
  final bool loading;
  final VoidCallback onAllowAlways;
  final VoidCallback onLater;

  const LocationPage({
    super.key,
    required this.loading,
    required this.onAllowAlways,
    required this.onLater,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  'assets/images/fondo_onbording_dos.png',
                ),
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
            icon: Icons.location_on_outlined,
            title: 'Permisos de Ubicación',
            description:
                'Necesitamos tu ubicación para avisarte cuando estés llegando, incluso con la app cerrada.\n\nTu privacidad siempre está protegida.',
            primaryText: loading
                ? 'Solicitando...'
                : 'Permitir ubicación "Siempre"',
            onPrimary: loading ? null : onAllowAlways,
            secondaryText: 'Más tarde',
            onSecondary: loading ? null : onLater,
            outlined: true,
          ),
        ),
      ],
    );
  }
}
