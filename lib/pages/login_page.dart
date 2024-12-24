import 'package:flutter/material.dart';
import 'package:platterpath2/components/my_button.dart';
import 'package:platterpath2/components/my_textfield.dart';
import 'package:platterpath2/services/auth/auth_service.dart';



class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() async {
    // get instance of auth service
    final _authService = AuthService();

    //try sign in
    try{
      await _authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
    }

    // display any errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          )
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.delivery_dining,
              size: 150,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 25,),

            //message, app slogan
            Text(
              "PlatterPath",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25,),

            //email textfield
            MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(height: 10,),

            //password textfield
            MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 25,),

            //sign in button
            MyButton(
                text: "Sign In",
                onTap: login,
            ),

            const SizedBox(height: 25,),

            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register now",
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),

                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

