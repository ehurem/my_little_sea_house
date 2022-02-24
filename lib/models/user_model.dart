/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User {
  /// The current user's email address.
  String? email;

  /// The current user's id.
  late String id;

  /// The current user's display name.
  late String displayName;

  /// The current user's phone number.
  String? phone;

  /// Url for the current user's photo.
  String? imageUrl;

  /// {@macro user}
  User({
    required this.id,
    this.email,
    required this.displayName,
    this.phone,
    this.imageUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    email = json['email'];
    displayName = json['displayName'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['displayName'] = displayName;
    data['phone'] = phone;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
