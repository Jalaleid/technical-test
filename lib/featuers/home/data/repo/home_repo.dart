// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/pokemon_model/pokemon_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, PokemonsModel>> FetchPokemon();
}
