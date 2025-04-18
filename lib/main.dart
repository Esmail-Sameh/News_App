import 'package:news_app/shared/constant/app_imports.dart';


void main() {
  Bloc.observer = const SimpleBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeLayout(),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: cubit.isDark ?ThemeMode.dark :ThemeMode.light,
          );
        },
      ),
    );
  }
}