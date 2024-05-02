import 'package:flutter/material.dart';
import 'package:netflix_clone/services/auth_service.dart';
import 'package:netflix_clone/utils/route_utils.dart';

import '../../models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isVisible=false;

  void isChange(){
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
                      isChange();
                    },icon:(isVisible)?const Icon(Icons.visibility):const Icon(Icons.visibility_off)),
                    border: const OutlineInputBorder(),
                    label: const Text("Password"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("OR"),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: ()async{
                      UserModel account =
                          await AuthService.authService.signInWithGoogle();
                      if (account.email != "") {
                        Navigator.of(context).pushReplacementNamed(
                            MyRoutes.homePage,
                            arguments: account);
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",
                          width: 50,
                        ),
                        const SizedBox(width: 30,),
                        const Text("Sign In With Google"),
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    final message = await AuthService.authService
                        .signInWithPasswordUsername(
                        email: emailController.text,
                        password: pswController.text);

                    String email = emailController.text;
                    String name = email
                        .substring(0, email.indexOf('@'))
                        .replaceAll(RegExp(r'[0-9]'), ' ')
                        .trim();
                    print(name); // Output: kavya mistry

                    UserModel acc = UserModel(
                        image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPjGnnelatTe1FbI6RHusiWG4wkbtmnjVC9uTBkSBX_g&s',
                        name: name,
                        email: emailController.text);

                    if (message!.contains('Success')) {
                      Navigator.of(context)
                          .pushReplacementNamed(MyRoutes.homePage, arguments: acc);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
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
                      "SIGN IN",
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
                      "Don't have an account ?",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.registerPage);
                        },
                        child: const Text(
                          "Create One",
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
