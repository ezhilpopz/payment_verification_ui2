import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment2/screens/payment_verification.dart';
import 'package:payment2/widgets/custombottombar.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Congrtas extends StatefulWidget {
  const Congrtas({super.key});

  @override
  State<Congrtas> createState() => _CongrtasState();
}

class _CongrtasState extends State<Congrtas> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText("Training + Internship",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 20),
            colors: [Color(0xffC1272D), Color(0xff95486F), Color(0xff676AB2)]),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentVerificationScreen()));
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "Congratulations on Starting Your",
              style: GoogleFonts.poppins(
                color: Color(0xffC99778),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )),
            Center(
                child: Text(
              "Corporate Journey",
              style: GoogleFonts.poppins(
                color: Color(0xffC99778),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Welcome to the Corporate Launchpad",
              style: GoogleFonts.poppins(
                color: Color(0xff333333),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )),
            Center(
                child: Text(
              "Program",
              style: GoogleFonts.poppins(
                color: Color(0xff333333),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                'assets/images/Group 1261157288.png',
                scale: 1.1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "Your program details and guidance roadmap",
              style: GoogleFonts.poppins(
                color: Color(0xff333333),
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            )),
            Center(
                child: Text(
              " have been sent to your registered email",
              style: GoogleFonts.poppins(
                color: Color(0xff333333),
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Congrtas(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC99778),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.58))),
                  child: const Text(
                    'Go to Dashboard',
                    style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )),
            )
          ],
        ),
      ),
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
