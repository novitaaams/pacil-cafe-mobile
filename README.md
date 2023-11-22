# Tugas 9


# Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, memang mungkin untuk mengambil data JSON langsung di Flutter tanpa perlu membuat model terlebih dahulu. Data JSON dapat diolah dan disimpan sebagai Map<String, dynamic> atau List<Map<String, dynamic>>, tergantung pada struktur JSON yang diterima. Meski demikian, terdapat beberapa kekurangan dalam pendekatan ini:

- Ketidakefisienan: Mengelola data langsung dari JSON memerlukan penanganan manual untuk setiap field data, yang dapat menjadi rumit dan rentan terhadap kesalahan.

- Ketidakteraturan Kode: Kode menjadi kurang terstruktur dan sulit dibaca karena memerlukan banyak pemetaan manual.

- Ketidakpastian Tipe Data: Tanpa menggunakan model, tidak ada jaminan keamanan tipe data. Kesalahan tipe data dapat terjadi, karena struktur data JSON hanya diketahui pada saat runtime.

- Tidak Mudah Dikembangkan dan Dipelihara: Dengan menggunakan model, memperbarui atau mengubah struktur data menjadi lebih mudah dan terpusat, memberikan kemudahan dalam pengembangan dan pemeliharaan kode.

#  Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest adalah suatu objek atau kelas yang digunakan untuk mengelola permintaan HTTP yang melibatkan cookies. Instance CookieRequest dibagikan kepada semua komponen dalam aplikasi Flutter untuk membantu menjaga konsistensi dan integritas data cookies di seluruh aplikasi. Sebagai contoh, jika kita perlu melacak sesi pengguna atau informasi autentikasi melalui cookies, instance yang dibagikan ke semua komponen dalam aplikasi akan memastikan bahwa informasi ini dapat diakses dan diperbarui secara konsisten di seluruh bagian aplikasi tersebut.


#  Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Prosesnya melibatkan melakukan permintaan HTTP, umumnya menggunakan paket seperti http, untuk mengambil data JSON dari server. Setelah respons diterima, data JSON diurai dan diorganisir ke dalam objek yang sesuai. Widget Flutter kemudian menggunakan objek tersebut untuk membangun antarmuka pengguna.

# Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Secara umum, langkahnya mencakup formulir input pengguna di Flutter yang dikirimkan ke backend Django melalui permintaan HTTP. Django akan memproses dan mengautentikasi informasi yang diterima. Jika autentikasi berhasil, server akan menghasilkan token atau sesi, yang selanjutnya dapat disimpan di Flutter dan digunakan untuk permintaan berikutnya. Apabila token sudah tidak berlaku, proses autentikasi perlu dijalankan kembali.

# Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.


AppBar: Menampilkan judul "Item".
LeftDrawer: Menampilkan Drawer di sebelah kiri dengan opsi navigasi.
FutureBuilder: Membuat widget yang bergantung pada hasil operasi asynchronous fetchItem.
CircularProgressIndicator: Ditampilkan saat data sedang diambil.
ListView.builder: Membangun daftar item dengan model Item.
MaterialApp: Widget utama untuk aplikasi Flutter.
TextField: Input untuk username.
TextField: Input untuk password (bersifat tersembunyi).
ElevatedButton: Tombol untuk melakukan login.
SnackBar: Pesan notifikasi setelah login berhasil atau gagal.
Scaffold: Menampilkan halaman utama dengan app bar, drawer, dan login.
LeftDrawer: Menampilkan Drawer di sebelah kiri dengan opsi navigasi.
GridView.count: Menampilkan item dalam bentuk grid.
ShopCard: Menyediakan card untuk setiap item dalam grid.
Drawer: Memberikan menu navigasi ke halaman utama, tambah item, dan lihat item.
String name: Menyimpan nama item.
IconData icon: Mengandung ikon yang mewakili item.
Color color: Menyimpan warna latar belakang item.
Material: Menyediakan latar belakang untuk card.
InkWell: Membuat card responsif terhadap sentuhan.
Icon: Menampilkan ikon untuk item.
Text: Menampilkan nama item.
Scaffold: Menampilkan halaman formulir untuk menambahkan item.
Form: Digunakan untuk menangani formulir.
TextFormField: Input untuk nama, jumlah, dan deskripsi item.
ElevatedButton: Tombol untuk menyimpan item baru.
Provider: Membungkus aplikasi dengan CookieRequest sebagai provider.
Container: Digunakan sebagai widget umum untuk mengelola tata letak dan dekorasi.
Column dan Row: Digunakan untuk mengatur widget secara vertikal (Column) atau horizontal (Row).
Http Package (http): Digunakan untuk melakukan permintaan HTTP ke server.
Navigator: Mengelola navigasi antar halaman dalam aplikasi Flutter.
Form dan TextFormField: Digunakan untuk mengelola formulir dan input teks.


# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

## Membuat halaman login pada proyek tugas Flutter.

- Membuat file login.dart pada folder screens yang berisi untuk login dan register

```
import 'package:pacil_cafe_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/screens/register.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 175, 128, 196),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Cek kredensial
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                // gunakan URL http://10.0.2.2/
                final response = await request.login(
                    "https://novita-mulia-tugas.pbp.cs.ui.ac.id/auth/login/", {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  int id = response['id'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(id: id)),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$message Selamat datang, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
            SizedBox(height: 20),
            Text(
              'Don`t have an account yet?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage()),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

- Membuat sebuah aplikasi Django dengan nama "authentication" dan kemudian menambahkannya ke dalam setting INSTALLED_APPS pada file utama settings.py. Setelah itu, melakukan instalasi library yang diperlukan dengan perintah "pip install django-cors-headers". Setelah instalasi selesai, menambahkan "corsheaders" ke dalam setting INSTALLED_APPS, serta menambahkan "corsheaders.middleware.CorsMiddleware" ke dalam setting MIDDLEWARE pada file settings.py. Selain itu, beberapa variabel juga perlu ditambahkan atau disesuaikan pada file settings.py proyek utama.

```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
- Lalu membuat fungsi view untuk login pada file authentication/views.py

```

from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import logout as auth_logout
from django.contrib.auth.models import User


@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!",
                "id": user.id,
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)

@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)

@csrf_exempt
def register(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        new_user = User.objects.create_user(username=username, password=password)
            
        return JsonResponse({
            "status": True,
            "message": "Account created successfully!",
            "user_id": new_user.id,
        }, status=200)
    
    return JsonResponse({
        "status": False,
        "message": "Invalid request method."
    }, status=405)

```

- Kemudian, pada file urls.py di dalam aplikasi "authentication", menambahkan konfigurasi routing URL untuk mengarahkan ke fungsi-fungsi yang telah dibuat sebelumnya.

- Melakukan instalasi paket, kemudian mengimplementasikan fungsionalitas paket tersebut dan mengubah widget root untuk menyediakan perpustakaan CookieRequest ke semua widget anak dengan menggunakan Provider.


# Membuat model kustom sesuai dengan proyek aplikasi Django.
- Membuat file item.dart pada folder models

```
// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
    };
}
```

# Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

- Membuat file bernama list_item.dart pada folder screens
```
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya
import 'package:pacil_cafe_mobile/screens/menu.dart';
import 'package:pacil_cafe_mobile/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
 final int id;
  const ShopFormPage({super.key, required this.id});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    final int id = widget.id;
    final request = context.watch<CookieRequest>();
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
      drawer: LeftDrawer(id: id),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 175, 128, 196)),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                            "https://novita-mulia-tugas.pbp.cs.ui.ac.id/create-flutter/",
                            jsonEncode(<String, String>{
                              'name': _name,
                              'amount': _amount.toString(),
                              'description': _description,
                              // TODO: Sesuaikan field data sesuai dengan aplikasimu
                            }));
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Item baru berhasil disimpan!"),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(id: id)),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text("Terdapat kesalahan, silakan coba lagi."),
                          ));
                        }
                          }
                    },
                        
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

# Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

- Membuat file bernama list_item_detail.dart pada folder screens
```
import 'package:flutter/material.dart';
import 'package:pacil_cafe_mobile/models/item.dart';

class ItemDetailPage extends StatelessWidget {
  
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        backgroundColor: const Color.fromARGB(255, 175, 128, 196),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${item.fields.name}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text('Amount: ${item.fields.amount}'),
                    const SizedBox(height: 10),
                    Text('Description: ${item.fields.description}'),
                  ],
                ),
              ),
            ),
        ),
      )
    );
  }
}
```




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