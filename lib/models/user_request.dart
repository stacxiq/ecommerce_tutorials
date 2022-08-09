class UserRequest {
  String? name;
  String email;
  String password;
  UserRequest({
    this.name,
    required this.email,
    required this.password,
  });
}
