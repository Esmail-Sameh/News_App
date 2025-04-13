import '../shared/constant/app_imports.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
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
              IconButton(
                onPressed: () {
                  cubit.changeAppMode();
                },
                icon: const Icon(Icons.light_mode_outlined),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: cubit.screens[cubit.curentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.item,
            currentIndex: cubit.curentIndex,
            onTap: (index) {
              cubit.narBarChange(index);
            },
          ),
        );
      },
    );
  }
}
