// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/pokemon_model/pokemon_model.dart';
import '../../../data/repo/home_repo.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(this.homeRepo) : super(AppCubitInitial());

  String name = "name";

  static AppCubit get(context) => BlocProvider.of(context);
  void setName(v) {
    name = v;
    emit(ChangeName());
  }

  List listOfShapeDecoration = [
    ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.blue[900],
    ),
    ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: Colors.blue[300],
    ),
    const ShapeDecoration(
      shape: CircleBorder(),
      color: Colors.red,
    ),
  ];
  var selected = ShapeDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    color: Colors.blue[900],
  );
  void changeToSquare() {
    selected = listOfShapeDecoration[0];
    emit(SquareState());
  }

  void changeToRoundedRectangle() {
    selected = selected = listOfShapeDecoration[1];
    emit(RoundedRectangleState());
  }

  void changeToCircle() {
    selected = selected = listOfShapeDecoration[2];
    emit(CircleState());
  }

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedPokemon() async {
    emit(FeatuerdPokemonLoading());

    var result = await homeRepo.FetchPokemon();

    result.fold((failure) {
      emit(FeatuerdPokemonFailuer(failure.errMessage));
    }, (Pokemon) {
      emit(FeatuerdPokemonSuccess(Pokemon));
    });
  }
}
