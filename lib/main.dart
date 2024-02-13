import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signal_poc/colors.dart';
import 'package:signal_poc/data/repository/activity_repository_impl.dart';
import 'package:signal_poc/view/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.varelaRound().fontFamily,
        scaffoldBackgroundColor: AppColors.beige,
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent),
        appBarTheme: AppBarTheme(
          color: AppColors.mint,
          foregroundColor: AppColors.beige,
        ),
        primaryColor: AppColors.celadon,
        canvasColor: AppColors.yellow,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.mint,
            ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme:
              InputDecorationTheme(fillColor: AppColors.beige),
          menuStyle: MenuStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.beige),
              surfaceTintColor: MaterialStatePropertyAll(AppColors.beige)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 32)),
            backgroundColor: MaterialStatePropertyAll(
              AppColors.yellow,
            ),
            overlayColor: MaterialStatePropertyAll(AppColors.beige),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(fontWeight: FontWeight.bold),
            ),
            foregroundColor: MaterialStatePropertyAll(AppColors.mint),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(AppColors.yellow),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      home: HomePage(
        repository: ActivityRepositoryImpl(),
      ),
    );
  }
}
