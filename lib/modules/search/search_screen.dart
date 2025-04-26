import 'package:news_app/shared/constant/app_imports.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).searchData;
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    onFieldSubmitted: (value) {
                      AppCubit.get(context).getSearchData(q: _controller.text);
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      label: Text(
                        "Search",
                        style: TextStyle(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                      counterStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: articlesBuilder(list, context, isSearching: true),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
