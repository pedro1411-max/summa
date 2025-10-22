import 'package:summa/features/Users/data/models/usermodel.dart';
import 'package:summa/features/Users/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRemoteDatasource {
  Future<UserEntity> createAcountUser(
    String gmail,
    String name,
    String password,
  );
}

class SupabaseUser implements UserRemoteDatasource {
  final SupabaseClient supabase = Supabase.instance.client;
  @override
  Future<UserEntity> createAcountUser(
    String gmail,
    String password,

    String name,
  ) async {
    try {
      final AuthResponse response = await supabase.auth.signUp(
        email: gmail,
        password: password,
        data: {'name': name},
      );
      print(response.user);
      return Usermodel(name: name, id: response.user!.id, gmail: gmail);
    } on AuthException catch (e) {
      throw Exception('Error de autenticación: ${e.message}');
    } catch (e) {
      throw Exception('Error al crear usuario: $e');
    }
  }
}
