import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'result.dart';

class PokemonsModel extends Equatable {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  const PokemonsModel({this.count, this.next, this.previous, this.results});

  factory PokemonsModel.fromMap(Map<String, dynamic> data) => PokemonsModel(
        count: data['count'] as int?,
        next: data['next'] as dynamic,
        previous: data['previous'] as dynamic,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PokemonsModel].
  factory PokemonsModel.fromJson(String data) {
    return PokemonsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PokemonsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [count, next, previous, results];
}
