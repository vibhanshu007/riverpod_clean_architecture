import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String userId;
  final String name;
  final String imageUrl;
  final String email;
  final bool isEmailVerified;
  final bool isAnonymous;
  final bool isNewUser;

  UserData(
      {required this.userId,
      required this.name,
      required this.imageUrl,
      required this.email,
      required this.isEmailVerified,
      required this.isAnonymous,
      required this.isNewUser});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson()=> _$UserDataToJson(this);

}
