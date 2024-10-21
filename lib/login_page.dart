// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'register_page.dart';

// @override
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffFAFAFA),
//       body: SingleChildScrollView(
//         child: Container(
//           color: const Color(0xffFAFAFA),
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 100),
//               const Text(
//                 'TIDYTASKER',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 34,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xff475239),
//                 ),
//               ),
//               Text(
//                 'Housekeeping Made Simple',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               const SizedBox(height: 40),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter Email or Phone Number',
//                   hintStyle: const TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//               ),
//               const SizedBox(height: 15),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter Password',
//                   hintStyle: const TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//                 obscureText: true,
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Forgot Password?',
//                     style: TextStyle(color: Colors.grey[600]),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xff87986A),
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       thickness: 1,
//                       color: Colors.grey[400],
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text('Or'),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       thickness: 1,
//                       color: Colors.grey[400],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   'assets/svg_images/google.svg',
//                 ),
//                 label: const Text('Continue with Google'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.black,
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(color: Colors.grey[300]!),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   'assets/svg_images/facebook.svg',
//                 ),
//                 label: const Text('Continue with Facebook'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.black,
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(color: Colors.grey[300]!),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 100),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Don\'t have an account?',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const RegisterPage(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                           color: Color(0xff87986A),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home.dart';
import 'register_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TidyTasker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = '';
  String _password = '';
  bool _isValidLogin = true;

  bool _login(String email, String password) {
    if (email == "test@example.com" && password == "password123") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffFAFAFA),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100),
              const Text(
                'TIDYTASKER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff475239),
                ),
              ),
              Text(
                'Housekeeping Made Simple',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email or Phone Number',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  errorText: _isValidLogin ? null : 'Invalid login credentials',
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isValidLogin = _login(_email, _password);
                    if (_isValidLogin) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff87986A),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Or'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svg_images/google.svg',
                ),
                label: const Text('Continue with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svg_images/facebook.svg',
                ),
                label: const Text('Continue with Facebook'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xff87986A),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
