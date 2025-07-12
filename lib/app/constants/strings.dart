

const String kBaseUrl = s1;

const bool isStaging = true;

const String s1 = "https://test.myfliqapp.com/api/v1";

class LocalStorageKey {
  static String token = "USER_TOKEN";
  static String type = "USER_TYPE";
  static String stallId = "STALL_ID";
  static double rating = 5;
  static String stallName = "STALL_NAME";
  static String userName = "USER_NAME";
  static String address = "ADDRESS";
  static String phone = "PHONE";
  static String department = "DEPARTMENT";
  static String websiteAddress = "WEBSITE";
}

class AppSettings {
  int appVersionNo = 18;
  String versioncode = '1.0.18';
  bool isStaging = true;
  int timeout = 10;

  static String userId = '';
  String name = '';
}
