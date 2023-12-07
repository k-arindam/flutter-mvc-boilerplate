class BoilerplateUser {
  final String name;
  final String email;
  final DateTime dob;

  const BoilerplateUser({
    required this.name,
    required this.email,
    required this.dob,
  });

  factory BoilerplateUser.fromJson(Map json) => BoilerplateUser(
        name: json['name'],
        email: json['email'],
        dob: DateTime.parse(json['dob']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'dob': dob.toString(),
      };
}
