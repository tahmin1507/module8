import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Assignment 7",
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List myItem = [
    {"Name": "Banana", "Price": "tk-5", "count": 0},
    {"Name": "Rice", "Price": "tk-70", "count": 0},
    {"Name": "Fish", "Price": "tk-180", "count": 0},
    {"Name": "Mutton", "Price": "tk-1100", "count": 0},
    {"Name": "Chicken", "Price": "tk-190", "count": 0},
    {"Name": "Beef", "Price": "tk-750", "count": 0},
    {"Name": "Milk", "Price": "tk-80", "count": 0},
    {"Name": "Onion", "Price": "tk-60", "count": 0},
    {"Name": "Potato", "Price": "tk-40", "count": 0},
    {"Name": "Mango", "Price": "tk-90", "count": 0},
    {"Name": "Bat", "Price": "tk-350", "count": 0},
    {"Name": "Football", "Price": "tk-500", "count": 0},
    {"Name": "Jersy", "Price": "tk-400", "count": 0},
    {"Name": "Cap", "Price": "tk-250", "count": 0},
    {"Name": "Watch", "Price": "tk-990", "count": 0},
  ];

  MyAlertDialog(context, name) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: const Text("Congratulations!"),
              content: Text("You've bought 5 $name "),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Product List"),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const CartPage()));
          },
        ),
        body: ListView.builder(
          itemCount: myItem.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(myItem[index]["Name"]),
              subtitle: Text(myItem[index]["Price"]),
              trailing: Column(
                children: [
                  Text("Count: ${myItem[index]["count"].toString()}"),
                  Container(
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {
                        myItem[index]["count"]++;

                        if (myItem[index]["count"] == 5) {
                          MyAlertDialog(context, myItem[index]["Name"]);
                        }

                        setState(() {});
                      },
                      child: const Text("Buy Now"),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text("Cart"),
        ),
        body: const Center(
          child: Text(
            "Total Products: 5",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ));
  }
}