import 'package:get/get.dart';

import '../modules/doctor_detail/bindings/doctor_detail_binding.dart';
import '../modules/doctor_detail/views/doctor_detail_view.dart';
import '../modules/doctors/bindings/doctors_binding.dart';
import '../modules/doctors/views/doctors_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORS,
      page: () => const DoctorsView(),
      binding: DoctorsBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_DETAIL,
      page: () => const DoctorDetailView(),
      binding: DoctorDetailBinding(),
    ),
  ];
}
