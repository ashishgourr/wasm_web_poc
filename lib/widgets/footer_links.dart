import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/footer.dart';

class FooterLink extends StatelessWidget {
  final Footer footer;
  const FooterLink({Key? key, required this.footer});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final double titleFontSize = isSmallScreen ? 16.0 : 20.0;
    final double parameterFontSize = isSmallScreen ? 14.0 : 16.0;
    final double titleSpacing = isSmallScreen ? 10.0 : 20.0;
    final double parameterSpacing = isSmallScreen ? 8.0 : 10.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          footer.title,
          style: GoogleFonts.quicksand(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: titleSpacing,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: footer.parameters
              .map(
                (params) => Padding(
                  padding: EdgeInsets.symmetric(vertical: parameterSpacing),
                  child: Text(
                    params,
                    style: GoogleFonts.quicksand(
                      fontSize: parameterFontSize,
                      fontWeight: FontWeight.w700,
                      color: Colors.black45,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
