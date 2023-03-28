import 'package:codigo_future/pages/profile_page.dart';
import 'package:codigo_future/services/my_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Mantequilla el último de los méxicanos";

  MyService mandarina = MyService();

  @override
  void initState() {
    super.initState();
    // getFullName().then((value) {
    //   name = value;
    //   setState(() {});
    // });

    getData();
  }

  getData() async {
    name = await getFullName();
    setState(() {});
  }

  Future<String> getFullName() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return "Sonia Justiniano";
    });
  }

  Future<List> getProduct() async {
    return Future.delayed(const Duration(seconds: 5), () {
      return ["Camisa", "Zapatos", "Corbata", "Vestidos"];
    });
  }

  @override
  Widget build(BuildContext context) {
    // getFullName().then(
    //   (value) {
    //     print("Estoy dentro del Future",);
    //     name = value;
    //   },
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "La Tiendita de Sonia",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: mandarina.getUsers(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List<Map<String, dynamic>> userSList = snap.data;
              //return Text(products.toString());

              return ListView.builder(
                //shrinkWrap: true,
                itemCount: userSList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      userSList[index]["full name "],
                    ),
                    subtitle: Text(
                      userSList[index]["email"],
                    ),
                    leading: CircleAvatar(
                      child: Text(
                        userSList[index]["full name "][0],
                      ),
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
