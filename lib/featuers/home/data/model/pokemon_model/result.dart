import 'dart:convert';

import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String? name;
  final String? url;

  const Result({this.name, this.url});

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [name, url];
}
