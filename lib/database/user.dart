class User {
  String username;
  String email;
  String mobile;
  String password;

  User({
    required this.username,
    required this.email,
    required this.mobile,
    required this.password,
  });

  User.optional({
    required this.username,
    required this.email,
    this.mobile = '',
    this.password = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      password: json['password'] as String,
    );
  }
}