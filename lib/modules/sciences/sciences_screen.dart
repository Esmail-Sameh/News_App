import '../../shared/constant/app_imports.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).sciences;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                articlesItem(context, list[index],),
            separatorBuilder: (context, index) =>  myDivider(),
            itemCount: list.length,
          ),
          fallback: (context) =>
              Center(child: const CircularProgressIndicator()),
        );
      },
    );
  }
}
