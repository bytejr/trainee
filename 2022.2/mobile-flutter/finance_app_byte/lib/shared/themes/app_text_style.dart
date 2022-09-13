import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static final light = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
  );

  static final subtitulo =
      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16);
  static final entradaSaida =
      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 18);
  static final listItemEntrada = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      shadows: <Shadow>[
        const Shadow(
          color: AppColors.v2,
          offset: Offset(0, 4),
          blurRadius: 4,
        ),
      ]);
  static final listItemSaida = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      shadows: <Shadow>[
        const Shadow(
          color: AppColors.v1,
          offset: Offset(0, 4),
          blurRadius: 4,
        ),
      ]);

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
