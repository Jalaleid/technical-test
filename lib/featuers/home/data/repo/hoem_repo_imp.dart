// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_services.dart';
import '../model/pokemon_model/pokemon_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, PokemonsModel>> FetchPokemon() async {
    try {
      var data =
          await apiService.get(endPoint: '/pokemon?limit=100000&offset=0');
      PokemonsModel pokemon = PokemonsModel.fromMap(data);

      return Right(pokemon);
    } on Exception catch (e) {
      if (e is DioException) return Left(ServerFailure.fromDioError(e));
    }
    return Left(ServerFailure(e.toString()));
  }
}
