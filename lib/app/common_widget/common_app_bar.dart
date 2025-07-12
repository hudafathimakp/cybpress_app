import 'package:cybpress_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final bool? isBack;
  final VoidCallback? isFilterTap;
  final VoidCallback? isPdfTap;
  final VoidCallback? onBackPressed;

  const CommonAppBar({
    super.key,
    required this.label,

    this.isBack = true,
    this.onBackPressed,
    this.isPdfTap,
    this.isFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isBack != false
          ? IconButton(
              icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
              onPressed:
                  onBackPressed ??
                  () {
                    Get.back();
                  },
            )
          : null,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow (x,y)
            ),
          ],
          color: AppColor.primary,
        ),
      ),
      title: isBack != false
          ? Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
      actions: [
        IconButton(
          icon: const Icon(Icons.tune_rounded, color: Colors.white),
          onPressed: isFilterTap,
        ),

        IconButton(
          onPressed: isPdfTap,
          icon: const Icon(Icons.picture_as_pdf_outlined, color: Colors.white),
        ),
      ],
      elevation: 5,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
