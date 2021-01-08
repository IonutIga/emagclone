part of auth_models;

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  factory AppUser([void Function(AppUserBuilder b) updates]) = _$AppUser;

  factory AppUser.initialState() {
    return _$AppUser((AppUserBuilder b) {});
  }

  AppUser._();

  factory AppUser.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  String get uid;

  String get email;

  String get displayName;

  @nullable
  String get photoUrl;


  Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;

  static Serializer<AppUser> get serializer => _$appUserSerializer;
}