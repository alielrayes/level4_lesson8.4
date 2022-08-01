class UserDate {
  String password;
  String email;
  String title;
  String username;
  String profileImg;

  UserDate({
    required this.email,
    required this.password,
    required this.title,
    required this.username,
    required this.profileImg,
  });

// To convert the UserData(Data type) to   Map<String, Object>
  Map<String, dynamic> convert2Map() {
    return {
      "password": password,
      "email": email,
      "title": title,
      "username": username,
      "profileImg": profileImg,
    };
  }
}
