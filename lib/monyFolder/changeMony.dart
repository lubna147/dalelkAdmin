import 'package:dalelk/extraTools/internetConnectionTest.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class changeMony extends StatefulWidget {
  const changeMony({Key? key}) : super(key: key);

  @override
  _changeMonyState createState() => _changeMonyState();
}

class _changeMonyState extends State<changeMony> {
  TextEditingController dolrSyBuy = new TextEditingController();
  TextEditingController dolrSySale = new TextEditingController();
  TextEditingController TurSyBuy = new TextEditingController();
  TextEditingController TurSySale = new TextEditingController();
  TextEditingController dolrTurBuy = new TextEditingController();
  TextEditingController dolrTurSale = new TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  List<String> state = ['لايوجد تعديل', 'ارتفاع', 'انخفاض'];
  String dolsy = 'ارتفاع';
  String trsy = 'ارتفاع';
  String doltr = 'ارتفاع';

  internetConnectionTest test = new internetConnectionTest();
  server serverC = new server();

  void dispose() {
    dolrSyBuy.clear();
    dolrSySale.clear();
    TurSyBuy.clear();
    TurSySale.clear();
    dolrTurBuy.clear();
    dolrTurSale.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'تعديل أسعار الصرف',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xffc5cec3),
                      )),
                  child: Center(
                    child: Text('دولار - ليرة سورية'),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: dolrSySale,
                          validator: (value) =>
                              (value == '') ? 'الرجاء ملئ الحقل' : null,
                          //       onSaved: (value) => _email = value,

                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(':مبيع'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: dolrSyBuy,
                          validator: (value) =>
                              (value == '') ? 'الرجاء ملئ الحقل' : null,
                          //       onSaved: (value) => _email = value,

                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(':شراء'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        selectedItemBuilder: (BuildContext context) {
                          return state.map<Widget>((String item) {
                            return Container(
                                width: 200,
                                child:
                                    Text(item, style: TextStyle(fontSize: 12)));
                          }).toList();
                        },
                        validator: (String? value) {
                          (value?.isEmpty ?? true) ? '' : null;
                        },
                        // hint: Text('التصنيفات'),
                        value: dolsy,
                        //   itemHeight: 20,
                        items: state.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Text(
                                  value,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dolsy = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xffc5cec3),
                      )),
                  child: Center(
                    child: Text('ليرة تركية - ليرة سورية'),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: TurSySale,
                          validator: (value) =>
                              (value == '') ? 'الرجاء ملئ الحقل' : null,
                          //       onSaved: (value) => _email = value,

                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(':مبيع'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: TurSyBuy,
                          validator: (value) =>
                              (value == '') ? 'الرجاء ملئ الحقل' : null,
                          //       onSaved: (value) => _email = value,

                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(':شراء'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        selectedItemBuilder: (BuildContext context) {
                          return state.map<Widget>((String item) {
                            return Container(
                                width: 200,
                                child:
                                    Text(item, style: TextStyle(fontSize: 12)));
                          }).toList();
                        },
                        validator: (String? value) {
                          (value?.isEmpty ?? true) ? '' : null;
                        },
                        // hint: Text('التصنيفات'),
                        value: trsy,
                        //   itemHeight: 20,
                        items: state.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Text(
                                  value,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            trsy = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xffc5cec3),
                      )),
                  child: Center(
                    child: Text('دولار - ليرة تركية'),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: dolrTurSale,
                          validator: (value) =>
                              (value == '') ? 'الرجاء ملئ الحقل' : null,
                          //       onSaved: (value) => _email = value,

                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(':مبيع'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: dolrTurBuy,
                          validator: (value) =>
                              (value == '') ? 'الرجاء ملئ الحقل' : null,
                          //       onSaved: (value) => _email = value,

                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(':شراء'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        selectedItemBuilder: (BuildContext context) {
                          return state.map<Widget>((String item) {
                            return Container(
                                width: 200,
                                child:
                                    Text(item, style: TextStyle(fontSize: 12)));
                          }).toList();
                        },
                        validator: (String? value) {
                          (value?.isEmpty ?? true) ? '' : null;
                        },
                        // hint: Text('التصنيفات'),
                        value: doltr,
                        //   itemHeight: 20,
                        items: state.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Text(
                                  value,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            doltr = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateData() {
    int i = 0;
    DateTime now = DateTime.now();
    print(now);
    //   temp = loadingPage();
    test.check().then((intenet) {
      if (intenet != null && intenet) {
        serverC.updateMony({
          'sale': dolrSySale.text,
          'buy': dolrSyBuy.text,
          'state': state.indexOf(dolsy).toString(),
          'updated_at': now.toString()
        }, 1).then((value) {
          if (value) {
            done();
          } else
            retry();
        });
        serverC.updateMony({
          'sale': TurSySale.text,
          'buy': TurSyBuy.text,
          'state': state.indexOf(trsy).toString(),
          'updated_at': now.toString()
        }, 2).then((value) {
          if (value) {
            done();
          } else
            retry();
        });
        serverC.updateMony({
          'sale': dolrTurSale.text,
          'buy': dolrTurBuy.text,
          'state': state.indexOf(doltr).toString(),
          'updated_at': now.toString()
        }, 3).then((value) {
          if (value) {
            done();
          } else
            retry();
        });
        dolrSyBuy.clear();
        dolrSySale.clear();
        TurSyBuy.clear();
        TurSySale.clear();
        dolrTurBuy.clear();
        dolrTurSale.clear();
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
