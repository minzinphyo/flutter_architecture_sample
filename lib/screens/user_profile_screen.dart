import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample/network/base_response/api_response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/setup_locator.dart';
import '../view_model/user_view_model.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var userProvider = locator<UserViewModel>();

  @override
  void initState() {
    userProvider.getProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = Provider.of<UserViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 12.0, left: 12.0),
        child: widgetBody(context, apiResponse),
      ),
    );
  }

  Widget widgetBody(BuildContext context, ApiResponse apiResponse) {
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Consumer<UserViewModel>(
          builder: (context, userProvider, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("User Name : ${userProvider.profileOb!.name}"),
                  ElevatedButton(
                    onPressed: () => print("User Logout"),
                    child: const Text("Logout"),
                  )
                ],
              )),
        );
      case Status.ERROR:
        return Center(
          child: Text(apiResponse.message!),
        );
      case Status.INITIAL:
      default:
        return const Center(
          child: Text('Search the song by Artist'),
        );
    }
  }
}
