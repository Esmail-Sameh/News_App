abstract class AppStates {}

class AppInitialStates extends AppStates{}

class AppButtonNavStates extends AppStates{}

class AppLodingBusinessStates extends AppStates{}

class AppGetBusinessDataSuccess extends AppStates{}

class AppGetBusinessDataError extends AppStates{
  final String error;
  AppGetBusinessDataError(this.error);
}

