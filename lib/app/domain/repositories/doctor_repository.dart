

import 'package:cybpress_app/app/domain/model/doctor_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cybpress_app/app/domain/network/network_api_services.dart';
import 'package:cybpress_app/app/failure/failure.dart';



class DoctorRepository extends NetworkApiServices {
  Future<Either<Failure, List<DoctorListModel>>> getDoctorList() async {
    try {
      dynamic response = await getApi(
        "https://686f534991e85fac42a07d85.mockapi.io/api/v1/test/doctors",
      );

      if (response != null && response is List) {
        List<DoctorListModel> data = response
            .map<DoctorListModel>((json) => DoctorListModel.fromJson(json))
            .toList();
        return Right(data);
      } else {
        return Left(Failure("Invalid response format"));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // Future<Either<Failure, List<DoctorListModel>>> getDoctorDetails({required String doctorId}) async {
  //   try {
  //     dynamic response = await getApi(
  //       "https://686f534991e85fac42a07d85.mockapi.io/api/v1/test/doctors:id$doctorId",
  //     );

  //     if (response != null && response is List) {
  //       List<DoctorListModel> data = response
  //           .map<DoctorListModel>((json) => DoctorListModel.fromJson(json))
  //           .toList();
  //       return Right(data);
  //     } else {
  //       return Left(Failure("Invalid response format"));
  //     }
  //   } catch (e) {
  //     return Left(Failure(e.toString()));
  //   }
  // }
  Future<Either<Failure, List<DoctorListModel>>> getDoctorDetails({
  required String doctorId,
}) async {
  try {
    final response = await getApi(
      "https://686f534991e85fac42a07d85.mockapi.io/api/v1/test/doctors/$doctorId",
    );

    if (response != null && response is Map<String, dynamic>) {
      // API returns a single object, not a list
      DoctorListModel doctor = DoctorListModel.fromJson(response);
      return Right([doctor]); // Wrap in list to match return type
    } else {
      return Left(Failure("Invalid response format"));
    }
  } catch (e) {
    return Left(Failure(e.toString()));
  }
}
}
