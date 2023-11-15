# Tugas 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

  - Navigator.push(): Fungsinya adalah untuk menambahkan halaman baru ke dalam tumpukan navigasi. Dengan kata lain, halaman yang saat ini ditampilkan akan tetap ada dalam tumpukan, dan halaman baru akan ditambahkan di atasnya. Contohnya:

  ```
  if (item.name == "Tambah Item") {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const ShopFormPage()));
  }
  ```

  - Navigator.pushReplacement():  Fungsinya adalah menggantikan halaman saat ini dengan halaman baru. Metode ini bermanfaat ketika Anda ingin mengganti halaman tanpa menyimpannya di tumpukan navigasi. Berikut adalah contohnya:
  ```
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ShopFormPage()),
  );
  ```

  - Jadi, sementara Navigator.push() menambahkan halaman ke dalam tumpukan navigasi, Navigator.pushReplacement() menggantikan halaman yang saat ini ditampilkan dengan halaman baru, tanpa menyimpannya dalam tumpukan.


## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!


- Container: Komponen ini berfungsi sebagai wadah yang dapat disesuaikan dengan berbagai properti seperti warna, padding, dan sebagainya. Ideal digunakan untuk pembungkus umum.

- Row dan Column: Digunakan untuk menyusun widget secara horizontal (Row) atau vertikal (Column). Berguna  untuk tata letak yang lebih kompleks.

- Stack: Menata widget di atas satu sama lain, berguna misalnya ketika Anda ingin meletakkan teks di atas gambar.

- ListView: Widget ini berguna ketika Anda memiliki daftar item yang panjang, memungkinkan pengguna untuk melakukan scroll guna melihat semua item.

- GridView: Ideal digunakan untuk menampilkan data dalam bentuk grid atau tabel.


## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

- TextFormField untuk Nama Item:
    Tipe Data: String
    Alasan: Berfungsi sebagai alat untuk mengambil nama item yang ingin ditambahkan. Validasi diterapkan untuk memastikan input tidak dibiarkan kosong.
- TextFormField untuk Jumlah:
    Tipe Data: int
    Alasan: Meskipun menggunakan TextFormField, nilai input diubah menjadi tipe data int karena jumlah umumnya berupa angka. Validasi dilakukan untuk memastikan input tidak hanya berupa angka tetapi juga tidak boleh kosong.
- TextFormField untuk Deskripsi:
    Tipe Data: String
    Alasan: Digunakan untuk mengambil deskripsi item yang akan ditambahkan. Validasi diimplementasikan untuk memastikan input tidak dibiarkan kosong.

- TextFormField dipakai karena cocok untuk inputan yang harus divalidasi lebih lanjut

## Bagaimana penerapan clean architecture pada aplikasi Flutter?
  Clean architecture di dalam Flutter mengimplikasikan pemisahan kode ke dalam beberapa lapisan, antara lain Presentation Layer (UI), Domain Layer (Bisnis Logic), dan Data Layer (Akses Data). Pendekatan ini membantu dalam menjaga kebersihan, struktur, dan kemudahan pengujian dari kode.

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

- Buatlah direktori baru dengan nama "widgets" dan buatlah file baru di dalamnya dengan nama "left_drawer.dart". Selanjutnya, masukkan kode berikut ke dalam file tersebut. Setelah itu, tambahkan kode tersebut pada bagian header dari drawer.

```
import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/screens/menu.dart';
import 'package:pacil_cafe_mobile/screens/pacil_cafe_form.dart';
import 'package:pacil_cafe_mobile/screens/pacil_cafe_page.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 107, 129),
                ),
                child: Column(
                  children: [
                    Text(
                      'Pacil Cafe',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                    "Catat seluruh keperluan belanjamu di sini!",
                    style: TextStyle(
                      fontSize: 15,      // Ukuran font 15
                      color: Colors.white,  // Warna teks putih
                      fontWeight: FontWeight.normal,  // Weight biasa
                    ),
                    textAlign: TextAlign.center, // Center alignment
                  )
                  ],
                ),
              ),
          
          // TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke ShopFormPage di sini,
              setelah halaman ShopFormPage sudah dibuat.
              */
               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
           ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Lihat Item'),
            // Bagian redirection ke FragranceFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemListPage(itemList: itemList),
                  ));
            },
          )
        ],
      ),
    );
  }
}
```


