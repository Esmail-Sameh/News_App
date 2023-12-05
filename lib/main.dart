import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/model/search/search.dart';
import 'package:news_app/network/cacheHelper/cacheHelper.dart';
import 'package:news_app/network/remot/dio_Helper.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'cubit/observer.dart';
import 'model/webview_Screen/webviewScreen.dart';
import 'news_Layout/newsLayout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = AppBlocObserver();
  Webview_Screen.initState();
  DioHelper.init();
  // CacheHelper.setData(key: 'isDark', value: true);
  var isDark = CacheHelper.getData(key: 'isDark');
  runApp(App(true));
}

class App extends StatelessWidget {

  late final bool isDark;
  App(this.isDark);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()..changhThemeMode(fromSheard: isDark)),
        BlocProvider(create: (context) => AppCubit()..getBusinessDate()..getscienceDate()..getSportDate(),),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.deepOrange,
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedIconTheme: IconThemeData(
                    color: Colors.grey,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 25.0,
                  type: BottomNavigationBarType.fixed),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.deepOrange,
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  color: HexColor('333739'),
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarBrightness: Brightness.light,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedIconTheme: IconThemeData(
                    color: Colors.grey,
                  ),
                  backgroundColor: HexColor('333739'),
                  elevation: 25.0,
                  type: BottomNavigationBarType.fixed),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home:NewsLayout(),
          );
        },
      ),
    );
  }
}
