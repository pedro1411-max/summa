import 'package:summa/features/Users/domain/repositories/user_repository.dart';

class QueryExistUserUsecase {
  final UserRepository repository;
  QueryExistUserUsecase(this.repository);

  Future<bool> call(String gmail) {
    return repository.queryExistUser(gmail);
  }
}
