import 'package:flutter/material.dart';
import 'dummy_menu.dart'; // Import dummy_menu untuk akses data

class HomePage extends StatelessWidget {
  // Inisiasi Variabel
  final String username;
  final String? nickname;

  HomePage({Key? key, required this.username, this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Selamat Datang! $username", style: TextStyle(fontSize: 20)),
                if (nickname != null)
                  Text("Panggilan Saya $nickname", style: TextStyle(fontSize: 16)),
                  Text("Silahkan memilih menu dibawah ini"),
                SizedBox(height: 24),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodMenuList.length,
              itemBuilder: (context, index) {
                final menu = foodMenuList[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar Menu di Samping
                        Image.asset(
                          menu.imageAsset, 
                          height: 100, 
                          width: 100, 
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16), // Jarak antara gambar dan teks
                        
                        // Kolom untuk Teks (Nama, Deskripsi, dsb.)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama dan Kategori
                              Text(
                                menu.name,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Category: ${menu.category}",
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),

                              // Deskripsi
                              Text(
                                menu.description,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),

                              // Waktu Memasak
                              Text(
                                "Cooking Time: ${menu.cookingTime}",
                                style: TextStyle(fontSize: 14),
                              ),
                              
                              // Harga
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  menu.price,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.pink),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
