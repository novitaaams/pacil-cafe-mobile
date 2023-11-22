import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/widgets/left_drawer.dart';
import 'package:pacil_cafe_mobile/widgets/pacil_cafe_card.dart';


class MyHomePage extends StatelessWidget {
    final int id;
    MyHomePage({Key? key, required this.id}) : super(key: key);
    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, const Color.fromARGB(255, 195, 146, 224)),
    ShopItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 135, 97, 157)),
    ShopItem("Logout", Icons.logout,Color.fromARGB(255, 101, 70, 118)),
];
    

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pacil Cafe',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:  const Color.fromARGB(255, 175, 128, 196),
        foregroundColor: Colors.white,
      ),
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
      drawer: LeftDrawer(id: id,),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Pacil cafe', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item, id);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}