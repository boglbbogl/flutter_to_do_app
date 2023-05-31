import 'package:flutter/material.dart';
import 'package:flutter_to_do/_src/presentation/main/user_state_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(61, 61, 61, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
        title: const Text(
          "TODO",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.deepOrange,
          ),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: UserStateWidget()),
      ),
    );
  }
}
