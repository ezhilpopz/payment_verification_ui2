import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment2/screens/payment_failed.dart';
import 'package:payment2/widgets/custombottombar.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PaymentProcessing extends StatefulWidget {
  const PaymentProcessing({super.key});

  @override
  State<PaymentProcessing> createState() => _PaymentProcessingState();
}

class _PaymentProcessingState extends State<PaymentProcessing>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: false);

    _rotationAnimation =
        Tween<double>(begin: 0, end: -2 * pi).animate(_controller);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentVerificationFailScreen(),
          ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final indicatorSize = size.width * 0.27;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset(
          'assets/images/appBarMenu.png',
        ),
        title: GradientText("Payment Processing",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
            colors: [Color(0xffC1272D), Color(0xff95486F), Color(0xff676AB2)]),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer rotating arc
                AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: child,
                    );
                  },
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: indicatorSize,
                        height: indicatorSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CustomPaint(
                          painter: QuarterCirclePainter(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 89,
                  height: 89,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDBB08F),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo2.png',
                      scale: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              "Your payment is currently\nbeing processed",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDBB08F),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "This process might take around 10 minutes",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.poppins(fontSize: 14, color: Color(0xFF333333)),
            ),
            Text(
              "please wait",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.poppins(fontSize: 14, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Custombottombar(
          currentIndex: currentIndex,
          onTabSelected: (index) => setState(() {
                currentIndex = index;
              })),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC1272D)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final radius = size.width / 2;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );
    canvas.drawArc(rect, -pi / 3, pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
