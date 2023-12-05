import 'package:bloc/bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/1_business/businessScreen.dart';
import 'package:news_app/model/2_sports/sportsScreen.dart';
import 'package:news_app/model/3_science/ScienceScreen.dart';
import 'package:news_app/model/4_setting/SettingScreen.dart';
import 'package:news_app/network/cacheHelper/cacheHelper.dart';
import 'package:news_app/network/remot/dio_Helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitionalState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<Map<dynamic, dynamic>> sportList = [];
  List<Map<dynamic, dynamic>> scienceList = [];

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];

  bool isDark = false;

  void changeNavBarIcon(int index) {
    currentindex = index;
    emit(AppBouttonNavBarState());
  }

  void changhThemeMode({bool? fromSheard}) {
    if(fromSheard != null){
      isDark = fromSheard;
      emit(AppChangeThemeModeState());
    }else{
      isDark = !isDark;
      CacheHelper.setData(key: 'isDark', value: isDark).then((value){
        emit(AppChangeThemeModeState());
      });
    }
     }

  List<dynamic> businessList = [];
  void getBusinessDate() {
    emit(AppGetBusinessLodingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      quary: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'd17ebe0c22724983be64e23c7d2af76b',
      },
    ).then((value) {
      businessList = value.data['articles'];
      // print(businessList[1]['urlToImage']);
      emit(AppGetBusinessDataSuccessState());
    }).catchError((error) {
      print('Error when get data ${error.toString()}');
      emit(AppGetBusinessDataErrorState());
    });
  }

  List<dynamic> SportList = [];
  void getSportDate() {
    emit(AppGetSportLodingState());
    if (SportList.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        quary: {
          'country': 'us',
          'category': 'sport',
          'apiKey': 'd17ebe0c22724983be64e23c7d2af76b',
        },
      ).then((value) {
        SportList = value.data['articles'];
        emit(AppGetSportDataSuccessState());
      }).catchError((error) {
        print('Error when get data ${error.toString()}');
        emit(AppGetSportDataErrorState());
      });
    } else {
      emit(AppGetSportDataSuccessState());
    }
  }

  List<dynamic> ScienceList = [];
  void getscienceDate() {
    emit(AppGetScienceLodingState());
    if (ScienceList.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        quary: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'd17ebe0c22724983be64e23c7d2af76b',
        },
      ).then((value) {
        ScienceList = value.data['articles'];
        emit(AppGetScienceDataSuccessState());
      }).catchError((error) {
        print('Error when get data ${error.toString()}');
        emit(AppGetScienceDataSuccessState());
      });
    } else {
      emit(AppGetScienceDataSuccessState());
    }
  }

  List<dynamic> SearchList = [];
  void getSearchDate(String value) {
    emit(AppGetSearchLodingState());
    DioHelper.getData(
      url: 'v2/everything',
      quary: {
        'q': '$value',
        'apiKey': 'd17ebe0c22724983be64e23c7d2af76b',
      },
    ).then((value) {
      SearchList = value.data['articles'];
      emit(AppGetSearchDataSuccessState());
    }).catchError((error) {
      print('Error when get data ${error.toString()}');
      emit(AppGetSearchDataErrorState());
    });

  }
}
