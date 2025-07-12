import 'package:cybpress_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:sizer/sizer.dart';



// This class is responsible for defining the default theme data for your application.
class AppTheme {
  // We declare a private constructor to ensure that this class can't be instantiated or extended.
  AppTheme._();

  // This is your default theme for the application.
  static ThemeData defaultTheme = ThemeData(
    // Setting the default font family for the application.
    fontFamily: "Proxima",
    // Setting the default background color for scaffolds in the application.
    scaffoldBackgroundColor: AppColor.background,
    primaryColor: AppColor.primary,

    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
        statusBarIconBrightness: Brightness.dark,
      ),
      // Setting the background color for app bars in the application.
      backgroundColor: AppColor.white,
      // Setting the color and size for icons within app bars in the application.
      // iconTheme: IconThemeData(
      //   color: AppColor.black,
      //   size: 14.sp,
      // ),
      // Setting the foreground color for app bars in the application.

      foregroundColor: AppColor.black,
      // Setting the elevation for app bars in the application.
      elevation: 0,
      // Aligning the title to the start of the app bar.
      // centerTitle: false,
      // // Setting the text style for titles within app bars in the application.
      // titleTextStyle: TextStyle(
      //   fontSize: 12.sp,
      //   fontWeight: FontWeight.w600,
      //   color: Colors.black54,
      //   fontFamily: "Montserrat",
      // ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // Setting the default elevation for elevated buttons in the application.
        elevation: WidgetStateProperty.all(0),
        // Setting the text style for elevated buttons in the application.
        textStyle: WidgetStateProperty.all(
          TextStyle(
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.w600,
            //++fontSize: 8.sp,
          ),
        ),
        // Setting the foreground color for elevated buttons in the application.
        foregroundColor: WidgetStateProperty.all(AppColor.background),
        // Setting the minimum size for elevated buttons in the application.
        minimumSize: WidgetStateProperty.all(
         Size(40, 38),
        ),
      ),
    ),
  );
}
