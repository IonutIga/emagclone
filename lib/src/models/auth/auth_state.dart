part of auth_models;

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  factory AuthState.initialState() {
    return _$AuthState((AuthStateBuilder b){});
  }

  AuthState._();

  factory AuthState.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  @nullable
  AppUser get user;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;

  static Serializer<AuthState> get serializer => _$authStateSerializer;
}