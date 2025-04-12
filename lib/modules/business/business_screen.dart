import '../../shared/constant/app_imports.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: state != AppGetBusinessLodingStates(),
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                articlesItem(context, cubit.busniess[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.busniess.length,
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}