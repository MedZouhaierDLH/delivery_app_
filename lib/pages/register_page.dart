import 'package:flutter/material.dart';
import 'package:platterpath2/components/my_button.dart';
import 'package:platterpath2/components/my_textfield.dart';
import 'package:platterpath2/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  // register method
  void register() async {
    // get auth service
    final _authService = AuthService();

    // check if passwords match -> create user
    if(passwordController.text == confirmpasswordController.text ) {
      // try creating user
      try{
        await _authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
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

    else {
      // if passwords don't match -> show error
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Passwords don't match!"),
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
              Icons.lock_open,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25,),
            //message, app slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(
                fontSize: 16,
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

            //confirm password textfield
            MyTextfield(
                controller: confirmpasswordController,
                hintText: "Confirm password",
                obscureText: true),

            const SizedBox(height: 25,),


            //sign Up button
            MyButton(
              text: "Sign Up",
              onTap: () {register();},
            ),

            const SizedBox(height: 25,),

            //already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login now",
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
