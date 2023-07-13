import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_state.dart';
import 'package:go_router/go_router.dart';

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
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                      Color.fromRGBO(61, 61, 61, 1),
                                      Color.fromRGBO(51, 51, 51, 1),
                                      Color.fromRGBO(51, 51, 51, 1),
                                      Color.fromRGBO(61, 61, 61, 1),
                                      Color.fromRGBO(61, 61, 61, 1),
                                      Color.fromRGBO(71, 71, 71, 1),
                                      Color.fromRGBO(81, 81, 81, 1),
                                    ])),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _signInButton(
                                          title: "SIGN-UP",
                                          onTap: () => context
                                            ..pop()
                                            ..push("/signUp"),
                                        ),
                                        const SizedBox(width: 12),
                                        _signInButton(
                                          title: "E-MAIL",
                                          onTap: () {},
                                        ),
                                        const SizedBox(width: 12),
                                        _signInButton(
                                          title: "GOOGLE",
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  GestureDetector _signInButton({
    required String title,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();

        onTap();
      },
      child: Container(
        width: 95,
        height: 95,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(61, 61, 61, 1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(90),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(31, 31, 31, 1),
                  Color.fromRGBO(51, 51, 51, 1),
                  Color.fromRGBO(61, 61, 61, 1),
                  Color.fromRGBO(61, 61, 61, 1),
                  Color.fromRGBO(41, 41, 41, 1),
                  Color.fromRGBO(41, 41, 41, 1),
                  Color.fromRGBO(51, 51, 51, 1),
                ])),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              border: Border.all(width: 4, color: Colors.white30)),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white70,
                fontSize: 13),
          )),
        ),
      ),
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
