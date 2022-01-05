class Notifier {
  int id;
  String message;
  String createdAt;

  Notifier({
    required this.id,
    required this.message,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "message": message,
      "created_datetime": createdAt,
    };
  }

  factory Notifier.fromJson(Map<String, dynamic> map) {
    return Notifier(
      id: map['id'] ?? 0,
      message: map['message'] ?? "",
      createdAt: map['created_datetime'] ?? "",
    );
  }

  static List<Notifier> fromJsonList(jsonList) {
    if (jsonList == null) return [];
    return jsonList
        .map<Notifier>((obj) => Notifier.fromJson(obj))
        .toList();
  }
}
