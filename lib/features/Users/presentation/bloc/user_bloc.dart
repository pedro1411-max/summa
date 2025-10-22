import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summa/features/Users/presentation/bloc/user_event.dart';
import 'package:summa/features/Users/presentation/bloc/user_state.dart';

import '../../domain/usecase/create_acount_usecase.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CreateAcountUsecase _createAcountUsecase;
  UserBloc(this._createAcountUsecase) : super(UserStateInitial()) {
    on<OnSingUpUser>((event, emit) async {
      emit(LoadingUser());
      if (event.email.isEmpty || event.password.isEmpty || event.name.isEmpty) {
        emit(FailureUser());
        return;
      }
      try {
        final resp = await _createAcountUsecase(
          event.email,
          event.password,
          event.name,
        );
        if (resp.id.isEmpty) {
          emit(FailureUser());
        }
        emit(SingUpUsersucces(user: resp));
      } catch (e) {
        print(e);
      }
    });
  }
}
