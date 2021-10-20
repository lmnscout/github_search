import 'dart:convert';

import 'package:github_search/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String avatar_url;
  final String id;
  final String login;

  ResultSearchModel({this.avatar_url, this.id, this.login});

  Map<String, dynamic> toMap() {
    return {
      'avatar_url': avatar_url,
      'id': id,
      'login': login,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      avatar_url: map['avatar_url'],
      id: map['id'].toString(),
      login: map['login'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
