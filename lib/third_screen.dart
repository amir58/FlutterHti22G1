import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
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
              // initialValue: "@gmail.com",
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
                    onPressed: () {},
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Registers"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
