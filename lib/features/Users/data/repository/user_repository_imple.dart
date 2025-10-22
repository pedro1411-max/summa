import 'package:summa/features/Users/data/datasources/user_remote_datasource.dart';
import 'package:summa/features/Users/domain/entities/user_entity.dart';
import 'package:summa/features/Users/domain/repositories/user_repository.dart';

class UserRepositoryImple implements UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepositoryImple({required this.userRemoteDatasource});
  @override
  Future<UserEntity> createAcountUser(
    String gmail,
    String password,
    String userName,
  ) async {
    try {
      final UserEntity resp = await userRemoteDatasource.createAcountUser(
        gmail,
        password,
        userName,
      );
      return resp;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
