import 'package:summa/features/Users/domain/entities/user_entity.dart';
import 'package:summa/features/Users/domain/repositories/user_repository.dart';

class CreateAcountUsecase {
  final UserRepository repository;
  CreateAcountUsecase({required this.repository});

  Future<UserEntity> call(
    String gmail,
    String password,
    String userName,
  ) async {
    return repository.createAcountUser(gmail, password, userName);
  }
}
