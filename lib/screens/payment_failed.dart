import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment2/screens/payment_verification.dart';
import 'package:payment2/widgets/custombottombar.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PaymentVerificationFailScreen extends StatefulWidget {
  const PaymentVerificationFailScreen({super.key});

  @override
  State<PaymentVerificationFailScreen> createState() =>
      _PaymentFailureScreenState();
}

class _PaymentFailureScreenState extends State<PaymentVerificationFailScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: GradientText("Profile Verification",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 16),
              colors: [
                Color(0xffC1272D),
                Color(0xff95486F),
                Color(0xff676AB2)
              ]),
          centerTitle: true,
          leading: Image.asset(
            'assets/images/appBarMenu.png',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: Image.asset("assets/images/Ellipse.png"),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/Illustration (1) 1.png',
                      height: 195,
                      width: 212,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                "Your payment was not\nsuccessful. Please try again",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color(0xffC1272D),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "We encountered an issue with your payment\nPlease try again",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color(0xFF030303),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: size.height * 0.06),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentVerificationScreen()));
                },
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: Text(
                  "Try again",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC08B6C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Custombottombar(
            currentIndex: currentIndex,
            onTabSelected: (index) => setState(() {
                  currentIndex = index;
                })));
  }
}
