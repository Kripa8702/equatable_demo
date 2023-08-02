import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String gender;

  const UserModel({
    required this.name,
    required this.email,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: "${json['name']['title']} ${json['name']['first']} ${json['name']['last']}",
    email: json['email'],
    gender: json['gender'],
  );


  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'gender': gender,
  };

  @override
  List<Object?> get props => [name, email, gender];
}
