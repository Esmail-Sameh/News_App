import '../../shared/constant/app_imports.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).sports;
          return ConditionalBuilder(
            condition: list.length > 0,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) =>
                  articlesItem(context, list[index],),
              separatorBuilder: (context, index) =>  Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.grey,
                  height: 3.0,
                ),
              ),
              itemCount: list.length,
            ),
            fallback: (context) =>
                Center(child: const CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
