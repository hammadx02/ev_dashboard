import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleConfigOptionsTile extends StatelessWidget {
  final String text;
  final bool showAddIcon;
  const VehicleConfigOptionsTile({
    required this.text,
    this.showAddIcon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(.85),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (showAddIcon)
          Icon(
            CupertinoIcons.add,
            color: Colors.white,
            size: 25,
          ),
      ],
    );
  }
}
