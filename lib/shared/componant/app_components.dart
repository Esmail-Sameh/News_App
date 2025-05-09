import '../constant/app_imports.dart';

Widget articlesBuilder(list, context, {bool isSearching = false}) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => articlesItem(
          context,
          list[index],
        ),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) => isSearching ? Container() : lodingItem(context),
    );

Widget articlesItem(
  context,
  data,
) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(
                    url: data["url"],
                  )),
        );
      },
      child: Row(
        children: [
          /// image ///
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: data['urlToImage'] == null
                    ? const AssetImage("assets/images/empty_image.jpg")
                    : NetworkImage(
                        "${data['urlToImage']}",
                      ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),

          /// title ///
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${data['title']}",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),

                  ///  Date  ///
                  Text(
                    "${data['publishedAt']}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget myDivider() => const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Divider(
        color: Colors.grey,
        height: 3.0,
      ),
    );

Widget lodingItem(context) => const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          "Loading",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ));
