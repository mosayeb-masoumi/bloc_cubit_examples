import 'package:bloc/bloc.dart';
import 'package:getx_project/bloc_consumer_server/getdata_repository.dart';
import 'package:meta/meta.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {

  final GetDataRepository _repository;

  GetDataCubit(this._repository) : super(const GetDataInitial());

  Future<void> getData(int id) async {

    try{

      emit(GetDataLoading());
      String token = await _repository.getToken(id);
      emit(GetDataLoaded(token));

    }on Exception {
      emit(GetDataError("an error occured!!!"));
    }
  }

}
