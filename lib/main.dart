import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtt/pages/home_page.dart';
import 'package:mtt/pages/login_page.dart';
import 'package:mtt/pages/splash_page.dart';
import 'package:mtt/services/api.dart';
import 'package:mtt/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => API(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Daily Qoutes',
          theme: ThemeData(
            fontFamily: 'LexendDeca',
            textTheme: GoogleFonts.lexendDecaTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: auth.isAuth
              ? const HomePage()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? const SplashPage()
                          : const LoginPage(),
                ),
          routes: {
            LoginPage.routeName: (context) => const LoginPage(),
            HomePage.routeName: (context) => const HomePage(),
            SplashPage.routeName: (context) => const SplashPage(),
          },
        ),
      ),
    );
  }
}
