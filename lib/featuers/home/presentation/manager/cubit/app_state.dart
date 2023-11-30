part of 'app_cubit.dart';

abstract class AppStates {}

final class AppCubitInitial extends AppStates {}

class ChangeName extends AppStates {}

class SquareState extends AppStates {}

class RoundedRectangleState extends AppStates {}

class CircleState extends AppStates {}

class FeatuerdPokemonLoading extends AppStates {}

class FeatuerdPokemonFailuer extends AppStates {
  String errMessage;

  FeatuerdPokemonFailuer(this.errMessage);
}

class FeatuerdPokemonSuccess extends AppStates {
  PokemonsModel model;
  FeatuerdPokemonSuccess(this.model);
}
