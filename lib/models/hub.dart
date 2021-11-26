class Hub {
  final String title;
  final String ip;

  Hub({required this.title, required this.ip});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['ip'] = ip;
    return data;
  }

  Hub.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        ip = json['ip'];
}
