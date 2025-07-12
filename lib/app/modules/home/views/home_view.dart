import 'package:cybpress_app/app/common_widget/home_card.dart';
import 'package:cybpress_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ABC HOSPITAL'), centerTitle: true),
      body: Column(
        children: [
          HomeCard(
            tittle: 'Doctors',
            onClick: () {
              Get.toNamed(Routes.DOCTORS);
            },
          ),
          HomeCard(tittle: 'Health Records', onClick: () {}),
          HomeCard(tittle: 'Appointment Summery', onClick: () {}),
          HomeCard(tittle: 'Emergency  card', onClick: () {}),
        ],
      ),
    );
  }
}
