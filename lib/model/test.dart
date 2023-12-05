import 'package:flutter/material.dart';
import 'package:news_app/network/cacheHelper/cacheHelper.dart';


class Test extends StatelessWidget {

  final   controlar = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
         children: [
           TextFormField(
             controller: controlar,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Enter the value',
             ),

           ),
           SizedBox(height: 70,),
           Container(
             width: double.infinity,
             height: 50,
             decoration: BoxDecoration(
               color: Colors.blue,
               borderRadius: BorderRadius.circular(5),
             ),
             child: MaterialButton(
                 onPressed: (){
                   CacheHelper.setData(key: 'userName', value: controlar.text);

                 },
                 child: Text('SetData' , style: TextStyle(color: Colors.white , fontSize: 18)),
             ),
           ),
           SizedBox(height: 15,),
           Container(
             width: double.infinity,
             height: 50,
             decoration: BoxDecoration(
               color: Colors.blue,
               borderRadius: BorderRadius.circular(5),
             ),
             child: MaterialButton(
               onPressed: (){
                 print('user Name is: ${CacheHelper.getData(key: 'userName')}');
               },
               child: Text('getData' , style: TextStyle(color: Colors.white , fontSize: 18)),
             ),
           ),
           SizedBox(height: 15,),
         ],
        ),
      )
    );
  }
}
