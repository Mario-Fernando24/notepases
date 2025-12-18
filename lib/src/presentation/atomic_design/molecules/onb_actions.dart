import 'package:flutter/material.dart';
import 'package:notepases/src/presentation/atomic_design/foundations/typo.dart';
import '../atoms/app_primary_button.dart';

class OnbActions extends StatelessWidget {
  final bool outlined;
  final String primaryText;
  final VoidCallback? onPrimary;
  final String? secondaryText;
  final VoidCallback? onSecondary;

  final bool showArrow;

  const OnbActions({
    super.key,
    required this.outlined,
    required this.primaryText,
    required this.onPrimary,
    this.secondaryText,
    this.onSecondary,
    this.showArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppPrimaryButton(
          outlined: outlined,
          text: primaryText,
          onPressed: onPrimary,
        ),
        const SizedBox(height: 10),
        if (secondaryText != null)
          TextButton(
            onPressed: onSecondary,
            child: Text(
              secondaryText!,
              style: TextStyle(color: Colors.white.withOpacity(0.7), fontFamily: NoTePaseTypographyFoundation.familyBody),
            ),
          ),
        if (showArrow) ...[
          const SizedBox(height: 10),
          InkWell(
            onTap: onPrimary,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.25)),
              ),
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
        ],
      ],
    );
  }
}
