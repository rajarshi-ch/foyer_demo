import 'package:flutter/material.dart';

class WideFab extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final bool isEnabled;
  final bool isLoading;
  final double hzPadding;
  final TextStyle? textStyle;
  final double? height;

  const WideFab({
    super.key,
    this.height,
    required this.label,
    required this.onPressed,
    this.isEnabled = false,
    this.isLoading = false,
    this.hzPadding = 8.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: hzPadding),
      width: MediaQuery.of(context).size.width,
      height: height ?? 64,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: isEnabled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceVariant,
        ),
        onPressed: isEnabled ? onPressed : null,
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                label,
                style: textStyle ??
                    TextStyle(
                      fontSize: 18,
                      color: isEnabled
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
              ),
      ),
    );
  }
}
