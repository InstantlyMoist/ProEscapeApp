class Room {
  final String title;

  Room({required this.title});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }

  Room.fromJson(Map<String, dynamic> json) : title = json['title'];
}
