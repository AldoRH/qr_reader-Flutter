

import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
        //Color primario
        primaryColor: Colors.indigo,
        //AppBar theme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white,size: 26),
          titleTextStyle: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23, )
        ),
        
        // BottomNavigationBar Theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primary,
        ),


        //TextButton Theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primary,)
        ),

        //FloatingButtons
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: Colors.white
        ),

        //ElevatedButtons
        elevatedButtonTheme:  ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            shape: const StadiumBorder(),
            elevation: 0,
          ),
        ),

        //Inputs
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(  color: primary),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(  color: primary),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10) ),
        ),

        border : OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10) ),
        )
        )
      );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
        //Color primario
        primaryColor: Colors.indigo,
        //AppBar theme
        appBarTheme: const AppBarTheme( 
          color: primary,
          elevation: 0
        ),

        scaffoldBackgroundColor: Colors.black

);

}