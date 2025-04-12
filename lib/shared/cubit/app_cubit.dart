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
    // if(curentIndex == 1)
    //   getSportsData();
    // if(curentIndex == 2)
    //   getSciencesData();
    emit(AppButtonNavStates());
  }

  List<dynamic> busniess = [];
  void getBusinessData() async {
    emit(AppGetBusinessLodingStates());
    await DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '92efe8b0717e4c8c8377ea5082ccd340',
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
    emit(AppGetSportsLodingStates());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '92efe8b0717e4c8c8377ea5082ccd340',
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
  }

  List<dynamic> sciences = [];
  void getSciencesData() async {
    emit(AppGetSciencesLodingStates());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '92efe8b0717e4c8c8377ea5082ccd340',
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
  }
}
