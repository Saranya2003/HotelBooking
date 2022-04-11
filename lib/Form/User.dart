class User{
  // Initial Selected Value
  int id = 0;
  String firstName;
  String lastName;

  User({this.id,this.firstName,this.lastName});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );
  }
}