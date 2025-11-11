import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:xizmatbor/src/presentation/bloc/user_bloc.dart';
import 'package:xizmatbor/src/presentation/pages/home/index.dart';
import 'package:xizmatbor/src/presentation/pages/home/location_picker.dart';
import 'package:xizmatbor/src/presentation/splash.dart';
import 'package:xizmatbor/src/config/injection.dart' as di;

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.sl<UserBloc>())],
      child: MaterialApp(
        navigatorObservers: [routeObserver],
        theme: ThemeData(
          fontFamily: 'VelaSans',

          segmentedButtonTheme: SegmentedButtonThemeData(
            selectedIcon: SizedBox(),
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
              elevation: WidgetStateProperty.all(0),
              side: WidgetStateProperty.all(BorderSide.none),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
              ),
              foregroundColor: WidgetStateProperty.all(Colors.black),
              overlayColor: WidgetStateProperty.all(Colors.white30),
              backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white; // selected background
                }
                return Colors.blueGrey[50]!; // default background
              }),
            ),
          ),
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFF79009),
            onPrimary: Color(0xFFF79009),
            secondary: Color(0xFFF79009),
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.red,
            surface: Colors.white,
            onSurface: Colors.black,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              side: BorderSide(width: 1.2, color: Color(0xFFF79009)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Set the radius here
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 1.2, color: Color(0xFFF79009)),
            ),
          ),
          primaryColor: Color(0xFFF79009),
          dividerColor: Color(0xFFCBD5E0),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          SplashPage.routeName: (context) => SplashPage(),
          LocationPickerPage.routeName: (context) => LocationPickerPage(),
        },
        initialRoute: SplashPage.routeName,
        home: SplashPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
