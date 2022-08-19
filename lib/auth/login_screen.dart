import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hti22one/auth/auth_cubit.dart';
import 'package:hti22one/auth/register_screen.dart';
import 'package:hti22one/contacts/contacts_cubit.dart';
import 'package:hti22one/contacts/contacts_main_screen.dart';
import 'package:hti22one/helpers/my_easy_loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        stopLoading();

        if (state is LoginFailureState) {
          showErrorMessage(state.errorMessage);
          return;
        }
        if (state is LoginSuccessState) {
          showInfoMessage("Welcome!");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => ContactsCubit(),
                  child: ContactsMainScreen(),
                ),
              ));
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login Screen",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
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
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
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
                Container(
                  // color: Colors.black,
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forget your password?"),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            login();
                          } else {
                            print('ERROR');
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: this.context.read<AuthCubit>(),
                                child: RegisterScreen(),
                              ),
                            ),
                          );
                        },
                        child: const Text("Registers"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    startLoading();

    String email = emailController.text;
    String password = passwordController.text;

    context.read<AuthCubit>().login(email: email, password: password);
  }
}
