abstract class UserEvent {}

class OnSingUpUser extends UserEvent {
  final String email;
  final String password;
  final String name;

  OnSingUpUser(this.email, this.password, this.name);
}
