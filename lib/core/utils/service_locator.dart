import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../featuers/home/data/repo/hoem_repo_imp.dart';
import 'api_services.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
