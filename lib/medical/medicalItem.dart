import 'package:dalelk/extraTools/internetConnectionTest.dart';
import 'package:dalelk/extraTools/openFile.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:dalelk/medical/medicalItemClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class medicalItem extends StatefulWidget {
  medicalItemClass temp;
  final VoidCallback onDelete;
  medicalItem(this.temp, {required this.onDelete});

  @override
  _medicalItemState createState() => _medicalItemState();
}

class _medicalItemState extends State<medicalItem> {
  IconData medicalIcon = MaterialCommunityIcons.stethoscope;
  bool numVis = false;
  bool fileVis = false;

  internetConnectionTest test = new internetConnectionTest();
  server serverC = new server();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!(widget.temp.phoneNum == "")) numVis = true;
    if (!(widget.temp.filePath == "")) fileVis = true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          top: 8,
        ),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            border: Border.all(color: Color(0xffc5cec3), width: 1)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            info(widget.temp.name, medicalIcon),
            //  info('', MaterialCommunityIcons.briefcase),
            info(widget.temp.location,
                MaterialCommunityIcons.map_marker_multiple),
            Visibility(
                visible: numVis,
                child: info(
                    widget.temp.phoneNum, MaterialCommunityIcons.whatsapp)),
            Visibility(
                visible: fileVis,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => openfile(
                                  'https://dalelalbab.xyz/${widget.temp.filePath}')));
                    },
                    child: info(
                        'جدول المناوبات ', MaterialCommunityIcons.view_list))),
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
            serverC.deletMedical(widget.temp.id).then((value) {
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
      content: Text(" هل تريد حذف العنصر؟",
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

  Padding info(String info, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(
            info,
            textAlign: TextAlign.right,
          )),
          SizedBox(
            width: 8,
          ),
          Icon(
            iconData,
            color: Color(0xffc5cec3),
          ),
        ],
      ),
    );
  }
}
