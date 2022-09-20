import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/Details.dart';
import 'package:qualifflutter/Homepage.dart';
import 'package:qualifflutter/Itemm.dart';
import 'package:qualifflutter/Login.dart';
import 'package:qualifflutter/Review.dart';
import 'package:qualifflutter/Theme.dart';
import 'package:provider/provider.dart';

class Item extends StatelessWidget {
  String email;
  Item({super.key, required this.email});

  var items = [
    Itemm(
        productName:
            "MAYBELLINE Volum’ Express The Colossal Waterproof Mascara",
        price: "Rp62.900",
        image: "./assets/Prod1.jpg",
        review: [],
        description:
            "Dapatkan bulu mata tebal seperti pakai eyelash extension dengan satu kali pulasan mascara collagen dari Maybelline Magnum Big shot.\n\nBenefits :\n- Collagen Formula - merawat dan memberikan efek bulu mata tebal yang dramatis\n- Big shot brush – aplikator maskara yang dapat memberikan efek bulu mata tebal hanya dalam sekali pulasan"),
    Itemm(
        productName: "IM BOOST IMBOOST EXTRA VIT C + D 6X8'S",
        price: "Rp32.500",
        image: "./assets/Prod2.jpg",
        review: [],
        description: "IMBOOST EXTRA VIT C + D3"),
    Itemm(
        productName:
            "WATSONS Watsons Cream Body Wash Cantaloupe Scented 1000ml",
        price: "Rp69.900",
        image: "./assets/Prod3.jpg",
        review: [],
        description:
            "Watsons Cantaloupe Scented Cream Bath merupakan sabun untuk tubuh yang lembut dan efektif membersihkan dan melembabkan kulitmu Kombinasi antara krim mandi yang menyegarkan dan permbersih yang lembut dengan wangi cantaloupes dan membuat kulit semakin lembut dan halus"),
    Itemm(
        productName: "SEA QUILL Vit E Full Spectrum 100s'",
        price: "Rp501.600",
        image: "./assets/Prod4.jpg",
        review: [],
        description:
            "Suplemen Vitamin E alami yang mengandung keseluruhan keluarga besar tocopherol yaitu dalpha dbeta dgamma dan ddelta tocopherol sehingga memberikan manfaat vitamin E sepenuhnya bagi kesehatan tubuh Anda"),
    Itemm(
        productName: "WATSONS Washproof Plaster 25s",
        price: "Rp18.900",
        image: "./assets/Prod5.jpg",
        review: [],
        description:
            "WATSONS Washproof Plaster 25s Watsons Washproof Plasters are sterilised, ventilated and water resistant to allow the wound to breathe and help the natural healing process. They are latex free and suitable for sensitive skin."),
    Itemm(
        productName: "VASELINE Lotion Healthy White Uv Lightening 200m",
        price: "Rp29.600",
        image: "./assets/Prod6.jpg",
        review: [],
        description:
            "Vaseline Healthy Bright UV Extra Brightening Hand Body Lotion (sebelumnya Healthy White) mengandung vitamin B3 yang membuat kulit lebih sehat dan lebih cerah dalam 2 minggu.")
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Watson"),
          backgroundColor: themeProvider.getTheme.secondaryHeaderColor,
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
        body: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 8.0 / 10.0,
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return Details(
                            email: email,item:items[index],
                          );
                        })));
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Container(

                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(items[index].image),
                                fit: BoxFit.scaleDown),
                          ),
                        )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              items[index].productName,
                              style: TextStyle(fontSize: 13.0),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 3, bottom: 10.0),
                            child: Text(
                              items[index].price,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600),
                            )),
                      ],
                    ))),
            );
          },
        ));
  }
}
