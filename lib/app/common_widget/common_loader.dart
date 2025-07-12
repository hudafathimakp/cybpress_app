import 'package:cybpress_app/app/common_widget/common_text/common_text.dart';
import 'package:cybpress_app/app/constants/colors.dart';
import 'package:flutter/material.dart';


class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: AppColor.primary,
      ),
    );
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: NormalText(
        text: 'No Data Found',
        fontSize: 20,
        color: AppColor.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
