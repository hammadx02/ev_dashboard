import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarInfoFloatingWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const CarInfoFloatingWidget({
    required this.text1,
    required this.text2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          text2,
          style: GoogleFonts.poppins(
              color: Colors.white.withOpacity(.5),
              fontSize: 10,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
      ],
    );
  }
}
