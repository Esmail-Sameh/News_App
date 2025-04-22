import 'package:news_app/modules/web_view/web_view.dart';
import 'package:news_app/shared/constant/app_imports.dart';
import 'package:news_app/test.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
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
            //home: WebViewScreen(),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: cubit.isDark ?ThemeMode.dark :ThemeMode.light,
          );
        },
      ),
    );
  }
}