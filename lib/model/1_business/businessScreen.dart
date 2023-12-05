import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/counbonant/combonant.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit , AppStates>(
     listener: (context, state) {},
      builder: (context, state) {
       var list = AppCubit.get(context).businessList;

       return ConditionalBuilder(
           condition: state is! AppGetBusinessLodingState,
           builder: (context) =>artical_List(list: list),
           fallback: (context) => Center(child: CircularProgressIndicator()),
       );


      },
    );
  }
}
