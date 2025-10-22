import 'package:get_it/get_it.dart';
import 'package:summa/features/Users/data/datasources/user_remote_datasource.dart';
import 'package:summa/features/Users/data/repository/user_repository_imple.dart';
import 'package:summa/features/Users/domain/repositories/user_repository.dart';
import 'package:summa/features/Users/domain/usecase/create_acount_usecase.dart';
import 'package:summa/features/Users/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => UserBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => CreateAcountUsecase(repository: sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImple(userRemoteDatasource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDatasource>(() => SupabaseUser());
}
