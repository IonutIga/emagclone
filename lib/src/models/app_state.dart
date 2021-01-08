part of models;


abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState.initialState() {
    return _$AppState((AppStateBuilder b) {
      b.auth = AuthState.initialState().toBuilder();
    });
  }
  factory AppState.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  AppState._();

  AuthState get auth;



  Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}