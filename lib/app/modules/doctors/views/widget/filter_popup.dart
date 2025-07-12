import 'package:cybpress_app/app/common_widget/common_text/common_text.dart';
import 'package:cybpress_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPopup extends StatelessWidget {
  final RxString selectedGender;
  final RxString selectedTime;
  final VoidCallback onSubmit;

  const FilterPopup({
    super.key,
    required this.selectedGender,
    required this.selectedTime,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const NormalText(
              text: 'Filter by',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),

            // Gender section
            const Align(
              alignment: Alignment.centerLeft,
              child: NormalText(
                text: 'Gender',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['male', 'female', 'others']
                    .map(
                      (gender) => Row(
                        children: [
                          Radio<String>(
                            value: gender,

                            groupValue: selectedGender.value,
                            onChanged: (value) {
                              selectedGender.value = value!;
                            },
                          ),
                          NormalText(text: gender.toUpperCase(), fontSize: 10),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 15),

            // Time section
            const Align(
              alignment: Alignment.centerLeft,
              child: NormalText(text: 'TIME', fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Row(
                children: [
                  FilterChip(
                    label: NormalText(
                      text: '6:00 AM - 12:00 PM',
                      color: AppColor.textGrayColor,
                      fontSize: 8,
                    ),
                    selected: selectedTime.value == '6-12',
                    onSelected: (_) => selectedTime.value = '6-12',
                    selectedColor: Colors.black,
                    labelStyle: TextStyle(
                      color: selectedTime.value == '6-12'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  FilterChip(
                    label: NormalText(
                      text: '12:00 PM - 09:00 PM',
                      fontSize: 8,
                      color: AppColor.textGrayColor,
                    ),
                    selected: selectedTime.value == '12-9',
                    onSelected: (_) => selectedTime.value = '12-9',
                    selectedColor: Colors.black,
                    labelStyle: TextStyle(
                      color: selectedTime.value == '12-9'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

          
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onSubmit,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.black,
                    ),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
