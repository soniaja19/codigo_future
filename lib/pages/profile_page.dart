import 'package:codigo_future/services/my_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  MyService mandarina = MyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: mandarina.getProfile(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            Map profile = snap.data;
            return Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    profile["image"],
                  ),
                ),
                ListTile(
                  title: Text(
                    profile["name"],
                  ),
                  subtitle: const Text(
                    ("Nombres"),
                  ),
                ),
                ListTile(
                  title: Text(
                    profile["last name"],
                  ),
                  subtitle: const Text(
                    ("Apellidos"),
                  ),
                ),
                ListTile(
                  title: Text(
                    profile["phone"],
                  ),
                  subtitle: const Text(
                    ("Celular"),
                  ),
                ),
                ListTile(
                  title: Text(
                    profile["adress"],
                  ),
                  subtitle: const Text(
                    ("Dirección"),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
