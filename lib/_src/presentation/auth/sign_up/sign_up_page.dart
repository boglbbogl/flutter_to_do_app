import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_event.dart';
import 'package:flutter_to_do/_src/application/authentication/sign_up/sign_up_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/sign_up/sign_up_event.dart';
import 'package:flutter_to_do/_src/application/authentication/sign_up/sign_up_state.dart';
import 'package:flutter_to_do/_src/presentation/auth/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (_) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpErrorState) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text(
                state.message ?? "잠시 후 다시 시도해 주세요",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              )));
          }
          if (state is SignUpSuccessState) {
            context
                .read<AuthBloc>()
                .add(AuthCheckEvent(userModel: state.userModel));
            context.pop();
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: const Color.fromRGBO(61, 61, 61, 1),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
                title: const Text(
                  "SIGN-UP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Column(
                children: [
                  const SizedBox(height: 24),
                  CustomTextField(
                    hintText: "이메일을 입력해 주세요",
                    onChanged: (value) => context
                        .read<SignUpBloc>()
                        .add(SignUpEmailInputEvent(value)),
                  ),
                  CustomTextField(
                    isObscure: true,
                    hintText: "패스워드를 입력해 주세요",
                    onChanged: (value) => context
                        .read<SignUpBloc>()
                        .add(SignUpPasswordInputEvent(value)),
                  ),
                  CustomTextField(
                    isObscure: true,
                    hintText: "패스워드를 다시 입력해 주세요",
                    onChanged: (value) => context
                        .read<SignUpBloc>()
                        .add(SignUpRePasswordInputEvent(value)),
                  ),
                  const SizedBox(height: 80),
                  IgnorePointer(
                    ignoring: state is! SignUpSubmitState,
                    child: GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        FocusScope.of(context).unfocus();
                        context.read<SignUpBloc>().add(SignUpSubmittedEvent());
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: state is SignUpSubmitState ||
                                    state is SignUpLoadingState
                                ? const Color.fromRGBO(31, 31, 31, 1)
                                : const Color.fromRGBO(91, 91, 91, 1)),
                        child: Center(
                          child: state is SignUpLoadingState
                              ? const CircularProgressIndicator(
                                  color: Colors.amber,
                                )
                              : Text(
                                  "회원가입",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: state is SignUpSubmitState
                                          ? Colors.amber
                                          : const Color.fromRGBO(
                                              155, 155, 155, 1),
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
