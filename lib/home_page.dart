import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Mantequilla el último de los méxicanos";

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
      body: Center(
        child: FutureBuilder(
          future: getProduct(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List products = snap.data;
              //return Text(products.toString());

              return ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(products[index]);
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
