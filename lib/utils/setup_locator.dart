import 'package:flutter_architecture_sample/repository/user_repository_impl.dart';
import 'package:flutter_architecture_sample/view_model/user_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<UserViewModel>(() => UserViewModel(locator()));
  locator.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl());
}
