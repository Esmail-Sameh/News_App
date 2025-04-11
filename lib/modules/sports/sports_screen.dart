import '../../shared/constant/app_imports.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sports Screen",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}
