import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/webview_Screen/webviewScreen.dart';

Widget ItemBuilder(model,context) => InkWell(
  onTap: () {
  navgat_To(Webview_Screen('${model['url']}'), context);
  },
  child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('${model['urlToImage']}'),
                    // image: NetworkImage('${articles['urlToImage']}'),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              width: 10,

            ),

            Expanded(

              child: Container(

                height: 120,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${model['title']}',
                        // '${articles['title']}',
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Text(
                      '${model['publishedAt']}',
                      // '${articles['publishedAt']}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
);

Widget lineSpaser()=> Container(width: double.infinity, height: 2, color: Colors.grey[300],);

void navgat_To(Widget goTo , context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => goTo,));
}

Widget artical_List({
  required List list
})=> ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context, index) => ItemBuilder(list[index] , context),
  separatorBuilder: (context, index) => lineSpaser(),
  itemCount: list.length,
);
