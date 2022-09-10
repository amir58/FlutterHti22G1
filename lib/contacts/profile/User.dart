/// gender : ""
/// phone : ""
/// imageUrl : ""
/// email : ""
/// username : ""

class MyUser {
  MyUser({
    String? gender,
    String? phone,
    String? imageUrl,
    String? email,
    String? username,
  }) {
    _gender = gender;
    _phone = phone;
    _imageUrl = imageUrl;
    _email = email;
    _username = username;
  }

  MyUser.fromJson(dynamic json) {
    _gender = json['gender'];
    _phone = json['phone'];
    _imageUrl = json['imageUrl'];
    _email = json['email'];
    _username = json['username'];
  }

  String? _gender;
  String? _phone;
  String? _imageUrl;
  String? _email;
  String? _username;

  String get gender => _gender ?? "";

  String get phone => _phone ?? "";

  String get imageUrl => _imageUrl ?? "";

  String get email => _email ?? "";

  String get username => _username ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['imageUrl'] = _imageUrl;
    map['email'] = _email;
    map['username'] = _username;
    return map;
  }
}
