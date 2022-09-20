import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/Car.dart';
import 'package:qualifflutter/Info.dart';
import 'package:qualifflutter/Item.dart';
import 'package:qualifflutter/Login.dart';
import 'package:qualifflutter/Theme.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  String email;
  Homepage({super.key, required this.email});
  
  var cars = [
    Car(image: './assets/Car1.jpg'),
    Car(image: './assets/Car2.jpg'),
    Car(image: './assets/Car3.jpg')
  ];
  var infos = [
    Info(
        title: "Member Benefit",
        description:
            "Voucher Khusus Member\n\nBelanja Dapat Poin\n\nEkstra Diskon\n\nFree Delivery*",
        image: "./assets/info1.jpg"),
    Info(
        title: "Ketentuan Layanan Watson Send",
        description:
            "Layanan ini tersedia setiap hari dari jam 11.00 - 20.00 dengan mengikuti kebijakan operasional masing-masing mall.\n\nNominal pembayaran sesuai dengan konfirmasi dari gerai kami.\n\nHarga belum termasuk ongkos kirim.\n\nPembayaran melalui link invoice yang dikirim oleh toko dan tidak melayani pembayaran bayar di tempat atau Cash On Delivery (COD).",
        image: "./assets/info3.jpg"),
    Info(
        title: "Watson Store",
        description:
            "PONDOK INDAH MALL 2_ID - Jl. Metro Pondok Indah, Blok. IIIB Lt. 2 Unit 238,Lt 2, Jakarta Selatan, DKI Jakarta, 12310\n\nMALL KELAPA GADING 3_ID - Jl. Bulevar Kelapa Gading, Blok M Lt. GF Unit 607A, Jakarta Utara, DKI Jakarta, 14240\n\nKOTA KASABLANKA_ID - Jl. Casablanca Raya, Kav. 88 Lt. LG Unit 91-92, Jakarta Selatan, DKI Jakarta, 12870",
        image: "./assets/info2.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Watson"),
        backgroundColor: themeProvider.getTheme.secondaryHeaderColor ,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              themeProvider.changeTheme();
            },
            icon: Icon(Icons.brightness_6),
            color: Colors.white,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("header")),
            Card(
              child: email != null
                  ? ListTile(title: Text(email))
                  : ListTile(title: const Text("profile")),
            ),
            Card(
                child: ListTile(
                    title: Text("Home"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return Homepage(
                          email: email,
                        );
                      })));
                    })),
            Card(
                child: ListTile(
                    title: Text("Items"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return Item(
                          email: email,
                        );
                      })));
                    })),
            Card(
                child: ListTile(
                    title: Text("Sign out"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return Login();
                      })));
                    }))
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: cars.map((e) => Image.asset(e.image)).toList(),
            options: CarouselOptions(
                autoPlay: true, autoPlayInterval: const Duration(seconds: 6)),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: infos.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(infos[index].image),
                        Padding(
                          padding: EdgeInsets.only(bottom: 13, top: 13),
                          child: Text(infos[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 13),
                            child: Text(infos[index].description,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16)))
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
