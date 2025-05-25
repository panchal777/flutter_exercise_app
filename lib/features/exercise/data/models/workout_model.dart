class WorkoutModel {
  WorkoutModel({
    this.name = '',
    this.description = '',
    this.duration = 0,
    this.difficulty = '',
    this.id = '',
    this.isCompleted = false,
  });

  final String name;
  final String description;
  final int duration;
  final String difficulty;
  final String id;

  bool isCompleted;

  WorkoutModel copyWith({
    String? name,
    String? description,
    int? duration,
    String? difficulty,
    String? id,
  }) {
    return WorkoutModel(
      name: name ?? this.name,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      difficulty: difficulty ?? this.difficulty,
      id: id ?? this.id,
    );
  }

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      duration: json["duration"] ?? 0,
      difficulty: json["difficulty"] ?? "",
      id: json["id"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "duration": duration,
    "difficulty": difficulty,
    "id": id,
  };
}
