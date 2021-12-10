import 'package:dalelk/extraTools/mySharedPreferences.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:dalelk/users/userClass.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class addNewUser extends StatefulWidget {
  userClass temp;
  addNewUser(this.temp);

  @override
  _addNewUserState createState() => _addNewUserState();
}

class _addNewUserState extends State<addNewUser> {
  @override
  void dispose() {
    name.text = '';
    phone = '';
    phoneNumber.text = '';
    userName.text = '';
    passWord.text = '';
    phone2 = '';
    shopName.clear();
    shopLocation.clear();
    shopNum.clear();
    super.dispose();
  }

  String appBarTitle = '';
  @override
  void initState() {
    if (widget.temp.name == '')
      appBarTitle = 'إضافة مستخدم';
    else {
      appBarTitle = 'تعديل مستخدم';
      name.text = widget.temp.name;
      //  phone = widget.temp.phoneNumber;

      //    phoneNumber.text = widget.temp.phoneNumber;
      userName.text = widget.temp.userName;

      passWord.text = widget.temp.passWord;
    }
    super.initState();
  }

  PhoneNumber number = PhoneNumber(isoCode: 'TR');
  TextEditingController name = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController userName = new TextEditingController();
  TextEditingController passWord = new TextEditingController();
  TextEditingController shopName = new TextEditingController();
  TextEditingController shopNum = new TextEditingController();
  TextEditingController shopLocation = new TextEditingController();
  String phone = '';
  String phone2 = '';
  final _formKey = new GlobalKey<FormState>();
  server serv = new server();
// PhoneNumber number = PhoneNumber(isoCode: 'TR');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            appBarTitle,
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(':الاسم'),
                TextFormField(
                  maxLines: 1,
                  controller: name,
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
                Text(' : رقم التواصل'),
                InternationalPhoneNumberInput(
                  textFieldController: phoneNumber,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    setState(() {
                      phone = number.phoneNumber.toString();
                    });
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
                      hintText: '5386883397',
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8)),
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
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
                Text(':اسم المستخدم'),
                TextFormField(
                  maxLines: 1,
                  controller: userName,
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      //   hintText: 'مدينة الباب - جانب مشفى الباب',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(':كلمة المرور'),
                TextFormField(
                  maxLines: 1,
                  controller: passWord,
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      //   hintText: 'مدينة الباب - جانب مشفى الباب',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('اسم الجهة المعلنة'),
                TextFormField(
                  maxLines: 1,
                  controller: shopName,
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      //   hintText: 'مدينة الباب - جانب مشفى الباب',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'رقم التواصل',
                  style: TextStyle(fontSize: 15),
                ),
                InternationalPhoneNumberInput(
                  textFieldController: shopNum,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    phone2 = number.phoneNumber.toString();
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
                Text('الموقع'),
                TextFormField(
                  maxLines: 1,
                  controller: shopLocation,
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      //   hintText: 'مدينة الباب - جانب مشفى الباب',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      )),
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
                            adduser();
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
              ]),
            ),
          ),
        ));
  }

  adduser() {
    if (widget.temp.name == '') {
      serv.addNewUser(<String, String>{
        "user": name.text,
        "phone_num": phone,
        "user_name": userName.text,
        "password": passWord.text,
        "shopeName": shopName.text,
        "shopeNumber": phone2,
        "shopLocation": shopLocation.text
      }).then((value) {
        if (value) {
          Fluttertoast.showToast(
              msg: "تم حفظ المعلومات بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 13);
          Navigator.pop(context);
          setState(() {});
        } else {
          Fluttertoast.showToast(
              msg: "لم يتم حفظ المعلومات . الرجاء المحاولة لاحقاً",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 13);
        }
      });
    } else {
      serv.updateUser(<String, String>{
        "user": name.text,
        "phone_num": phone,
        "user_name": userName.text,
        "password": passWord.text,
        "shopeName": shopName.text,
        "shopeNumber": phone2,
        "shopLocation": shopLocation.text
      }, widget.temp.id).then((value) {
        if (value) {
          Fluttertoast.showToast(
              msg: "تم حفظ المعلومات بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 13);
          Navigator.pop(context);
          setState(() {});
        } else {
          Fluttertoast.showToast(
              msg: "لم يتم حفظ المعلومات . الرجاء المحاولة لاحقاً",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 13);
        }
      });
    }

    setState(() {
      name.text = '';
      phone = '';
      phoneNumber.text = '';
      userName.text = '';
      passWord.text = '';
      phone2 = '';
      shopName.clear();
      shopLocation.clear();
      shopNum.clear();
    });
  }
}
