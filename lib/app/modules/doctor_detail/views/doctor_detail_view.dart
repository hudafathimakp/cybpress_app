import 'package:cybpress_app/app/common_widget/common_text/common_text.dart';

import 'package:cybpress_app/app/domain/network/status.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailView extends GetView<DoctorDetailController> {
  const DoctorDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.rxRequestStatus.value == Status.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.data.isEmpty) {
          return Center(
            child: NormalText(
              text: controller.error.value.isNotEmpty
                  ? controller.error.value
                  : 'No doctor data found.',
              color: Colors.red,
            ),
          );
        }

        final doctor = controller.data.first;

        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.network(
                doctor.image ?? '',
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 280,
                  color: Colors.grey[300],
                  child: const Icon(Icons.person, size: 100),
                ),
              ),
            ),

            Positioned(
              top: 240,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name, department, gender
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(
                                  text: doctor.name ?? '',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                NormalText(
                                  text: doctor.department ?? '',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          NormalText(
                            text: doctor.gender ?? '',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const NormalText(
                        text: 'About',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      const NormalText(
                        text:
                            'The holder of an accredited academic degree • A medical practitioner, including: Audiologist • Dentist • Optometrist • Physician • Other roles\n\nThe holder of an accredited academic degree • A medical practitioner, including: Audiologist • Dentist • Optometrist • Physician • Other roles',
                        fontSize: 14,
                        color: Colors.grey,
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(
                                  text: 'Time:',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 4),
                                NormalText(
                                  text: 'Location:',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(
                                  text: doctor.time ?? '',
                                  fontSize: 14,
                                ),
                                const SizedBox(height: 4),
                                NormalText(
                                  text: doctor.location ?? '',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Book Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'BOOK AN APPOINTMENT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
