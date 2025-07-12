import 'package:cybpress_app/app/common_widget/common_text/common_text.dart';
import 'package:cybpress_app/app/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String tittle;
  final VoidCallback onClick;
  const HomeCard({super.key, required this.tittle, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onClick,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: AppColor.cardColor2,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: tittle, fontSize: 15),
                Icon(Icons.arrow_drop_down_sharp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
