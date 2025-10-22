import 'package:summa/features/Users/domain/entities/user_entity.dart';

abstract class UserState {}

class LoadingUser extends UserState {}

class UserStateInitial extends UserState {}

class SingUpUsersucces extends UserState {
  final UserEntity user;
  SingUpUsersucces({required this.user});
}

class FailureUser extends UserState {}
