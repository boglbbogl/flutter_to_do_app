import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_state.dart';

class UserStateWidget extends StatelessWidget {
  const UserStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthCheckState) {
          return Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color.fromRGBO(61, 61, 61, 1),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(155, 155, 155, 1),
                ),
              ));
        } else {
          return Container(
            color: const Color.fromRGBO(61, 61, 61, 1),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state is AuthUserState
                        ? state.user!.email
                        : "로그인이 필요한 서비스입니다",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  if (state is AuthUserState)
                    _button(
                      title: "로그아웃",
                      color: Colors.red,
                      onTap: () {},
                    )
                  else
                    _button(
                      title: "로그인",
                      color: Colors.blue,
                      onTap: () {},
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  GestureDetector _button({
    required String title,
    required Color color,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
