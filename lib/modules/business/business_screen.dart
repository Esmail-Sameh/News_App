import '../../shared/constant/app_imports.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition: state != AppGetBusinessLodingStates(),
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) =>
                  articlesItem(context, cubit.busniess[index]),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(20),
                child: Divider(
                  color: Colors.grey,
                  height: 3.0,
                ),
              ),
              itemCount: cubit.busniess.length,
            ),
            fallback: (context) =>
                Center(child: const CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
