import 'package:news_app/shared/constant/app_imports.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).searchData;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  // onChanged: (value) {
                  //   AppCubit.get(context).getSearchData(q: _controller.text);
                  // },

                  onFieldSubmitted: (value) {
                    AppCubit.get(context).getSearchData(q: _controller.text);
                  },
                  controller: _controller,
                  decoration: InputDecoration(
                    label: Text("Search"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ConditionalBuilder(
                    condition: list.length > 0,
                    builder: (context) => ListView.separated(
                      itemBuilder: (context, index) =>
                          articlesItem(context, list[index],),
                      separatorBuilder: (context, index) =>  myDivider(),
                      itemCount: list.length,
                    ),
                    fallback: (context) =>
                        lodingItem(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
