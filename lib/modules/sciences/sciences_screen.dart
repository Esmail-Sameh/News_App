import '../../shared/constant/app_imports.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).sciences;
        return articlesBuilder(list, context);
      },
    );
  }
}
