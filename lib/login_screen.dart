import 'package:flutter/material.dart';
import 'package:sharedprefexamit/enum.dart';
import 'package:sharedprefexamit/home_screen.dart';
import 'package:sharedprefexamit/shared.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();


   TextEditingController emailController = TextEditingController(
       text: MyCache.getString(key: MyCacheKeys.email));
   var passwordController = TextEditingController(
       text: MyCache.getString(key: MyCacheKeys.password));
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email must not be empty";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9]+.[a-z]")
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.email),
                    labelText: "email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password must not be empty";
                    }
                    if (value.length < 10) {
                      return "Please enter at least 10 characters";
                    }
                    return null;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye_outlined)),
                    labelText: "password",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {

                      if(formKey.currentState!.validate()){
                        MyCache.putString(key: MyCacheKeys.email, value: emailController.text);
                        MyCache.putString(key: MyCacheKeys.password, value: passwordController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      elevation: 0.0,
                    ),
                    child: const Text(

                        "Login"

                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
