import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/services/auth_service.dart';
import 'package:netflix_clone/utils/route_utils.dart';

import '../../models/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool isVisible = false;

  void isChnage(){
    isVisible=!isVisible;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pswController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/l.png",
                  width: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: isVisible,
                  controller: pswController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed:(){
                      isChnage();
                    },icon:(isVisible)?Icon(Icons.visibility):Icon(Icons.visibility_off)),
                    border: const OutlineInputBorder(),
                    label: Text("Password"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    final check = await AuthService.authService
                        .signUpWithPasswordUsername(
                            email: emailController.text,
                            password: pswController.text);

                    UserModel acc = UserModel(
                        image: '', name: '', email: emailController.text);

                    if (check!.contains('You can login Now')) {
                      Navigator.of(context).pushNamed(
                          MyRoutes.loginPage,
                          arguments: acc);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(check),
                      ),
                    );

                    emailController.clear();
                    pswController.clear();
                  },
                  child: Container(
                    height: 70,
                    width: 500,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Colors.red),
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ?",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(MyRoutes.loginPage);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
