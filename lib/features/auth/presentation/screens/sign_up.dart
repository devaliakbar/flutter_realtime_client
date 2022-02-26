import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_realtime/core/grpc/grpc_client_helper.dart';
import 'package:flutter_realtime/core/grpc/generated/user.pbgrpc.dart'
    as pbgrpc;
import 'package:flutter_realtime/features/auth/models/user.dart';
import 'package:flutter_realtime/features/auth/provider/app_state.dart';
import 'package:flutter_realtime/features/message/presentation/screens/message_home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  static const String myRoute = '/sign_up';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    labelText: "Full name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _signUp,
                    child: const Text("Sign up"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    final String fullName = _fullNameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (fullName.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Full name is empty")));
      return;
    }

    if (email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email is empty")));
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password is empty")));
      return;
    }

    final channel = GrpcClientHelper.getChannel();
    final stub = pbgrpc.UserServiceClient(channel);

    final AppState appState = Provider.of(context, listen: false);

    try {
      appState.changeLoad(true);

      final response = await stub.signUp(pbgrpc.SignUpRequest(
          user: pbgrpc.User(fullName: fullName, email: email),
          password: password));

      final Map<String, dynamic> usr = {
        "user_id": response.user.id,
        "full_name": response.user.fullName,
        "email": response.user.email
      };

      appState.setUser(User.fromJson(usr));
      appState.setJwtToken(response.jwtToken);

      const storage = FlutterSecureStorage();
      await storage.write(key: "jwt", value: response.jwtToken);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_info', jsonEncode(usr));

      Navigator.of(context).pushNamedAndRemoveUntil(
          MessageHome.myRoute, (Route<dynamic> route) => false);
    } catch (e) {
      String err = "Failed to signup";
      if (e is GrpcError) {
        err = e.message ?? "Failed to signup";
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
    }
    appState.changeLoad(false);
    await channel.shutdown();
  }
}
