import 'package:bloc/bloc.dart';

part 'int_state.dart';

class IntCubit extends Cubit<IntState> {
  IntCubit() : super(IntState(currentValue: 0));

  void increment() {
     emit(IntState(currentValue: state.currentValue +1));
  }
}
