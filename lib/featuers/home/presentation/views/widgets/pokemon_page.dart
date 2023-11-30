// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/featuers/home/data/model/pokemon_model/result.dart';
import 'package:tech/featuers/home/presentation/manager/cubit/app_cubit.dart';

import '../../../../../core/utils/widgets/costum_loading_indicator.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Pokemon"),
      ),
      body: FutureBuilder(
        future: AppCubit.get(context).fetchFeaturedPokemon(),
        builder: (context, snap) => BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            if (state is FeatuerdPokemonLoading) {
              return const CostumLoadingIndicator();
            } else if (state is FeatuerdPokemonSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        PokemonDetlais(state.model.results![index]),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                    itemCount: state.model.results!.length),
              );
            }
            return const Center(
              child: Image(
                  height: 70,
                  width: 70,
                  image: AssetImage("assets/images/error_connection.png")),
            );
          },
        ),
      ),
    );
  }
}

Widget PokemonDetlais(Result model) => Card(
      shadowColor: Colors.blueGrey,
      elevation: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://static.thenounproject.com/png/568288-200.png"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.name ?? "Pokemon Name",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
