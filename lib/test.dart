import 'package:flutter/material.dart';

class MyTextFieldPage extends StatefulWidget {
  @override
  _MyTextFieldPageState createState() => _MyTextFieldPageState();
}

class _MyTextFieldPageState extends State<MyTextFieldPage> {
  TextEditingController controller = TextEditingController();

  // @override
  // void dispose() {
  //   // من المهم التخلص من الـ controller عند عدم الحاجة إليه لتجنب تسرب الذاكرة.
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حقل إدخال لا يمسح'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'أدخل نصًا',
              ),
              onChanged: (value) {
                setState(() {});
                print('تم تحديث الصفحة. النص الحالي: ${controller.text}');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // عند الضغط على الزر، سيتم إعادة بناء الصفحة ولكن النص سيبقى.
                setState(() {});
                print('تم تحديث الصفحة. النص الحالي: ${controller.text}');
              },
              child: Text('تحديث الصفحة'),
            ),
            SizedBox(height: 20),
            Text('النص المدخل: ${controller.text}'),
          ],
        ),
      ),
    );
  }
}