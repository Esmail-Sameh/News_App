import '../shared/constant/app_imports.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessData()..getSportsData()..getSciencesData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.appTitle[cubit.curentIndex]),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: cubit.screens[cubit.curentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.item,
              currentIndex: cubit.curentIndex,
              onTap: (index) {
                cubit.narBarChange(index);
              },
            ),
          );
        },
      ),
    );
  }
}
