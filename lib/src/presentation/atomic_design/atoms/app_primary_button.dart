import 'package:flutter/material.dart';
import 'package:notepases/src/presentation/atomic_design/foundations/typo.dart';

class AppPrimaryButton extends StatefulWidget {
  final bool outlined;
  final Color color;
  final Color colorText;
  final Color backgroundColor;
  final String text;
  final VoidCallback? onPressed;

  const AppPrimaryButton({
    super.key,
    required this.outlined,
    this.color = Colors.deepPurpleAccent,
    this.colorText = Colors.white,
    this.backgroundColor = Colors.deepPurpleAccent,
    required this.text,
    required this.onPressed,
  });

  @override
  State<AppPrimaryButton> createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: widget.outlined
          ? OutlinedButton(
              onPressed: widget.onPressed,
              style: OutlinedButton.styleFrom(
                side:  BorderSide(color: widget.color),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: Text(widget.text, style:  TextStyle(color: widget.colorText,fontFamily: NoTePaseTypographyFoundation.familyBody)),
            )
          : ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: Text(widget.text, style: const TextStyle(color: Colors.white,fontFamily: NoTePaseTypographyFoundation.familyBody)),
            ),
    );
  }
}
