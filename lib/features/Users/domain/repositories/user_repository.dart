import 'package:summa/features/Users/domain/entities/user_entity.dart';

abstract class UserRepository {
  //  Future<UserEntity> loginUser(String gmail, String password);
  Future<UserEntity> createAcountUser(
    String gmail,
    String password,
    String userName,
  );
  //  Future<bool> queryExistUser(String gmail);
}
