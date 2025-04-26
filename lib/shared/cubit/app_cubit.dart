import '../constant/app_imports.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

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
    emit(AppButtonNavState());
  }

  List<dynamic> busniess = [];
  void getBusinessData() async {
    emit(AppGetBusinessLodingState());
    await DioHelper.getData(
      url: METHOD,
      query: {
        AppString.country: 'us',
        AppString.category: AppString.businessCategory,
        AppString.apiKey: APIKEY,
      },
    ).then((value) {
      busniess = value.data['articles'];
      emit(AppGetBusinessDataSuccessState());
    }).catchError((error) {
      emit(
        AppGetBusinessDataErrorState(
          error.toString(),
        ),
      );
    });
  }

  List<dynamic> sports = [];
  void getSportsData() async {
    if (sports.length == 0) {
      emit(AppGetSportsLodingState());
      DioHelper.getData(url: METHOD, query: {
        AppString.country: 'us',
        AppString.category: AppString.sportsCategory,
        AppString.apiKey: APIKEY,
      }).then(
        (value) {
          sports = value.data['articles'];
          emit(AppGetSportsDataSuccessState());
        },
      ).catchError(
        (error) {
          emit(AppGetSportsDataErrorState(error.toString()));
        },
      );
    } else {
      emit(AppGetSportsDataSuccessState());
    }
  }

  List<dynamic> sciences = [];
  void getSciencesData() async {
    if (sciences.length == 0) {
      emit(AppGetSciencesLodingState());
      DioHelper.getData(url: METHOD, query: {
        AppString.country: 'us',
        AppString.category: AppString.scienceCategory,
        AppString.apiKey: APIKEY,
      }).then(
        (value) {
          emit(AppGetSciencesDataSuccessState());
          sciences = value.data['articles'];
        },
      ).catchError(
        (error) {
          emit(AppGetSciencesDataErrorState(error.toString()));
        },
      );
    } else {
      emit(AppGetSciencesDataSuccessState());
    }
  }

  bool isDark = CacheHelper.getBoolean(key: "isDark") ?? false;
  void changeThemeMode() {
    isDark = !isDark;
    CacheHelper.putBoolean(key: "isDark", value: isDark);
    emit(AppChangeModeState());
    changeColorText();
  }

  void changeColorText() {
    Future.delayed(
        const Duration(milliseconds: 150), () => emit(AppChangeModeState()));
  }

  List<dynamic> searchData = [];
  void getSearchData({required String q}) async {
    emit(AppGetSearchLodingState());

    await DioHelper.getData(url: SEARCH_METHOD, query: {
      'q': q,
      AppString.apiKey: APIKEY,
    }).then(
      (value) {
        emit(AppGetSearchDataSuccessState());
        searchData = value.data['articles'];
      },
    ).catchError((error) {
      emit(AppGetSearchDataErrorState(error.toString()));
    });
  }
}
