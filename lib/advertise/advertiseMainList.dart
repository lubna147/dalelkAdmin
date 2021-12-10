import 'package:dalelk/advertise/advertiseClass.dart';

import 'package:dalelk/advertise/normalAdvertise.dart';
//import 'package:dalelk/extraTools/contactNumberPage.dart';
import 'package:dalelk/extraTools/internetConnectionTest.dart';
import 'package:dalelk/extraTools/loadingPage.dart';

import 'package:dalelk/extraTools/mySharedPreferences.dart';

import 'package:dalelk/extraTools/noIternetConnection.dart';
import 'package:dalelk/extraTools/nothingToShow.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:dalelk/extraTools/serverConnection.dart';
import 'package:dalelk/extraTools/typesPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class adveriseMainList extends StatefulWidget {
  const adveriseMainList({Key? key}) : super(key: key);

  @override
  _adveriseMainListState createState() => _adveriseMainListState();
}

class _adveriseMainListState extends State<adveriseMainList> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("إلغاء"),
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      },
    );
    Widget continueButton = TextButton(
        child: Text("متابعة"),
        onPressed: () {
          setState(() {
            isLogIn = false;
            MySharedPreferences.instance.setBooleanValue("firstTime", false);
            MySharedPreferences.instance.setBooleanValue("logIn", false);
          });
          Navigator.of(context).pop();
        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "تنبيـه",
        textAlign: TextAlign.right,
      ),
      content: Text("هل تريد تسجيل الخروج ؟",
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

  bool tail = false;
  Widget tailWedget = Text('');
  getData() {
    pharmaces = '';
    advers.clear();
    test.check().then((intenet) {
      if (intenet != null && intenet) {
        thereIsNoInternet = false;
        if (advers.isEmpty) {
          serverC.getAllAdvertises().then((value) {
            if (value.isEmpty) {
              setState(() {
                temp = nothingToShow();
              });
            } else
              setState(() {
                fromHere = value.last.id;
                advers.addAll(value);
                temp = mainBody();
              });
          });
        }
      } else
        setState(() {
          temp = noInternetConnection();
          thereIsNoInternet = true;
        });
    });
  }

  ScrollController more = ScrollController();

  Future<void> refresh() async {
    advers.clear();
    serverC.getAllAdvertises().then((value) {
      if (value.isEmpty) {
        setState(() {
          temp = nothingToShow();
        });
      } else
        setState(() {
          advers.addAll(value);
          temp = mainBody();
        });
    });
  }

  int fromHere = 0;
  bool thereIsNoInternet = false;
  TextStyle menuItem = TextStyle(color: Colors.black54, fontSize: 15);
  late bool isLogIn = false;
  Widget temp = loadingPage();
  internetConnectionTest test = new internetConnectionTest();
  final globalKey = GlobalKey<ScaffoldState>();
  server serverC = new server();
  List<advertiseClass> advers = [];
  bool firstLogIn = false;
  String pharmaces = '';
  @override
  void initState() {
    temp = loadingPage();
    advers.clear();
    pharmaces = '';
    getData();
    super.initState();
    MySharedPreferences.instance
        .getBooleanValue("logIn")
        .then((value) => setState(() {
              isLogIn = value;
              print(value);
            }));
    super.initState();
    MySharedPreferences.instance
        .getBooleanValue("firstTime")
        .then((value) => setState(() {
              firstLogIn = value;
              print(value);
            }));

    more.addListener(() {
      if (more.position.pixels == more.position.maxScrollExtent) {
        moreData();
        print('im in taaaaaaaaaaaaaaiiiiiiiiiiiiiiiilllllllllll');
      } else {
        setState(() {
          tail = false;
        });
      }
    });
  }

  moreData() {
    test.check().then((intenet) {
      if (intenet != null && intenet) {
        thereIsNoInternet = false;

        serverC.getMoreAdvertise(fromHere).then((value) {
          if (value.isEmpty) {
            setState(() {
              tail = true;
              tailWedget = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MaterialCommunityIcons.cloud_off_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    'لا يوجد مزيد من الاعلانات',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              );
            });
          } else
            setState(() {
              fromHere = value.last.id;
              advers.addAll(value);
              temp = mainBody();
            });
        });
      } else
        setState(() {
          tail = true;
          tailWedget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MaterialCommunityIcons.wifi_off,
                color: Colors.white,
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                'تحقق من الاتصال بالانترنت',
                style: TextStyle(color: Colors.white),
              )
            ],
          );
          thereIsNoInternet = true;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (thereIsNoInternet) getData();
    return mainPage(context);
  }

  Scaffold mainPage(BuildContext context) {
    return Scaffold(
      key: globalKey,
      //  drawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'الإعلانــات',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: temp,
    );
  }

  Padding mainBody() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                refresh();
              },
              child: StaggeredGridView.countBuilder(
                controller: more,
                shrinkWrap: true,
                crossAxisCount: 1,
                itemCount: advers.length,
                itemBuilder: (BuildContext context, int index) =>
                    normalAdvertise(
                  advers[index],
                  onDelete: () => removeItem(index),
                ),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
            ),
          ),
          Visibility(
              visible: tail,
              child: Container(
                height: 50,
                color: Colors.grey[200],
                child: tailWedget,
              ))
        ],
      ),
    );
  }

  void removeItem(int index) {
    setState(() {
      temp = loadingPage();
    });
    print(advers.length);
    advers.clear();
    serverC.getAllAdvertises().then((value) {
      if (value.isNotEmpty) {
        setState(() {
          advers.addAll(value);
          temp = mainBody();
        });
      } else
        setState(() {
          temp = nothingToShow();
        });
    });
  }
}
