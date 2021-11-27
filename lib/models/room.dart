class Room {
  final String title;
  final List<String> cameras;
  final bool runningState;
  final int progress;
  final List<String> puzzles;

  Room(
      {required this.title,
      required this.cameras,
      required this.runningState,
      required this.progress,
      required this.puzzles});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['camera'] = cameras;
    data['runningState'] = runningState;
    data['progress'] = progress;
    data['puzzles'] = puzzles;
    return data;
  }

  Room.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        cameras = List.from(json['camera']),
        runningState = json['runningState'],
        progress = json['progress'],
        puzzles = List.from(json['puzzles']);
}
