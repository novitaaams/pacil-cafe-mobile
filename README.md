# TUGAS 7
##  Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
- Stateless widget adalah widget yang tidak memiliki data atau status internal yang berubah. Mereka digunakan ketika komponen hanya perlu merender tampilan yang tidak akan berubah seiring waktu atau berdasarkan input eksternal. Stateless widget merender tampilan dengan cara yang tidak mempertahankan atau memperbarui status internal. Ini berarti ketika ada perubahan yang mempengaruhi widget ini, Anda harus membuat widget baru untuk menggantikannya. Contoh: Text, Icon, Image.
- Stateful widget adalah widget yang memiliki data atau status internal yang dapat berubah selama masa hidup widget tersebut. Mereka digunakan ketika Anda perlu mengelola perubahan tampilan berdasarkan perubahan data atau input pengguna. Stateful widget memiliki dua bagian utama: widget (yang bersifat stateless) dan objek State terkait yang mengelola status internal. Ketika status berubah, State akan membangun ulang widget untuk merefleksikan perubahan tersebut. Contoh: TextField, Checkbox, Slider.


## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- Widget MaterialApp 
digunakan sebagai elemen utama untuk menginisialisasi aplikasi Flutter. Ini bertanggung jawab untuk mengatur berbagai konfigurasi seperti tema, judul, dan halaman pertama yang akan ditampilkan.

- Scaffold 
berperan sebagai kerangka dasar aplikasi yang mengatur elemen-elemen utama seperti AppBar, isi layar (body), dan lainnya.

- AppBar 
adalah elemen yang digunakan untuk menampilkan bilah atas dalam aplikasi, termasuk judul dan warna latar belakang yang dapat disesuaikan.

- SingleChildScrollView 
adalah widget yang memungkinkan kontennya dapat digulir, berguna ketika kontennya lebih besar dari ruang yang tersedia.

- Padding 
digunakan untuk menambahkan ruang atau jarak antara elemen-elemen anaknya.

- Column 
adalah widget yang digunakan untuk menampilkan sekelompok elemen secara vertikal, satu di atas yang lain.

- Text 
digunakan untuk menampilkan teks di layar dengan berbagai gaya, ukuran, dan warna yang dapat disesuaikan.

- GridView.count 
digunakan untuk menampilkan daftar elemen dalam tata letak grid, seperti dalam kasus menampilkan kartu-kartu belanja.

- ShopCard 
adalah widget khusus yang dirancang untuk menampilkan item belanja dalam bentuk kartu, termasuk ikon, teks, dan respon terhadap sentuhan pengguna.

- Material 
mengatur tampilan kartu belanja dan memberikan efek latar belakang berwarna.

- InkWell 
digunakan untuk membuat area yang responsif terhadap sentuhan pengguna, seperti yang digunakan di dalam Material untuk menangani tindakan ketika kartu belanja diklik.

- SnackBar 
digunakan untuk menampilkan pesan sementara di bagian bawah layar setelah tindakan tertentu, seperti mengklik kartu belanja.

- Icons 
adalah kumpulan ikon bawaan yang disediakan oleh Flutter.

- ColorScheme 
digunakan untuk menentukan skema warna yang akan digunakan dalam aplikasi.

- UseMaterial3 
digunakan untuk mengaktifkan atau menonaktifkan fitur Material You di Flutter.



# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

1. Mengimport pada main.dart 
```
import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/menu.dart';
```
2. pada main.dart membuat kelas myApp yang mengextend StatelessWidget

```
import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/menu.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

```

3. import pada menu.dart 
import 'package:flutter/material.dart';


4. Membuat class MyHomePage yang nantinya akan menampilkan widget-widget pada halaman utama

```
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
          title: const Text(
            'Pacil Cafe',
          ),
        ),
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
                    'Pacil Cafe', // Text yang menandakan toko
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
                    return ShopCard(item);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      );
    }
}
```

5. Membuat ShopItem yang berisi atribut 

```
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

```

6. Membuat class ShopCard yang memakai data dari shopItem dan atributnya. 

```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```