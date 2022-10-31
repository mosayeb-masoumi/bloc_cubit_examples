import 'package:bloc/bloc.dart';


part 'string_state.dart';

class StringCubit extends Cubit<StringState> {
  StringCubit() : super(StringState(title: "title"));

  void addCharacter() {
    emit(StringState(title: state.title+"y"));
  }
}
