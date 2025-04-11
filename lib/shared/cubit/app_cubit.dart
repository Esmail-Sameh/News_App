import 'package:news_app/shared/network/remote.dart';

import '../constant/app_imports.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;

  List<BottomNavigationBarItem> item = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const SciencesScreen(),
  ];

  List<String> appTitle = [
    "Business",
    "Sports",
    "Sciences",
  ];

  void narBarChange(int index) {
    curentIndex = index;
    emit(AppButtonNavStates());
  }

  List<dynamic> busniess=[];
  void getBusinessData()async {
    emit(AppLodingBusinessStates());
    await DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'92efe8b0717e4c8c8377ea5082ccd340',
      },
    ).then(
      (value){
        emit(AppGetBusinessDataSuccess());
        busniess = value.data['articles'];
        print(busniess[2]['title']);
      }
    ).catchError(
        (error){
          emit(AppGetBusinessDataError(error.toString(),),);
          print(error.toString());
        }
    );
  }


}
