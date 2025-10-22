import 'package:summa/features/Users/domain/entities/user_entity.dart';

class Usermodel extends UserEntity {
  Usermodel({required super.name, required super.id, required super.gmail});

  factory Usermodel.fromJson(json) {
    return Usermodel(name: json['identity_data']['name'], id: json['user']['id'], gmail: json['identity_data']['email']);
  }
}
