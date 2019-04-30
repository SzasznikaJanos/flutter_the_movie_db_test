class Token {
  String token;

  static Token fromJson(Map<String, dynamic> json) {
    Token token = Token();

    token.token = json["token"];
    return token;
  }
}
