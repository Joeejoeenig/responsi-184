// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../app/controllers/auth_controller.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();

//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   final AuthController auth = Get.find<AuthController>();

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       auth.login(
//         username: _usernameController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login"),
//         centerTitle: true,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(20),

//         child: Form(
//           key: _formKey,

//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,

//             children: [

//               const Icon(
//                 Icons.auto_awesome,
//                 size: 80,
//                 color: Colors.deepPurple,
//               ),

//               const SizedBox(height: 16),

//               const Text(
//                 "Harry Potter App",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               const SizedBox(height: 30),

//               TextFormField(
//                 controller: _usernameController,

//                 decoration: const InputDecoration(
//                   labelText: "Username",
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person),
//                 ),

//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Username tidak boleh kosong";
//                   }

//                   if (value.length < 5) {
//                     return "Minimal 5 karakter";
//                   }

//                   return null;
//                 },
//               ),

//               const SizedBox(height: 20),

//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,

//                 decoration: const InputDecoration(
//                   labelText: "Password (NIM)",
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.lock),
//                 ),

//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Password tidak boleh kosong";
//                   }

//                   return null;
//                 },
//               ),

//               const SizedBox(height: 30),

//               SizedBox(
//                 width: double.infinity,

//                 child: ElevatedButton(
//                   onPressed: _login,

//                   child: const Text("LOGIN"),
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final auth = Get.find<AuthController>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      auth.login(
        username: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.auto_awesome,
                size: 80,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password (NIM)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text("LOGIN"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}