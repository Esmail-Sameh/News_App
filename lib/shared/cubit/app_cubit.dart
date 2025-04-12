import '../constant/app_imports.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;

  List<BottomNavigationBarItem> item = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: AppString.appBusinessScreenTitleText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: AppString.appSportsScreenTitleText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: AppString.appScienceScreenTitleText,
    ),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const SciencesScreen(),
  ];
  List<String> appTitle = [
    AppString.appBusinessScreenTitleText,
    AppString.appSportsScreenTitleText,
    AppString.appScienceScreenTitleText,
  ];

  void narBarChange(int index) {
    curentIndex = index;
    if (curentIndex == 1) getSportsData();
    if (curentIndex == 2) getSciencesData();
    emit(AppButtonNavStates());
  }

  List<dynamic> busniess = [];
  void getBusinessData() async {
    emit(AppGetBusinessLodingStates());
    await DioHelper.getData(
      url: METHOD,
      query: {
        AppString.country: 'us',
        AppString.category: AppString.businessCategory,
        AppString.apiKey: APIKEY,
      },
    ).then((value) {
      busniess = value.data['articles'];
      emit(AppGetBusinessDataSuccess());
    }).catchError((error) {
      emit(
        AppGetBusinessDataError(
          error.toString(),
        ),
      );
    });
  }

  List<dynamic> sports = [];
  void getSportsData() async {
    if (sports.length == 0) {
      emit(AppGetSportsLodingStates());
      DioHelper.getData(url: METHOD, query: {
        AppString.country : 'us',
        AppString.category : AppString.sportsCategory,
        AppString.apiKey : APIKEY,
      }).then(
        (value) {
          sports = value.data['articles'];
          emit(AppGetSportsDataSuccess());
        },
      ).catchError(
        (error) {
          emit(AppGetSportsDataError(error.toString()));
          //print(error.toString);
        },
      );
    } else {
      emit(AppGetSportsDataSuccess());
    }
  }

  List<dynamic> sciences = [];
  void getSciencesData() async {
    if (sciences.length == 0) {
      emit(AppGetSciencesLodingStates());
      DioHelper.getData(url: METHOD, query: {
        AppString.country: 'us',
        AppString.category: AppString.scienceCategory,
        AppString.apiKey: APIKEY,
      }).then(
        (value) {
          emit(AppGetSciencesDataSuccess());
          sciences = value.data['articles'];
        },
      ).catchError(
        (error) {
          emit(AppGetSciencesDataError(error.toString()));
          //print(error.toString);
        },
      );
    } else {
      emit(AppGetSciencesDataSuccess());
    }
  }
}
