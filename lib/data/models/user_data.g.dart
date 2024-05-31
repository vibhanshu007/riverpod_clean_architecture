// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userId: json['userId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      email: json['email'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
      isAnonymous: json['isAnonymous'] as bool,
      isNewUser: json['isNewUser'] as bool,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'email': instance.email,
      'isEmailVerified': instance.isEmailVerified,
      'isAnonymous': instance.isAnonymous,
      'isNewUser': instance.isNewUser,
    };
