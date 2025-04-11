import '../constant/app_imports.dart';

Widget busniessItem(context,data) => Row(

      children: [
        /// image ///
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                "${data['urlToImage']}",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        /// title ///
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height / 7,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${data['title']}",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  "${data['publishedAt']}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