- Menambahkan import drawer widget pada file menu.dart
```
import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/widgets/left_drawer.dart';
import 'package:pacil_cafe_mobile/widgets/pacil_cafe_card.dart';
```
- Buatlah sebuah berkas baru dan beri nama "pacil_cafe_form.dart", kemudian tambahkan kode berikut ke dalam berkas tersebut.
```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya
import 'package:pacil_cafe_mobile/widgets/left_drawer.dart';
import 'package:pacil_cafe-mobile/models/pacil_cafe_models.dart';

List<Item> itemList = [];

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Form Tambah Item',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 175, 128, 196),
          foregroundColor: Colors.white,
        ),
        // TODO: Tambahkan drawer yang sudah dibuat di sini
        drawer: const LeftDrawer(),
        body: Form(
        child: SingleChildScrollView(
        ),
      );
    }
}
```
- Membuat variabel baru dengan nama _formKey. Setelah itu, menambahkan _formKey ke dalam atribut key pada widget Form Atribut key untuk handler dari form state, validasi form, dan penyimpanan form.

```
...
class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
...
```
```
...
body: Form(
     key: _formKey,
     child: SingleChildScrollView(),
),
...
```

- Membuat widget TextFormField yang dibungkus oleh Padding yang merupakan children dari widget Column. Lalu menambahkan crossAxisAlignment untuk atur alignment children

```
 child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
```

- Kemudian, buatlah dua bidang input teks dengan menggunakan widget TextFormField. Bungkus masing-masing input teks dengan widget Padding, dan jadikan keduanya sebagai child dari widget Column. Satu untuk kolom "amount" dan yang lainnya untuk kolom "description".

```
Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // TODO: Tambahkan variabel yang sesuai
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      // TODO: Tambahkan variabel yang sesuai
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
```


- Selanjutnya, buatlah sebuah tombol yang diapit oleh widget Padding dan diatur posisinya menggunakan widget Align. Jadikan tombol tersebut sebagai child dari widget Column untuk membuat pop-up. Dalam bagian onPressed() dari tombol, tambahkan fungsi showDialog(). Setelah itu, tampilkan AlertDialog dan sertakan fungsi untuk mereset formulir.

```
  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color.fromARGB(255, 175, 128, 196)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Item newItem = Item(
                          name: _name,
                          amount: _amount,
                          description: _description,
                        );
                        itemList.add(newItem);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                  // TODO: Munculkan value-value lainnya
                                    Text('Nama: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      _formKey.currentState!.reset();
                      }
                    },
                    
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ),
              ),
```

- Setelah itu membuat file baru yang bernama pacil_cafe_card.dart pada folder widgets. Lalu memindahkan isi widget ShopItem pada menu,dartke file pacil_cafe_card.cart

```
import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/screens/pacil_cafe_form.dart';
import 'package:pacil_cafe_mobile/screens/pacil_cafe_page.dart';


class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}


class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
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

- Menambahkan kode di file pacil_cafe_card.dart pada widget ShopItem agar bisa navigasi ke route lain

```
 // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!")));
            if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
             Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
          
        },
```
- Membuat file baru dengan nama pacil_cafe_page untuk memunculkan item yang ditambahkan. File tersbut berisi kode
```
import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/models/pacil_cafe_models.dart';
import 'package:pacil_cafe_mobile/widgets/left_drawer.dart';

class ItemListPage extends StatelessWidget {
  final List<Item> itemList; 

  const ItemListPage({Key? key, required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
        backgroundColor: const Color.fromARGB(255, 175, 128, 196),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              title: Text(itemList[index].name),
              subtitle: Text('Jumlah: ${itemList[index].amount}'),
              onTap: () {
                // Menampilkan popup dengan informasi barang yang di-klik
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(itemList[index].name),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Jumlah: ${itemList[index].amount}'),
                          Text('Deskripsi: ${itemList[index].description}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
```

- Membuat folder dengan nama screens pada folder lib. Lalu memindahkan file menu.dart dan pacil_cafe_form.dart dan pacil_cafe_page ke folder screens
- Membuat folder baru dengan nama models pada folder lib. Lalu membuat file baru dengan nama pacil_cafe_models.dart isi file dengan kode

```
class Item {
  String name;
  int amount;
  String description;

  Item({
    required this.name,
    required this.amount,
    required this.description,
  });
}
```












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