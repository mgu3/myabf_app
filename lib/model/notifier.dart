class Notifier {
  int id;
  String message;

  Notifier({
    required this.id,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "message": message,
    };
  }

  factory Notifier.fromJson(Map<String, dynamic> map) {
    return Notifier(
      id: map['id'] ?? 0,
      message: map['message'] ?? "",
    );
  }

  static List<Notifier> fromJsonList(jsonList) {
    if (jsonList == null) return [];
    return jsonList
        .map<Notifier>((obj) => Notifier.fromJson(obj))
        .toList();
  }
}
