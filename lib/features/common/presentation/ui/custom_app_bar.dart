import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 50); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: CurvePainter(context),
        child: Center(
          child: AppBar(
            title: Text('Home'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final BuildContext context;

  CurvePainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Theme.of(context)
          .colorScheme
          .inversePrimary // Adjust the color as needed
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.85,
        size.width,
        size.height * 0.7,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
