import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../../counbonant/combonant.dart';

class Search extends StatelessWidget {


  var search_controlar= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).SearchList;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: search_controlar,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    AppCubit.get(context).getSearchDate(value);
                  },
                  onFieldSubmitted: (value) {
                    AppCubit.get(context).getSearchDate(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                  child:ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => ItemBuilder(list[index] , context),
                    separatorBuilder: (context, index) => lineSpaser(),
                    itemCount: list.length,
                  ) ,
              ),


            ],
          ),
        );
      },
    );
  }
}
