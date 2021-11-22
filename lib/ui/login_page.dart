import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:printsoft_test/ui/login_success.dart';
import 'package:printsoft_test/widget/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isVisible = false;

  final urlPost = 'https://test.printsoft.co.id/api/login';

  void postData() async {
    try {
      final response = await http.post(Uri.parse(urlPost),
          body: ({
            'username': userNameController.text,
            'password': passwordController.text,
          }));
      print(response.body);
      {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const LoginSuccess()));
      }
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    /// username field
    final userNameField = TextFormField(
      controller: userNameController,
      // validator: () {},
      keyboardType: TextInputType.name,
      // onSaved: () {},
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            FontAwesomeIcons.user,
            color: Colors.black,
          ),
        ),
        suffixIcon: userNameController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => userNameController.clear(),
                color: Colors.black),
        hintText: 'Username',
      ),
      style: const TextStyle(
        fontSize: 22,
        color: Colors.black,
        height: 1.5,
      ),
    );

    /// kata sandi field
    final kataSandiField = Column(
      children: [
        TextFormField(
          controller: passwordController,
          obscureText: !_isVisible,
          onSaved: (value) {
            passwordController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: kPrimaryColor),
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(FontAwesomeIcons.lock, color: Colors.black),
            ),
            suffixIcon: passwordController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: _isVisible
                        ? const Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    color: Colors.black,
                  ),
            hintText: 'Kata Sandi',
          ),
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
            height: 1.5,
          ),
        )
      ],
    );

    /// button masuk
    final masukButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16),
      color: kPrimaryColor,
      child: MaterialButton(
        onPressed: postData,
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text('Masuk',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: kWhite)),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 150),
              const Text(
                'Gading Murni Services',
                style: TextStyle(fontSize: 30, color: kPrimaryColor),
              ),
              const SizedBox(height: 100),
              userNameField,
              const SizedBox(height: 20),
              kataSandiField,
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(fontSize: 16, color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              masukButton
            ],
          ),
        ),
      ),
    );
  }

  // /// Function call post api
  // Future<void> login() async {
  //   if (passwordController.text.isNotEmpty &&
  //       userNameController.text.isNotEmpty) {
  //     var response =
  //         await http.post(Uri.parse('https://test.printsoft.co.id/api/login'),
  //             body: ({
  //               'username': userNameController.text,
  //               'password': passwordController.text,
  //             }));
  //     if (response.statusCode == 200) {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const LoginSuccess()));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('User Login Successfull')));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Provide username or password.')));
  //   }

  // }

}
