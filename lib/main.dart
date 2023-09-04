import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "splash",
        routes: {
          '/': (context) => Page1(),
          'second': (context) => Page2.namedConstructor(),
          'splash': (context) => SplashScreen(),
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("Splash")],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    late String? name = "";
    late String? email = "";
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 1"),
        ),
        body: Container(
            margin: EdgeInsets.all(18.00),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                    onChanged: (text) {
                      name = text;
                    },
                    decoration: InputDecoration(
                        label: Text("Name"),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey))),
                TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    decoration: InputDecoration(
                        label: Text("Email Address"),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey))),
                ElevatedButton(
                  child: Text("Click to Second Screen"),
                  onPressed: () {
                    print("object");
                    /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Page2(profile: Profile(name, email))));*/
                    Navigator.pushNamed(context, "second",
                        arguments: Profile(name, email));
                  },
                )
              ],
            )));
  }
}

class Profile {
  final String? name;
  final String? email;

  const Profile(this.name, this.email);
}

class Page2 extends StatelessWidget {
  Page2({super.key, this.profile});

  Page2.namedConstructor();

  Profile? profile;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Profile;

    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 2"),
        ),
        body: Container(
            margin: const EdgeInsets.all(18.00),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(args.name!),
                Text(args.email!),
                ElevatedButton(
                  child: const Text("Click to Third Screen"),
                  onPressed: () {
                    print("object");
                    Navigator.pushNamed(context, "/");
                  },
                )
              ],
            )));
  }
}
