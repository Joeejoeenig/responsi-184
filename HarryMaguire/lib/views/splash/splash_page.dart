// import 'package:flutter/material.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Color(0xFF2E1065),

//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,

//           children: [

//             Text(
//               "⚡",
//               style: TextStyle(
//                 fontSize: 70,
//               ),
//             ),

//             SizedBox(height: 20),

//             Text(
//               "Harry Potter",
//               style: TextStyle(
//                 fontSize: 32,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             SizedBox(height: 10),

//             Text(
//               "Wizard App",
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white70,
//               ),
//             ),

//             SizedBox(height: 40),

//             CircularProgressIndicator(
//               color: Colors.amber,
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/auth_controller.dart';
import '../../app/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final AuthController auth = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {

        if(auth.isLoggedIn.value){

          Get.offAllNamed(Routes.home);

        }else{

          Get.offAllNamed(Routes.login);

        }

      },
    );

  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(

      backgroundColor: Color(0xff2E1065),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text(
              "⚡",
              style: TextStyle(
                fontSize: 70,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Harry Potter",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "Wizard App",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),

            SizedBox(height: 40),

            CircularProgressIndicator(
              color: Colors.amber,
            )

          ],

        ),

      ),

    );

  }
}