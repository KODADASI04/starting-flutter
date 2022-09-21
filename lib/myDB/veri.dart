class Veri {
  String? id;
  String? username;
  String? pass;
  String? about;
  Veri({this.id, this.username, this.pass, this.about});
  factory Veri.fromJson(Map<String, dynamic> json) {
    return Veri(
      id: json['id'] as String,
      username: json['username'] as String,
      pass: json['pass'] as String,
      about: json['last_name'] as String,
    );
  }
}
