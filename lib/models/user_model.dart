class UserModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'] ?? 'First Name',
      lastName: json['last_name'] ?? 'Last Name',
      avatar: json['avatar'] ?? 'https://i.pravatar.cc/150?img=1',
    );
  }
}
