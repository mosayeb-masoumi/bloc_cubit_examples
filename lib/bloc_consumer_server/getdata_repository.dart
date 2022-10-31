class GetDataRepository{

  Future<String> getToken(int? id) async{

    await Future.delayed(Duration(seconds: 2));
    String token = "kjkkdfgkjsdj";
    return token;
    // throw Exception();  // to make error
  }
}