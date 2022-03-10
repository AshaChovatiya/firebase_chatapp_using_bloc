import 'package:firebase_chatapp_using_bloc/ui/Chat_Rooms_Screen/chat_rooms_screen.dart';
import 'package:firebase_chatapp_using_bloc/ui/Sign_In_Screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashStarted()),
      child: Scaffold(
        body: bodyView(),
      ),
    );
  }

  Widget bodyView() {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is UserSignedIn) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ChatRoomsScreen()));
        } else if (state is UserNotSignedIn) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInScreen()));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: Icon(
            Icons.forum_sharp,
            size: 100,
          ))
        ],
      ),
    );
  }
}
