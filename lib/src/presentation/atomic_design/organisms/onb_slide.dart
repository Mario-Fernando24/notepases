import 'package:flutter/material.dart';
import 'package:notepases/src/presentation/atomic_design/foundations/typo.dart';
import 'package:notepases/src/presentation/atomic_design/tokens/sizes.dart';
import '../molecules/onb_actions.dart';

class OnbSlide extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  final String primaryText;
  final VoidCallback? onPrimary;

  final String? secondaryText;
  final VoidCallback? onSecondary;

  final bool outlined;
  final bool showArrow;

  const OnbSlide({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.primaryText,
    required this.onPrimary,
    this.secondaryText,
    this.onSecondary,
    this.outlined = false,
    this.showArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
      child: Column(
        children: [
          const Spacer(),
          Icon(icon, size: NotePaseSizes.sizeSL, color: Colors.deepPurpleAccent),
          const SizedBox(height: 22),
          Text(
            title,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: NoTePaseTypographyFoundation.familytitleLog,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontSize: 15,
              fontFamily: NoTePaseTypographyFoundation.familyHeadings,
              height: 1.35,
            ),
          ),
          const Spacer(),
          OnbActions(
            outlined: outlined,
            primaryText: primaryText,
            onPrimary: onPrimary,
            secondaryText: secondaryText,
            onSecondary: onSecondary,
            showArrow: showArrow,
          ),
        ],
      ),
    );
  }
}
