import 'dart:io';

import 'package:dalelk/extraTools/internetConnectionTest.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class changeNums extends StatefulWidget {
  changeNums({Key? key}) : super(key: key);

  @override
  _changeNumsState createState() => _changeNumsState();
}

class _changeNumsState extends State<changeNums> {
  TextEditingController ContactNum1 = new TextEditingController();

  TextEditingController ContactNum2 = new TextEditingController();

  TextEditingController ContactNum3 = new TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'TR');

  final _formKey = new GlobalKey<FormState>();

  String phone1 = '';

  String phone2 = '';

  String phone3 = '';

  internetConnectionTest test = new internetConnectionTest();

  server serverC = new server();

  final ImagePicker _picker = ImagePicker();

  File _image = File('file.txt');

  bool imageBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'أرقام تواصل الحوالات',
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
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'استعلام',
                  style: TextStyle(fontSize: 15),
                ),
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
                  height: 24,
                ),
                Text(
                  ':ارسال حوالة',
                  style: TextStyle(fontSize: 15),
                ),
                InternationalPhoneNumberInput(
                  textFieldController: ContactNum2,
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
                  height: 24,
                ),
                Text(
                  ':استقبال حوالة',
                  style: TextStyle(fontSize: 15),
                ),
                InternationalPhoneNumberInput(
                  textFieldController: ContactNum3,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    phone3 = number.phoneNumber.toString();
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
                SizedBox(
                  height: 30,
                ),
                changeImage()
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
        serverC.updateContactNumMony({'phone': phone1}, 6).then((value) {
          if (value)
            done();
          else
            retry();
        });
        serverC.updateContactNumMony({'phone': phone2}, 7).then((value) {
          if (value)
            done();
          else
            retry();
        });
        serverC.updateContactNumMony({'phone': phone3}, 8).then((value) {
          if (value)
            done();
          else
            retry();
        });
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

  Widget changeImage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
            child: Text('تغيير صورة الغلاف'),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _imgFromCamera();
                  },
                  child: Icon(Icons.add_a_photo, color: Color(0xffc5cec3)),
                  style: OutlinedButton.styleFrom(primary: Color(0xffc5cec3)),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      _imgFromGallery();
                    },
                    child: Icon(
                      Icons.add_photo_alternate,
                      color: Color(0xffc5cec3),
                    ),
                    style:
                        OutlinedButton.styleFrom(primary: Color(0xffc5cec3))),
              )
            ],
          ),
        ),
        Visibility(
          visible: imageBox,
          child: Container(
            child: Stack(alignment: Alignment.topLeft, children: [
              _image == null
                  ? Text('data')
                  : Image.file(
                      _image,
                      fit: BoxFit.contain,
                    ),
              Container(
                margin: EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      //   _image = new File(path);
                      imageBox = false;
                    });
                  },
                  icon: Icon(
                    Icons.close_sharp,
                    color: Colors.black87,
                    size: 30,
                  ),
                  // splashColor: Colors.amber,
                ),
              )
            ]),
          ),
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
                    padding: MaterialStateProperty.all(EdgeInsets.all(8)),
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
                  //    final FormState? form = _formKey.currentState;
                  updateImage();
                },
                child: Text('موافق'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffc5cec3)),
                    //       shape: MaterialStateProperty.all(OutlinedBorder(side: )))) ,
                    padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 12, color: Colors.white))),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _imgFromCamera() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      _image = File(image!.path);
      print(_image);
      if (_image != null) {
        imageBox = true;
      }
    });
  }

  _imgFromGallery() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = File(image!.path);
      if (_image != null) {
        imageBox = true;
      }
    });
  }

  updateImage() {
    if (_image.path != 'file.txt') {
      test.check().then((intenet) {
        if (intenet != null && intenet) {
          serverC.updateImage(_image.path).then((value) {
            if (value) {
              done();
              setState(() {
                imageBox = false;
                _image = File('file.txt');
              });
            } else
              retry();
          });
        } else {
          noInternet();
        }
      });
    } else {
      Fluttertoast.showToast(
          msg: "!الرجاء اختيار صورة",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 13);
    }
  }
}
