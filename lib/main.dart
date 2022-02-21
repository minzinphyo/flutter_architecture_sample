import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample/screens/login_screen.dart';
import 'package:flutter_architecture_sample/utils/setup_locator.dart';
import 'package:flutter_architecture_sample/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  var userProvider = locator<UserViewModel>();

  return runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => userProvider,
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo',
        home: LoginScreen()
    );
  }
}
