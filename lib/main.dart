import 'package:cybpress_app/app/routes/app_pages.dart';
import 'package:cybpress_app/app/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "CYBPRESS",
      // initialRoute: AppPages.INITIAL,
       initialRoute: AppPages.initial,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          theme: AppTheme.defaultTheme,
          darkTheme: AppTheme.defaultTheme,
          themeMode: ThemeMode.light,
      ),
    
  );
}