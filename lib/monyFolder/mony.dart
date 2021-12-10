import 'package:dalelk/monyFolder/changeMony.dart';
import 'package:dalelk/monyFolder/changeNums.dart';
import 'package:flutter/material.dart';

class mony extends StatelessWidget {
  mony();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'الــعمـلات',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => changeMony()));
                  },
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0xffc5cec3),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              border: Border.all(
                                  color: Color(0xffc5cec3), width: 1)),
                        ),
                        Container(
                          /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40)),
                              border: Border.all(
                                  color: Color(0xffc5cec3), width: 1)),
                        ),
                        Text(
                          'تعديل أسعار الصرف',
                          style: TextStyle(color: Color(0xffc5cec3)),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => changeNums()));
                  },
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0xffc5cec3),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              border: Border.all(
                                  color: Color(0xffc5cec3), width: 1)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40)),
                              border: Border.all(
                                  color: Color(0xffc5cec3), width: 1)),
                        ),
                        Text(
                          'تعديل أرقام التواصل و صورة الغلاف',
                          style: TextStyle(color: Color(0xffc5cec3)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
