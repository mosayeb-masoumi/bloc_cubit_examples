class MyModel{
  String name ;

  MyModel({
    required this.name,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory MyModel.fromMap(Map<String, dynamic> map) {
    return MyModel(
      name: map['name'] as String,
    );
  }
}