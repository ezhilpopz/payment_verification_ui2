import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment2/screens/congrats.dart';
import 'package:payment2/widgets/custombottombar.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PaymentVerificationScreen extends StatefulWidget {
  const PaymentVerificationScreen({super.key});

  @override
  State<PaymentVerificationScreen> createState() =>
      _PaymentVerificationScreenState();
}

class _PaymentVerificationScreenState extends State<PaymentVerificationScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: GradientText("Payment & Verification",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
            colors: [Color(0xffC1272D), Color(0xff95486F), Color(0xff676AB2)]),
        leading: Image.asset(
          'assets/images/appBarMenu.png',
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Your paragraph text (40) 1.png',
              height: 200,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Image.asset('assets/images/Group 1261156329.png'),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              'Payment Successful',
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFC08B6C)),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Congrtas(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC08B6C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.58))),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ))
          ],
        ),
      )),
      bottomNavigationBar: Custombottombar(
          currentIndex: currentIndex,
          onTabSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
