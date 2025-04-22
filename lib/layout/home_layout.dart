import 'package:news_app/modules/search/search_screen.dart';

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
              ///  Search Icon  ///
              IconButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),) );
                },
                icon: const Icon(Icons.search),
              ),
              ///  Change Theme Mode Icon  ///
              IconButton(
                onPressed: () {
                  cubit.changeThemeMode();
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
