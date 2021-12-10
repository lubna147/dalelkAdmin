import 'package:dalelk/advertise/advertiseClass.dart';
import 'package:dalelk/advertise/advertiseDetailesPage.dart';
import 'package:dalelk/advertise/typeAdvertiseList.dart';
import 'package:dalelk/extraTools/mySharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:fluttertoast/fluttertoast.dart';

class normalAdvertise extends StatefulWidget {
  advertiseClass temp;
  final VoidCallback onDelete;
  normalAdvertise(this.temp, {required this.onDelete});

  @override
  _normalAdvertiseState createState() => _normalAdvertiseState();
}

class _normalAdvertiseState extends State<normalAdvertise> {
  List<int> listInt = [];

  goToDetailes() {
    //   Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => advertiseDetailesPage(widget.temp)));
  }

  TextStyle info = TextStyle(fontSize: 15, color: Colors.black54);
  Icon heart = Icon(
    MaterialIcons.favorite_border,
    color: Color(0xffc5cec3),
    size: 30,
  );
  String name = '';
  String title = '';
  String p = '';
  String ph = '';
  bool isFav = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MySharedPreferences.instance.getStringList('fav').then((value) {
      listInt = value!.map(int.parse).toList();
      if (listInt.contains(widget.temp.id))
        setState(() {
          heart = Icon(
            MaterialIcons.favorite,
            color: Color(0xffc5cec3),
            size: 30,
          );
          isFav = true;
        });
    });
  }

  late List<String> ids;
  @override
  Widget build(BuildContext context) {
    print('objectrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    print(widget.temp.owner);
    print(widget.temp.location);

    return InkWell(
      onTap: () {
        goToDetailes();
      },
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: 'https://dalelalbab.xyz/${widget.temp.imageUrl}',
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: Text(
                widget.temp.owner,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 16, left: 8),
              child: Text(
                widget.temp.title,
                textAlign: TextAlign.right,
                style: info,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 16, left: 8),
              child: InkWell(
                /*    onTap: () {
                  FlutterOpenWhatsapp.sendSingleMessage(
                      widget.temp.phonenum.substring(0),
                      "رأيت هذا المنتج على تطبيق دليلك");
                },*/
                child: Text(
                  widget.temp.price,
                  textAlign: TextAlign.right,
                  style: info,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 16, left: 8, bottom: 8),
              child: Text(
                widget.temp.location,
                textAlign: TextAlign.right,
                style: info,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Color(0xffc5cec3),
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("إلغاء"),
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      },
    );
    Widget continueButton = TextButton(
      child: Text("متابعة"),
      onPressed: () {
        test.check().then((intenet) {
          if (intenet != null && intenet) {
            serverC.deletAdvertise(widget.temp.id).then((value) {
              if (value) {
                Fluttertoast.showToast(
                    msg: "تم الحذف",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 13);
                widget.onDelete();
                Navigator.of(context).pop();
              } else {
                Fluttertoast.showToast(
                    msg: "حدث خطأ . الرجاء المحاولة لاحقاً",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 13);
              }
            });
          } else {
            Fluttertoast.showToast(
                msg: " الرجاء التحقق من اتصالك بالانترنت",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 13);
          }
        });

        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "تنبيـه",
        textAlign: TextAlign.right,
      ),
      content: Text(" هل تريد حذف الإعلان؟",
          style: TextStyle(fontSize: 12), textAlign: TextAlign.right),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
