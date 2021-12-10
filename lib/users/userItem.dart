import 'package:dalelk/extraTools/internetConnectionTest.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:dalelk/users/addNewUser.dart';
import 'package:dalelk/users/userClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class userItem extends StatefulWidget {
  final VoidCallback onDelete;
  userClass user;
  userItem(this.user, {required this.onDelete});

  @override
  _userItemState createState() => _userItemState();
}

class _userItemState extends State<userItem> {
  internetConnectionTest test = new internetConnectionTest();
  server serverC = new server();
  @override
  Widget build(BuildContext context) {
    print(widget.user.id);
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            top: 8,
          ),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              border: Border.all(color: Color(0xffc5cec3), width: 1)),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                info(widget.user.name, Foundation.torsos_all),
                info(widget.user.phoneNumber, MaterialCommunityIcons.whatsapp),
                info(widget.user.userName, MaterialCommunityIcons.account),
                info(widget.user.passWord,
                    MaterialCommunityIcons.textbox_password),
                info(widget.user.shopName, MaterialCommunityIcons.shopping),
                info(widget.user.shopLocation,
                    MaterialCommunityIcons.map_marker),
                info(widget.user.shopPhone, MaterialCommunityIcons.whatsapp),

                // info(widget.job.detailes, MaterialCommunityIcons.file_multiple),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                addNewUser(widget.user)))
                                    .then((value) {
                                  widget.onDelete();
                                });
                              },
                              icon:
                                  Icon(Icons.edit, color: Color(0xffc5cec3)))),
                      Container(
                        height: 40,
                        color: Color(0xffc5cec3),
                        width: 1,
                        //   height: MediaQuery.of(context).size.height,
                      ),
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
                ),
              ])),
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

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("إلغاء"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("متابعة"),
      onPressed: () {
        test.check().then((intenet) {
          if (intenet != null && intenet) {
            serverC.deletUser(widget.user.id).then((value) {
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
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "تنبيـه",
        textAlign: TextAlign.right,
      ),
      content: Text(" هل تريد حذف المستخدم؟",
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
