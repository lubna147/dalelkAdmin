import 'package:dalelk/advertise/advertiseMainList.dart';
import 'package:dalelk/extraTools/updateConNums.dart';
import 'package:dalelk/extraTools/updatePharmases.dart';
import 'package:dalelk/jobs/jobList.dart';
import 'package:dalelk/medical/medicalItemList.dart';
import 'package:dalelk/medical/medicalItemTypeList.dart';
import 'package:dalelk/monyFolder/mony.dart';
import 'package:dalelk/users/userList.dart';
import 'package:flutter/material.dart';

class sittingsList extends StatelessWidget {
  const sittingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 16,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => userList()));
              },
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffc5cec3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Container(
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Text(
                      'المسـتخدمين',
                      style: TextStyle(
                          color: Color(0xffc5cec3),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => adveriseMainList()));
              },
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffc5cec3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Container(
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Text(
                      'الإعلانـات',
                      style: TextStyle(
                          color: Color(0xffc5cec3),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => mony()));
              },
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffc5cec3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Container(
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Text(
                      'العمــلات',
                      style: TextStyle(
                          color: Color(0xffc5cec3),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => updatePharmases()));
              },
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffc5cec3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Container(
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Text(
                      'الصيدليـات',
                      style: TextStyle(
                          color: Color(0xffc5cec3),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => updateConNums()));
              },
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffc5cec3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Container(
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Text(
                      'أرقـام التواصـل',
                      style: TextStyle(
                          color: Color(0xffc5cec3),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => medicalItemTypeList()));
              },
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffc5cec3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Container(
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Text(
                      'الأقسام الطبية',
                      style: TextStyle(
                          color: Color(0xffc5cec3),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => jobList()));
              },
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffc5cec3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Container(
                      /*  margin: EdgeInsets.only(
                      top: 8,
                    ),*/
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          border:
                              Border.all(color: Color(0xffc5cec3), width: 1)),
                    ),
                    Text(
                      'فرص العمل',
                      style: TextStyle(
                          color: Color(0xffc5cec3),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
