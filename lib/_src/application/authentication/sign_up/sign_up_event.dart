import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {}

class SignUpEmailInputEvent extends SignUpEvent {
  final String value;

  SignUpEmailInputEvent(this.value);
  @override
  List<Object?> get props => [value];
}

class SignUpPasswordInputEvent extends SignUpEvent {
  final String value;

  SignUpPasswordInputEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class SignUpRePasswordInputEvent extends SignUpEvent {
  final String value;

  SignUpRePasswordInputEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class SignUpSubmittedEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}

class SignUpValidateEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}
