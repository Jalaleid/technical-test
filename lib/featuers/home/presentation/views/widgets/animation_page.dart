import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/app_cubit.dart';

class AnimtaionPage extends StatelessWidget {
  const AnimtaionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Shape Screen'),
      ),
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 300,
                    height: 300,
                    decoration: cubit.selected),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.changeToSquare();
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: cubit.listOfShapeDecoration[0]),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.changeToRoundedRectangle();
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: cubit.listOfShapeDecoration[1]),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.changeToCircle();
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: cubit.listOfShapeDecoration[2]),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
