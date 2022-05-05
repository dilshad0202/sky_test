class Repository {
  late String name;
  late String fullName;
  late String url;

  Repository(
      {required this.name,
      required this.fullName,
      required this.url});

  Repository.fromJson(Map<String, dynamic> json) {
    this.name = json["name"]??"";
    this.fullName = json['full_name']??"";
    this.url = json['html_url']??"";
  }
}