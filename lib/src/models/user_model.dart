class UserModel {
  late String userName;
  late String description;
  late String profileUrl;

  UserModel(
      {required this.userName,
      required this.description,
      required this.profileUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.userName = json["name"]??"";
    this.description = json['blog']??"";
    this.profileUrl = json['avatar_url']??"";
  }
}
