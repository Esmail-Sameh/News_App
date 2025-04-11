import '../../shared/constant/app_imports.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Business Screen",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}
