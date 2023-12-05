import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../counbonant/combonant.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).ScienceList;

        return ConditionalBuilder(
          condition: state is! AppGetScienceLodingState,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => ItemBuilder(list[index] , context),
            separatorBuilder: (context, index) => lineSpaser(),
            itemCount: list.length,
          ) ,
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );


      },
    );
  }
}
