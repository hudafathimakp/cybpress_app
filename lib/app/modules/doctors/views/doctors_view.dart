import 'package:cybpress_app/app/common_widget/common_app_bar.dart';
import 'package:cybpress_app/app/common_widget/common_loader.dart';
import 'package:cybpress_app/app/common_widget/common_text/common_text.dart';
import 'package:cybpress_app/app/constants/colors.dart';
import 'package:cybpress_app/app/domain/network/status.dart';
import 'package:cybpress_app/app/modules/doctors/views/widget/filter_popup.dart';
import 'package:cybpress_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctors_controller.dart';

class DoctorsView extends GetView<DoctorsController> {
  const DoctorsView({super.key});

  void showFilterDialog(BuildContext context) {
    final RxString selectedGender = 'others'.obs;
    final RxString selectedTime = '6-12'.obs;

    showDialog(
      context: context,
      builder: (_) => FilterPopup(
        selectedGender: selectedGender,
        selectedTime: selectedTime,
        onSubmit: () {
          controller.applyLocalFilter(
            gender: selectedGender.value,
            timeRange: selectedTime.value,
          );
          Get.back(); 
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: CommonAppBar(
        label: 'Doctors',
        isPdfTap: (){},
        isFilterTap: () => showFilterDialog(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => switch (controller.rxRequestStatus.value) {
            Status.loading => const CommonLoader(),
            Status.error => throw controller.error.value,
            Status.completed =>
              controller.data.isEmpty
                  ? const Center(child: NoDataWidget())
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          final item = controller.data[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(
                                Routes.DOCTOR_DETAIL,
                                arguments: [item.id.toString()],
                              );
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  // Doctor image
                                  ClipRRect(
                                    // borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      item.image ?? '',
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.25,
                                      height: 100,
                                      fit: BoxFit.fill,
                                      errorBuilder: (_, __, ___) =>
                                          const Icon(Icons.person, size: 60),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  // Doctor info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        NormalText(
                                          text: item.name.toString(),
                                          fontSize: 16,
                                        ),
                                        NormalText(
                                          text: item.department ?? "",
                                          color: AppColor.textGrayColor,
                                        ),
                                        NormalText(
                                          text: 'Gender :${item.gender ?? ""}',
                                          color: AppColor.textGrayColor,
                                        ),
                                        const SizedBox(height: 10),
                                        NormalText(
                                          text: 'Time :${item.time ?? ""}',
                                          color: AppColor.textGrayColor,
                                        ),
                                        NormalText(
                                          text:
                                              'Location :${item.location ?? ""}',
                                          color: AppColor.textGrayColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ).paddingOnly(bottom: 8),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                          height: 16,
                        ),
                      ),
                      
                    ),
          },
        ),
      ),
    );
  }
}


