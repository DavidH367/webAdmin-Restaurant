import 'dart:async';

import 'package:administraciongr/sellers/all_blocked_sellers_screen.dart';
import 'package:administraciongr/sellers/all_verified_sellers_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../authentication/login_screen.dart';
import '../riders/all_blocked_riders_screen.dart';
import '../riders/all_verified_riders_screen.dart';
import '../users/all_blocked_users_screen.dart';
import '../users/all_verified_users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String timeText = "";
  String dateText = "";

  String formatCurrentLiveTime(DateTime time){
    return DateFormat("hh:mm:ss a").format(time);
  }
  String formatCurrentDate(DateTime date){
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime(){
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if(this.mounted){
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void initState(){
    super.initState();

    //hora
    timeText = formatCurrentLiveTime(DateTime.now());

    //fecha
    dateText = formatCurrentDate(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors:
            [
              Colors.amber,
              Colors.cyan,
            ],
            begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
              tileMode: TileMode.clamp,
            )
          ),
        ),
        title: const Text(
          "Bienvenido al portal Web de Administracion",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 3,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                timeText + "\n" + dateText ,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //activar y desactivar cuentas de usuarios
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    "Cuentas de Usuarios".toUpperCase() + "\n" + "Activos".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedUsersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "Cuentas de Usuarios".toUpperCase() + "\n" + "Bloqueados".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedUsersScreen()));
                  },
                ),
              ],
            ),

            //habilitar y deshabilitar vendedores
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    "Cuentas ded Vendedores".toUpperCase() + "\n" + "Activas".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedSellersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "Cuentas de Vendedores".toUpperCase() + "\n" + "Desactivas".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedSellersScreen()));
                  },
                ),
              ],
            ),

            //habilitar y deshabilitar motoristas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    "Cuentas de Motoristas".toUpperCase() + "\n" + "Activos".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedRidersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "Cuentas de Motoristas".toUpperCase() + "\n" + "Desactivos".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedRidersScreen()));
                  },
                ),
              ],
            ),

            //boton para cerrar sesion
            ElevatedButton.icon(
              icon: const Icon(Icons.logout, color: Colors.white,),
              label: Text(
                "Cerrar Sesion".toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(40),
                backgroundColor: Colors.amber,
              ),
              onPressed: ()
              {
                FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (c)=> const LoginScreen()));
              },
            ),


          ],
        ),
      ),
    );
  }
}
