import 'package:cybpress_app/app/domain/model/doctor_view_model.dart';
import 'package:cybpress_app/app/domain/network/status.dart';
import 'package:cybpress_app/app/domain/repositories/doctor_repository.dart';
import 'package:get/get.dart';





class DoctorsController extends GetxController {
  final _repo = DoctorRepository();

  final rxRequestStatus = Status.completed.obs;
  final isLoading = false.obs;
  RxString error = ''.obs;


  List<DoctorListModel> fullList = [];

  RxList<DoctorListModel> data = <DoctorListModel>[].obs;

  @override
  void onInit() {
    get();
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;


  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getDoctorList();
    res.fold(
      (failure) {
        setRxRequestStatus(Status.completed);
        setError(failure.message);
      },
      (resData) {
        setRxRequestStatus(Status.completed);
        fullList = resData;
        data.assignAll(fullList);
      },
    );
  }

  
  // void applyLocalFilter({
  //   required String gender,
  //   required String timeRange,
  // }) {
  //   final filtered = fullList.where((doctor) {
  //     final matchesGender =
  //         (doctor.gender?.toLowerCase() ?? '') == gender.toLowerCase();

  //     final time = doctor.time?.toLowerCase() ?? '';
  //     final matchesTime = timeRange == '6-12'
  //         ? time.contains('6') ||
  //             time.contains('7') ||
  //             time.contains('8') ||
  //             time.contains('9') ||
  //             time.contains('10') ||
  //             time.contains('11')
  //         : time.contains('12') ||
  //             time.contains('1') ||
  //             time.contains('2') ||
  //             time.contains('3') ||
  //             time.contains('4') ||
  //             time.contains('5') ||
  //             time.contains('9');

  //     return matchesGender && matchesTime;
  //   }).toList();

  //   data.assignAll(filtered);
  // }


void applyLocalFilter({
  required String gender,
  required String timeRange,
}) {
  final filtered = fullList.where((doctor) {
    final matchesGender =
        (doctor.gender?.toLowerCase() ?? '') == gender.toLowerCase();

    final time = doctor.time ?? '';
    final startHour = _extractStartHour(time); // get starting hour in 24h

    final matchesTime = timeRange == '6-12'
        ? (startHour >= 6 && startHour < 12)
        : (startHour >= 12 && startHour < 21);

    return matchesGender && matchesTime;
  }).toList();

  data.assignAll(filtered);
}
int _extractStartHour(String time) {
  try {
    final parts = time.split('-');
    final startTime = parts.first.trim(); // e.g. "10:00am"
    final format = startTime.toLowerCase().contains('am') ? 'am' : 'pm';
    final hourStr = startTime.split(':').first.trim();
    var hour = int.tryParse(hourStr) ?? 0;

    if (format == 'pm' && hour != 12) hour += 12;
    if (format == 'am' && hour == 12) hour = 0;

    return hour;
  } catch (_) {
    return -1; // fallback if parsing fails
  }
}

  void resetFilters() {
    data.assignAll(fullList);
  }
}
