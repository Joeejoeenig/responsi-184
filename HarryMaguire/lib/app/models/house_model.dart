class HouseModel {
  final String house;
  final String founder;
  final String emoji;

  HouseModel({
    required this.house,
    required this.founder,
    required this.emoji,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      house: json["house"] ?? "",
      founder: json["founder"] ?? "",
      emoji: json["emoji"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "house": house,
      "founder": founder,
      "emoji": emoji,
    };
  }
}