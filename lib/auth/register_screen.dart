import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22one/auth/auth_cubit.dart';

import '../helpers/my_easy_loading.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        stopLoading();

        if(state is RegisterFailureState){
          showErrorMessage(state.errorMessage);
          return;
        }
        if(state is RegisterSuccessState){
          showSuccessMessage("Account created!");
          Navigator.pop(context);
        }

      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Register")),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  // initialValue: "@gmail.com",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email required";
                    }
                    if (!value.contains("@") || !value.contains(".")) {
                      return "Email not valid";
                    }
                    return null;
                  },
                  enabled: true,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password required";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }

                    return null;
                  },
                  enabled: true,
                  maxLines: 1,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        print('Show/Hide password');
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => register(),
                    child: const Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    startLoading();

    String email = emailController.text;
    String password = passwordController.text;

    context.read<AuthCubit>().createAccount(email: email, password: password);
  }
}
