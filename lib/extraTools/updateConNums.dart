//import 'dart:html';

import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'internetConnectionTest.dart';

class updateConNums extends StatefulWidget {
  updateConNums({Key? key}) : super(key: key);

  @override
  _updateConNumsState createState() => _updateConNumsState();
}

class _updateConNumsState extends State<updateConNums> {
  TextEditingController ContactNum1 = new TextEditingController();

  TextEditingController ContactNum2 = new TextEditingController();

  TextEditingController ContactNum3 = new TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'TR');

  final _formKey = new GlobalKey<FormState>();

  @override
  void dispose() {
    ContactNum1.clear();
    ContactNum2.clear();
    ContactNum3.clear();
    super.dispose();
  }

  String phone1 = '';

  String phone2 = '';

  String phone3 = '';

  internetConnectionTest test = new internetConnectionTest();

  server serverC = new server();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'تعديل أرقام تواصل التطبيق',
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
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text('الرقم الأول'),
                InternationalPhoneNumberInput(
                  textFieldController: ContactNum1,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    phone1 = number.phoneNumber.toString();
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  inputDecoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8)),
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  //  textFieldController: controller,
                  // formatInput: false,

                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: UnderlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text(':الرقم الثاني'),
                InternationalPhoneNumberInput(
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  textFieldController: ContactNum2,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    phone2 = number.phoneNumber.toString();
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },

                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  inputDecoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8)),
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  //  textFieldController: controller,
                  // formatInput: false,

                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: UnderlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text(':الرقم الثالث'),
                InternationalPhoneNumberInput(
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  textFieldController: ContactNum3,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    phone3 = number.phoneNumber.toString();
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },

                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  inputDecoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8)),
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  //  textFieldController: controller,
                  // formatInput: false,

                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: UnderlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
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
    //   temp = loadingPage();
    if (ContactNum2.text.isEmpty) phone2 = '';
    if (ContactNum3.text.isEmpty) phone3 = '';
    test.check().then((intenet) {
      if (intenet != null && intenet) {
        serverC.updateContactNumMony({'phone': phone1}, 3).then((value) {
          if (value)
            done();
          else
            retry();
        });
        serverC.updateContactNumMony({'phone': phone2}, 4).then((value) {
          if (value)
            done();
          else
            retry();
        });
        serverC.updateContactNumMony({'phone': phone3}, 5).then((value) {
          if (value)
            done();
          else
            retry();
        });
      } else {
        noInternet();
      }
    });
    setState(() {
      ContactNum1.clear();
      ContactNum2.clear();
      ContactNum3.clear();
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
