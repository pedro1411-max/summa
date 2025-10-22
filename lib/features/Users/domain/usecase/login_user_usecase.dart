import 'package:summa/features/Users/domain/entities/user_entity.dart';
import 'package:summa/features/Users/domain/repositories/user_repository.dart';

class LoginUserUsecase {
  final UserRepository repository;
  LoginUserUsecase(this.repository);

  Future<UserEntity> call(String gmail, String password) {
    return repository.loginUser(gmail, password);
  }
}
