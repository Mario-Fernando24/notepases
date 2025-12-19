import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notepases/src/presentation/atomic_design/foundations/typo.dart';

class AppPrimaryButton extends StatefulWidget {
  final bool outlined;
  final Color color;
  final Color colorText;
  final Color backgroundColor;
  final String text;
  final VoidCallback? onPressed;
  final double siceIcono;
  final String fontFamily;
  
  // Nuevos parámetros para el icono
  final IconData? icon; 
  final bool showIcon;
  final Color colorIcono;

  const AppPrimaryButton({
    super.key,
    required this.outlined,
    this.color = Colors.deepPurpleAccent,
    this.colorText = Colors.white,
    this.backgroundColor = Colors.deepPurpleAccent,
    required this.text,
    required this.onPressed,
    this.siceIcono = 20.0,
    this.fontFamily = NoTePaseTypographyFoundation.familyText,

    this.icon,           // Icono opcional
    this.showIcon = false, // Por defecto no se muestra
    this.colorIcono = Colors.white, // Color por defecto del icono  
  });

  @override
  State<AppPrimaryButton> createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  
  // Widget auxiliar para construir el contenido del botón
  Widget _buildContent() {
    final textWidget = Text(
      widget.text,
      style: TextStyle(
        color: widget.outlined ? widget.colorText : Colors.white,
        fontFamily: widget.fontFamily,
      ),
    );

    if (widget.showIcon && widget.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(widget.icon, size: widget.siceIcono, color: widget.colorIcono,),
          const SizedBox(width: 8), // Espacio entre icono y texto
          textWidget,
        ],
      );
    }
    return textWidget;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: widget.outlined
          ? OutlinedButton(
              onPressed: widget.onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: widget.color),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: _buildContent(),
            )
          : ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.backgroundColor,
                foregroundColor: Colors.white, // Color para el splash e iconos
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: widget.color),
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: _buildContent(),
            ),
    );
  }
}