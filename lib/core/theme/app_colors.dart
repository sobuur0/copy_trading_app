import 'package:flutter/material.dart';

class AppColors {
  static const Color baseBlack = Color(0xff1C2127);
  static const Color bgPrimary = Color(0xFF1C2127);
  static const Color bgSecondary = Color(0xff20252B);
  static const Color bgMisc5 = Color(0xff20252B);
  static const Color bgMisc4 = Color(0xffA7B1BC);
  static const Color bgMisc1 = Color(0xff2A2F36);
  static const Color textPrimary = Color(0xffFFFFFF);
  static const Color textSecondary = Color(0xffA7B1BC);
  static const Color textLink = Color(0xff85D1F0);
  static const Color bgBorder = Color(0xff262932);

  static const Color grayishBlue = Color(0xff767680);

  static const Color redPrimary = Color(0xffFF554A);
  static const Color textError = Color(0xffF04438);
  static const Color textSuccess = Color(0xff12B76A);

  static const LinearGradient moreForYouButtonGradient = LinearGradient(
    colors: [Color(0xff2764FF), Color(0xff1D3573)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient homeHeaderGradient = LinearGradient(
    colors: [Color(0xffC0CFFE), Color(0xffF3DFF4), Color(0xffF9D8E5)],
  );

  static const LinearGradient copyTradingCardGradient = LinearGradient(
    colors: [Color(0xffABE2F3), Color(0xffBDE4E5), Color(0xffEBE9D0)],
  );
}
