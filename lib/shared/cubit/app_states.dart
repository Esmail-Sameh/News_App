abstract class AppStates {}

class AppInitialStates extends AppStates{}

class AppButtonNavStates extends AppStates{}

class AppGetBusinessLodingStates extends AppStates{}

class AppGetBusinessDataSuccess extends AppStates{}

class AppGetBusinessDataError extends AppStates{
  final String error;
  AppGetBusinessDataError(this.error);
}

class AppGetSportsLodingStates extends AppStates{}

class AppGetSportsDataSuccess extends AppStates{}

class AppGetSportsDataError extends AppStates{
  final String error;
  AppGetSportsDataError(this.error);
}

class AppGetSciencesLodingStates extends AppStates{}

class AppGetSciencesDataSuccess extends AppStates{}

class AppGetSciencesDataError extends AppStates{
  final String error;
  AppGetSciencesDataError(this.error);
}


