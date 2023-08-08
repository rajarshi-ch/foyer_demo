import 'package:flutter/material.dart';

class ColorPickerCircle extends StatelessWidget {
  const ColorPickerCircle(
      {super.key, required this.color, required this.isSelected, this.onTap});

  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 64,
        height: 64,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.tertiary
                  : Color(0x001d6dff),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundColor: color),
          ),
        ),
      ),
    );
  }
}
