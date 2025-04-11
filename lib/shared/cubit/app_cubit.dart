import '../constant/app_imports.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;

  List<BottomNavigationBarItem> item = [
    const BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
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
}
