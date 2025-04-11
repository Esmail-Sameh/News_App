import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news_app/shared/componant/app_componants.dart';

import '../../shared/constant/app_imports.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context, state) {},
          builder: (context, state) {
          var cubit = AppCubit.get(context);
            return ConditionalBuilder(
                condition: state != AppLodingBusinessStates(),
                builder: (context)=>ListView.separated(
                  itemBuilder: (context, index) => busniessItem(context,cubit.busniess[index]),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: Divider(height: 3,),
                  ),
                  itemCount: cubit.busniess.length,
                ),
                fallback: (context) => Center(child: const CircularProgressIndicator()),
            );
          },

      ),
    );
  }
}
