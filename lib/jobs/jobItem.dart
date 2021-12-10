import 'package:dalelk/extraTools/internetConnectionTest.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:dalelk/jobs/jobClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class jobItem extends StatefulWidget {
  jobClass job;
  final VoidCallback onDelete;
  jobItem(this.job, {required this.onDelete});

  @override
  _jobItemState createState() => _jobItemState();
}

internetConnectionTest test = new internetConnectionTest();
server serverC = new server();

class _jobItemState extends State<jobItem> {
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
            info(widget.job.boss, Foundation.torsos_all),
            info(widget.job.job, MaterialCommunityIcons.briefcase),
            info(widget.job.location,
                MaterialCommunityIcons.map_marker_multiple),
            info(widget.job.phoneNumber, MaterialCommunityIcons.whatsapp),
            info(widget.job.detailes, MaterialCommunityIcons.file_multiple),
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
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("متابعة"),
      onPressed: () {
        test.check().then((intenet) {
          if (intenet != null && intenet) {
            serverC.deletJob(widget.job.id).then((value) {
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
      content: Text(" هل تريد حذف الاعلان الوظيفي؟",
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
