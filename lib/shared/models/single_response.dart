class SingleResponse<T> {
  bool? status;
  String? message;
  T? data;
  TokenModel? token;

  SingleResponse({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  factory SingleResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    return SingleResponse<T>(
      status: json["success"],
      message: json["message"],
      data: json["data"] != null ? create(json["data"]) : null,
      token: json['token'] != null && json['token'] != {}
          ? TokenModel.fromJson(json['token'])
          : null,
    );
  }
}

class TokenModel {
  String? accessToken;
  String? refreshToken;

  TokenModel({this.accessToken, this.refreshToken});

  TokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
