abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppButtonNavState extends AppStates {}

class AppGetBusinessLodingState extends AppStates {}

class AppGetBusinessDataSuccessState extends AppStates {}

class AppGetBusinessDataErrorState extends AppStates {
  final String error;
  AppGetBusinessDataErrorState(this.error);
}

class AppGetSportsLodingState extends AppStates {}

class AppGetSportsDataSuccessState extends AppStates {}

class AppGetSportsDataErrorState extends AppStates {
  final String error;
  AppGetSportsDataErrorState(this.error);
}

class AppGetSciencesLodingState extends AppStates {}

class AppGetSciencesDataSuccessState extends AppStates {}

class AppGetSciencesDataErrorState extends AppStates {
  final String error;
  AppGetSciencesDataErrorState(this.error);
}

class AppChangeModeState extends AppStates{}
