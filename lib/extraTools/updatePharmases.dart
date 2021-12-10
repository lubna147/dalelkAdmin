import 'package:dalelk/extraTools/internetConnectionTest.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class updatePharmases extends StatefulWidget {
  const updatePharmases({Key? key}) : super(key: key);

  @override
  _updatePharmasesState createState() => _updatePharmasesState();
}

class _updatePharmasesState extends State<updatePharmases> {
  TextEditingController ph1name = TextEditingController();
  TextEditingController ph1place = TextEditingController();
  TextEditingController ph2name = TextEditingController();
  TextEditingController ph2place = TextEditingController();
  TextEditingController ph3name = TextEditingController();
  TextEditingController ph3place = TextEditingController();

  final _formKey = new GlobalKey<FormState>();
  server serverC = new server();
  internetConnectionTest test = new internetConnectionTest();
  bool isSecond = false;
  bool isTherd = false;
  // server serverC = new server();
  clear() {
    ph1name.clear();
    ph1place.clear();
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'تعديل الصيدليات المناوبة',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(':الصيدلية الاولى'),
                    SizedBox(
                      height: 8,
                    ),
                    Text(':الاسم'),
                    TextFormField(
                      maxLines: 1,
                      controller: ph1name,
                      validator: (value) =>
                          (value == '') ? 'الرجاء ملئ الحقل' : null,
                      //       onSaved: (value) => _email = value,

                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          //     hintText: 'صبايا للاكسسوارات',
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        width: 100,
                        child: Text(
                          'العنوان',
                          textAlign: TextAlign.right,
                        )),
                    TextFormField(
                      maxLines: 1,
                      controller: ph1place,
                      validator: (value) =>
                          (value == '') ? 'الرجاء ملئ الحقل' : null,
                      //       onSaved: (value) => _email = value,

                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          //     hintText: 'صبايا للاكسسوارات',
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Visibility(
                    visible: isSecond,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(':الصيدلية الثانية'),
                        SizedBox(
                          height: 8,
                        ),
                        Text(':الاسم'),
                        TextFormField(
                          maxLines: 1,
                          controller: ph2name,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              //     hintText: 'صبايا للاكسسوارات',
                              hintStyle: TextStyle(color: Colors.black38)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                            width: 100,
                            child: Text(
                              'العنوان',
                              textAlign: TextAlign.right,
                            )),
                        TextFormField(
                          maxLines: 1,
                          controller: ph2place,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              //     hintText: 'صبايا للاكسسوارات',
                              hintStyle: TextStyle(color: Colors.black38)),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 24,
                ),
                Visibility(
                    visible: isTherd,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(':الصيدلية الثالثة'),
                        SizedBox(
                          height: 8,
                        ),
                        Text(':الاسم'),
                        TextFormField(
                          maxLines: 1,
                          controller: ph3name,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              //     hintText: 'صبايا للاكسسوارات',
                              hintStyle: TextStyle(color: Colors.black38)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                            width: 100,
                            child: Text(
                              'العنوان',
                              textAlign: TextAlign.right,
                            )),
                        TextFormField(
                          maxLines: 1,
                          controller: ph3place,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              //     hintText: 'صبايا للاكسسوارات',
                              hintStyle: TextStyle(color: Colors.black38)),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (!isSecond) {
                            setState(() {
                              isSecond = true;
                            });
                          } else
                            setState(() {
                              isTherd = true;
                            });
                        },
                        child: Text('إضافة'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffc5cec3)),
                            //       shape: MaterialStateProperty.all(OutlinedBorder(side: )))) ,
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(8)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 12, color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final FormState? form = _formKey.currentState;
                          if (form!.validate()) {
                            print('Form is valid');
                            updateData();
                          } else {
                            print('Form is invalid');
                          }
                        },
                        child: Text('موافق'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffc5cec3)),
                            //       shape: MaterialStateProperty.all(OutlinedBorder(side: )))) ,
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(8)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 12, color: Colors.white))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('إلغاء'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffc5cec3)),
                            //       shape: MaterialStateProperty.all(OutlinedBorder(side: )))) ,
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(8)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 12, color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateData() {
    int i = 0;
    //   temp = loadingPage();

    test.check().then((intenet) {
      if (intenet != null && intenet) {
        serverC.updatePharmases(
            {"name": ph1name.text, "place": ph1place.text}, 1).then((value) {
          if (value)
            done();
          else
            retry();
        });
        serverC.updatePharmases(
            {"name": ph2name.text, "place": ph2place.text}, 2).then((value) {
          if (value)
            done();
          else
            retry();
        });
        serverC.updatePharmases(
            {"name": ph3name.text, "place": ph3place.text}, 3).then((value) {
          if (value)
            done();
          else
            retry();
        });
        clear();
      } else {
        noInternet();
      }
    });
  }

  noInternet() {
    Fluttertoast.showToast(
        msg: "!الرجاء التأكد من اتصالك بالانترنت",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 13);
  }

  done() {
    Fluttertoast.showToast(
        msg: "!تم حفظ البيانات بنجاح",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 13);
  }

  retry() {
    Fluttertoast.showToast(
        msg: "!حدث خطأ . الرجاء المحاولة لاحقاً",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 13);
  }
}
