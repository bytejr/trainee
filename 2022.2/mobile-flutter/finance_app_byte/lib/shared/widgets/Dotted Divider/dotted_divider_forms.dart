import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class DottedDividerForms extends StatelessWidget {
  const DottedDividerForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Spacer(),
      Expanded(
        flex: 2,
        child: Container(
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.blue1,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
      const Spacer(),
      Expanded(
        flex: 6,
        child: Container(
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.blue1,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
      const Spacer(),
      Expanded(
        flex: 65,
        child: Container(
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.blue1,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    ]);
  }
}
