import 'package:cybpress_app/app/domain/model/doctor_view_model.dart';
import 'package:cybpress_app/app/domain/network/status.dart';
import 'package:cybpress_app/app/domain/repositories/doctor_repository.dart';
import 'package:get/get.dart';

class DoctorDetailController extends GetxController {
  final String doctorId = Get.arguments[0];
    final _repo = DoctorRepository();
  final rxRequestStatus = Status.completed.obs;
  final isLoading = false.obs;
  RxString error = ''.obs;
  RxList<DoctorListModel> data = <DoctorListModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments[0] != null) {
      getDetails();
    }
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void getDetails() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getDoctorDetails(doctorId: doctorId??'');
    res.fold(
      (failure) {
        setRxRequestStatus(Status.completed);
        setError(failure.message); 
      },
      (resData) {
        setRxRequestStatus(Status.completed);
        data.addAll(resData);
      },
    );
  }
}
