import '../../shared/constant/app_imports.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).sports;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => articlesItem(
              context,
              list[index],
            ),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length,
          ),
          fallback: (context) =>
              lodingItem(context),
        );
      },
    );
  }
}
