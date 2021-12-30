class User {
  int id;
  String firstName;
  String lastName;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      'system_number': id,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['system_number'] ?? 0,
      firstName: map['first_name'] ?? "",
      lastName: map['last_name'] ?? "",
    );
  }

  static List<User> fromJsonList(jsonList) {
    if (jsonList == null) return [];
    return jsonList.map<User>((obj) => User.fromJson(obj)).toList();
  }
}
