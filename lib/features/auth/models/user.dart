class User {
  final String fullName;
  final String email;

  User({required this.fullName, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(fullName: json['full_name'], email: json['email']);
  }
}
