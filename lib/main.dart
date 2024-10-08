import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snicker_shoes/providers/cart_provider.dart';
import 'package:snicker_shoes/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          title: "Snickers",
          theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.amberAccent,
                primary: Colors.amberAccent,
                secondary: Colors.purpleAccent,
              ),
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 60,
                      fontWeight: FontWeight.w800
                  ),
                  centerTitle: true,
                  elevation: 12,
                  shape: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amberAccent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  )
              ),
              bottomAppBarTheme: BottomAppBarTheme(
                  height: 80,
                  elevation: 12,
                  shape: AutomaticNotchedShape(OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.amberAccent,
                  ),
                      borderRadius: BorderRadius.all(Radius.circular(20))))
              ),
              inputDecorationTheme: const InputDecorationTheme(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  prefixIconColor: Colors.grey
              ),
              textTheme: TextTheme(
                  titleMedium: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                  bodySmall: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                  )
              )
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage()
      ),

    );
  }
}