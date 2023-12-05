import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/counbonant/combonant.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/model/search/search.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit , AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: (){
                  cubit.changhThemeMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.bottomItem,
            currentIndex: cubit.currentindex,
            onTap: (index){
              cubit.changeNavBarIcon(index);
            },
          ),
        );
      },
    );
  }
}
