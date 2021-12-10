import 'dart:io';

import 'package:dalelk/extraTools/internetConnectionTest.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:dalelk/medical/medicalTypesClass.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:file_picker/file_picker.dart';

class addMedical extends StatefulWidget {
  const addMedical({Key? key}) : super(key: key);

  @override
  _addMedicalState createState() => _addMedicalState();
}

class _addMedicalState extends State<addMedical> {
  PhoneNumber number = PhoneNumber(isoCode: 'TR');
  TextEditingController name = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController place = new TextEditingController();
  // TextEditingController passWord = new TextEditingController();
  String phone = '';
  internetConnectionTest test = new internetConnectionTest();
  final _formKey = new GlobalKey<FormState>();
  server serverC = new server();
  List<String> types = ['عيادة', 'مشفى', 'صيدلية', 'ممرض', 'مركز صحي'];
  List<medicalTypesClass> DoctorTypes = [];
  List<String> DTList = [];
  String typesValue = 'عيادة';
  String doctorTypeValue = 'أطفال';
  bool fileVis = false;
  bool isHospital = true;
  bool isDoctor = true;
  int doctype = 0;
  String fileName = '';
  File fileMain = File('test');
  uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        fileVis = true;
        fileName = file.name;
        fileMain = File(file.path);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test.check().then((intenet) {
      if (intenet != null && intenet) {
        if (DoctorTypes.isEmpty) {
          serverC.getDoctorTypes().then((value) {
            setState(() {
              DoctorTypes.addAll(value);
              DoctorTypes.removeAt(0);
              DoctorTypes.forEach((element) {
                DTList.add(element.title);
              });
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'إضافة عنصر طبي',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        selectedItemBuilder: (BuildContext context) {
                          return types.map<Widget>((String item) {
                            return Container(
                                width: 200,
                                child:
                                    Text(item, style: TextStyle(fontSize: 12)));
                          }).toList();
                        },
                        validator: (String? value) {
                          (value?.isEmpty ?? true) ? 'الرجاء اختيار صنف' : null;
                        },
                        //     hint: Text('التصنيفات'),
                        value: typesValue,
                        //   itemHeight: 20,
                        items: types.map((String value) {
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
                            typesValue = value.toString();
                            if (value.toString() == 'مشفى' ||
                                value.toString() == 'عيادة')
                              setState(() {
                                isHospital = true;
                              });
                            else
                              setState(() {
                                isHospital = false;
                              });
                            if (value.toString() != 'عيادة')
                              setState(() {
                                isDoctor = false;
                              });
                            else
                              setState(() {
                                isDoctor = true;
                              });
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: isDoctor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          selectedItemBuilder: (BuildContext context) {
                            return DTList.map<Widget>((String item) {
                              return Container(
                                  width: 200,
                                  child: Text(item,
                                      style: TextStyle(fontSize: 12)));
                            }).toList();
                          },
                          validator: (String? value) {
                            (value?.isEmpty ?? true)
                                ? 'الرجاء اختيار صنف'
                                : null;
                          },
                          //     hint: Text('التصنيفات'),
                          value: doctorTypeValue,
                          //   itemHeight: 20,
                          items: DTList.map((String value) {
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
                              doctorTypeValue = value.toString();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(':الاسم'),
                TextFormField(
                  controller: name,
                  maxLines: 3,
                  minLines: 1,
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(':رقم التواصل'),
                InternationalPhoneNumberInput(
                  textFieldController: phoneNumber,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    phone = number.phoneNumber.toString();
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
                Text(':الموقع'),
                TextFormField(
                  controller: place,
                  maxLines: 2,
                  validator: (value) =>
                      (value == '') ? 'الرجاء ملئ الحقل' : null,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                ),
                Visibility(
                    visible: isHospital,
                    child: SizedBox(
                      height: 24,
                    )),
                Visibility(
                    visible: isHospital,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              uploadFile();
                            },
                            child: Icon(Icons.file_download),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffc5cec3)),
                                //       shape: MaterialStateProperty.all(OutlinedBorder(side: )))) ,
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(8)),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                    fontSize: 12, color: Colors.white))),
                          ),
                        ),
                        Text(': تحميل ملف المناوبات')
                      ]),
                    )),
                Visibility(
                    visible: fileVis,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(children: [
                        Expanded(child: Text(fileName)),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.close_sharp),
                        )
                      ]),
                    )),
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
                            addData();
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

  addData() {
    if (typesValue != 'عيادة')
      doctype = 0;
    else
      doctype = DoctorTypes.firstWhere((element) {
        if (element.title == doctorTypeValue)
          return true;
        else
          return false;
      }).id;
    if (phoneNumber.text.isEmpty) phone = '';
    serverC.addMedical(<String, String>{
      "medtypes_id": types.indexOf(typesValue).toString(),
      "doctype_id": doctype.toString(),
      "name": name.text,
      "phone_num": phone,
      "adress": place.text
    }, fileMain.path).then((value) {
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

    setState(() {
      name.clear();
      phoneNumber.clear();
      place.clear();
      typesValue = 'عيادة';
      doctorTypeValue = 'أطفال';
      phone = '';
    });
    /*   if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }*/
  }

  @override
  void dispose() {
    name.clear();
    phoneNumber.clear();
    place.clear();
    typesValue = 'عيادة';
    doctorTypeValue = 'أطفال';
    phone = '';
    super.dispose();
  }
}
