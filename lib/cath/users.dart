class Users {
  final String id;
  final String name;
  final String username;
  final String password;
  final String email;

  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'name': name,
        'email': email,
      };

  static Users fromJson(Map<String, dynamic> json) => Users(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
      );
}
