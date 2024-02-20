class UserModel {
  final String? email;
  final String? name;
  final String? lastname;
  final String? birthDate;
  final String? bio;
  String? docRef;
  String? userId;
  List<String>? hobbies;

  UserModel({
    this.email,
    this.name,
    this.docRef,
    this.lastname,
    this.birthDate,
    this.userId,
    this.bio,
    this.hobbies,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, {String? id, String? docRef}) {
    return UserModel(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      lastname: json['lastname'] ?? '',
      birthDate: json['birthDate'] ?? '',
      bio: json['bio'],
      userId: id,
      docRef: docRef,
      hobbies: json['hobbies'] != null ? List<String>.from(json['hobbies']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'lastname': lastname,
      'birthDate': birthDate,
      'userId': userId,
      'bio': bio,
      'hobbies': hobbies,
    };
  }
}
