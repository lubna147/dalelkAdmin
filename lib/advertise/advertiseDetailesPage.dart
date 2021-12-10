import 'package:dalelk/advertise/advertiseClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class advertiseDetailesPage extends StatelessWidget {
  advertiseClass temp;
  advertiseDetailesPage(this.temp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Container(
          color: Colors.white,
          //      height: MediaQuery.of(context).size.height * 0.9999,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(40)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image: 'https://dalelalbab.xyz/${temp.imageUrl}',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(temp.owner),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: Text(temp.title),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                          onTap: () {
                            print(this.temp.phonenum);
                            FlutterOpenWhatsapp.sendSingleMessage(
                                this.temp.phonenum.substring(0),
                                "رأيت هذا المنتج على تطبيق دليلك");
                            print(this.temp.phonenum);
                          },
                          child: Text(temp.phonenum)),
                      SizedBox(
                        height: 8,
                      ),
                      Text(temp.price),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24, left: 8),
                        child: Text(temp.location),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Text(
                            temp.detailes,
                            textAlign: TextAlign.right,
                          )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
