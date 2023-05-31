import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class ObserverBloc extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      developer.log('\x1B[37mCreated BLoC $bloc\x1B[0m');
    }
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      developer.log('\x1B[32mClosed BLoC $bloc\x1B[0m');
    }
    super.onClose(bloc);
  }
}
