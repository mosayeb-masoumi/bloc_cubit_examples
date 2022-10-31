part of 'get_data_cubit.dart';

@immutable
abstract class GetDataState {

  const GetDataState();
}

//initial
class GetDataInitial extends GetDataState {
  const GetDataInitial();
}

//loading
class GetDataLoading extends GetDataState {
  const GetDataLoading();
}


//loaded
class GetDataLoaded extends GetDataState {
  final String strResult;

  const GetDataLoaded(this.strResult);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GetDataLoaded &&
              runtimeType == other.runtimeType &&
              strResult == other.strResult;

  @override
  int get hashCode => strResult.hashCode;

}

//error
class GetDataError extends GetDataState {

  final String message;
  const GetDataError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetDataError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;


}