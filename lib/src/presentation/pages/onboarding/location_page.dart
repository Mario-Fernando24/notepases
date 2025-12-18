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
    return OnbSlide(
      icon: Icons.location_on_outlined,
      title: 'Permisos de Ubicación',
      description: 'Para alertarte a tiempo, necesitamos acceder a tu ubicación incluso cuando la app esté cerrada.\n\nTu privacidad es importante y tus datos nunca se comparten.',
      primaryText: loading ? 'Solicitando...' : 'Permitir ubicación "Siempre"',
      onPrimary: loading ? null : onAllowAlways,
      secondaryText: 'Más tarde',
      onSecondary: loading ? null : onLater,
      outlined: true,
    );
  }
}
