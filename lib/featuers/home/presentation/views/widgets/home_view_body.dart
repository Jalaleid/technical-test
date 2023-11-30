// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/featuers/home/presentation/manager/cubit/app_cubit.dart';
import 'package:tech/featuers/home/presentation/views/widgets/animation_page.dart';
import 'package:tech/featuers/home/presentation/views/widgets/pokemon_page.dart';

class HomeViewBody extends StatelessWidget {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                ),
                onChanged: (value) {
                  cubit.setName(value);
                },
              ),
            ),
            Text("Your ${cubit.name}"),
            const Spacer(),
            TextButton(
                onPressed: () {
                  nameController.clear();
                  cubit.setName("name");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(
                      width: 10,
                    ),
                    Text("CLear text", style: TextStyle(color: Colors.red))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnimtaionPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                  ),
                  child: const Text(
                    "Go To Page 1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PokemonPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                  ),
                  child: const Text(
                    "Go To Page 2",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
