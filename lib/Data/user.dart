class User {
  final String username;
  final String email;
  final String password;
  
  User({required this.username, required this.email, required this.password});

  User.fromJson(Map<String, dynamic> json)
      : username = json['name'],
        email = json['email'],
        password = json['password'];


  Map<String, dynamic> toJson() {
    return {
      'name': username,
      'email': email,
      'password': password,
    };
  }
}
