import 'package:finance_app_byte/shared/themes/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final light = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
  );

  static final subtitulo =
      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16);
  static final entradaSaida =
      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 18);
  static final regular = GoogleFonts.poppins(fontWeight: FontWeight.w400);

  static final regular28 = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 28, color: AppColors.blue1);
  static final header =
      GoogleFonts.poppins(fontWeight: FontWeight.w600, color: AppColors.blue1);

  static final header18 = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.blue1);
  static final addButton =
      GoogleFonts.poppins(fontWeight: FontWeight.w700, color: AppColors.white);
  static final header22 = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 22, color: AppColors.blue1);
}
