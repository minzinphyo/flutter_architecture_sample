import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample/network/base_response/api_response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/setup_locator.dart';
import '../view_model/user_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var userProvider = locator<UserViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = Provider.of<UserViewModel>(context).response;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<UserViewModel>(
          builder: (context, userProvider, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.lato(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Log in to continue",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                apiResponse.successData != null
                    ? Text(
                        "Response Status is ${apiResponse.successData!.status}")
                    : const Text("No Response"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    cursorColor: Colors.red,
                    keyboardType: TextInputType.phone,
                    maxLines: 1,
                    // focusNode: emailNode,
                    onFieldSubmitted: (term) {
                      // FocusScope.of(context).requestFocus(addressNode);
                    },
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      labelText: 'Your phone number',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    validator: (text) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    cursorColor: Colors.blue,
                    obscureText: true,
                    maxLines: 1,
                    // focusNode: emailNode,
                    onFieldSubmitted: (term) {
                      // FocusScope.of(context).requestFocus(addressNode);
                    },
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    validator: (text) {
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoButton(
                    onPressed: () {
                      userProvider.loginUser(
                          context,
                          _phoneNumberController.text.trim(),
                          _passwordController.text.trim());
                      print(_phoneNumberController.text +
                          " and " +
                          _passwordController.text);
                    },
                    color: Colors.red,
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.lato(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        // bottomNavigationBar:
        );
  }
}
