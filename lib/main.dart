import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/core/utils/service_locator.dart';
import 'package:tech/featuers/home/data/repo/hoem_repo_imp.dart';
import 'package:tech/featuers/home/presentation/views/home_view.dart';

import 'featuers/home/presentation/manager/cubit/app_cubit.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(getIt.get<HomeRepoImpl>()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
//technical test