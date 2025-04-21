import 'app_imports.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.whiteColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      elevation: 20.0,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color:AppColors.blackColor,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundDarkColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundDarkColor,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundDarkColor,
      elevation: 20.0,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color:AppColors.whiteColor,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
