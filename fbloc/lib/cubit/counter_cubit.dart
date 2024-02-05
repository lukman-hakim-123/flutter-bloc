import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit2 extends Cubit<int> {
  CounterCubit2() : super(0);
  void increment() => emit(state + 1);
  void decrement() {
    if (state > 0) {
      return emit(state - 1);
    }
  }
}
