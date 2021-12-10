import 'dart:convert';

import 'package:dalelk/advertise/advertiseClass.dart';
import 'package:dalelk/extraTools/pharmacesClass.dart';
import 'package:dalelk/extraTools/updatePharmases.dart';
import 'package:dalelk/jobs/jobClass.dart';
import 'package:dalelk/medical/addMedical.dart';
import 'package:dalelk/medical/medicalItemClass.dart';
import 'package:dalelk/medical/medicalTypesClass.dart';
//import 'package:dalelk/mony/monyClass.dart';
import 'package:dalelk/users/userClass.dart';
import 'package:http/http.dart' as http;

class server {
  String url = 'https://dalelalbab.xyz/api';
  late String subUrl;
  late List temp;
  List<advertiseClass> list = [];
  List<medicalTypesClass> medTypeList = [];
  List<medicalItemClass> medList = [];
  Map<String, String> headers = {"Content-type": "application/json"};
  Map<String, String> headersFile = {
    "Content-type": "multipart/form-data",
    "Accept": "application/json"
  };
  addNewAdvertise(Map<String, String> body, filename) async {
    subUrl = url + '/store';
    print(body);
    print(filename);
    var request = http.MultipartRequest('POST', Uri.parse(subUrl));
    request.fields.addAll(body);

    request.headers.addAll(headersFile);
    request.files
        .add(await http.MultipartFile.fromPath('image_path', filename));
    var res = await request.send();
    print(res.statusCode);
    print(res.reasonPhrase);
    print(res.request);
    res.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  updateAdvertise(Map<String, String> body, filename, int id) async {
    subUrl = url + '/updateAdvertise/$id?_method=PUT';
    //  print(body);
    print(filename);
    print("editAd");
    print('eeeeeeeeeeeeddddddddddddddddddddiiiiiiiiiiiiiiitttttttttttteeeeee');
    var request = http.MultipartRequest('Post', Uri.parse(subUrl));
    request.fields.addAll(body);

    request.headers.addAll(headersFile);
    request.files
        .add(await http.MultipartFile.fromPath('image_path', filename));
    var res = await request.send();
    //   print(res.statusCode);
    //   print(res.reasonPhrase);
    print(res.request);
    res.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  Future<List<advertiseClass>> getAllAdvertises() async {
    list.clear();
    subUrl = url + '/getLastAdvertises';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    print(temp);
    temp.forEach((element) {
      list.add(new advertiseClass(
          element['id'],
          element['name'],
          element['title'],
          element['palce'],
          element['contact_num'],
          element['price'],
          element['image_path'],
          element['description']));
    });
    return list;
  }

  Future<List<advertiseClass>> getMoreAdvertise(int id) async {
    list.clear();
    subUrl = url + '/getLastBId/$id';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    print(temp);
    temp.forEach((element) {
      list.add(new advertiseClass(
          element['id'],
          element['name'],
          element['title'],
          element['palce'],
          element['contact_num'],
          element['price'],
          element['image_path'],
          element['description']));
    });
    return list;
  }

  Future<List<advertiseClass>> getAdvertisebyType(int type) async {
    list.clear();
    subUrl = url + '/getSpicificByClass/$type';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    print(temp);
    temp.forEach((element) {
      list.add(new advertiseClass(
          element['id'],
          element['name'],
          element['title'],
          element['palce'],
          element['contact_num'],
          element['price'],
          element['image_path'],
          element['description']));
    });
    return list;
  }

  Future<List<advertiseClass>> getfavouraiteAdvertise(List<int> fav) async {
    list.clear();
    print(fav);
    fav.insert(0, 0);
    print(fav);

    subUrl = url + '/getFavouraite/$fav';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    print('teeeeeeeeeeeeeeeeeeemmmmmmmmmmmmmmmmmmmmmmmmppppppppppppppppppp');
    print(temp);
    temp.forEach((element) {
      list.add(new advertiseClass(
          element['id'],
          element['name'],
          element['title'],
          element['palce'],
          element['contact_num'],
          element['price'],
          element['image_path'],
          element['description']));
    });
    return list;
  }

  Future<List<advertiseClass>> getAdvertisebyTypeSearch(
      int type, String search) async {
    list.clear();
    subUrl = url + '/getByClassSearch/$type/$search';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    print(temp);
    temp.forEach((element) {
      list.add(new advertiseClass(
          element['id'],
          element['name'],
          element['title'],
          element['palce'],
          element['contact_num'],
          element['price'],
          element['image_path'],
          element['description']));
    });
    return list;
  }

  Future<List<advertiseClass>> getAdvertisebyUserSearch(
      int id, String search) async {
    list.clear();
    subUrl = url + '/getByUserSearch/$id/$search';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    print(temp);
    temp.forEach((element) {
      list.add(new advertiseClass(
          element['id'],
          element['name'],
          element['title'],
          element['palce'],
          element['contact_num'],
          element['price'],
          element['image_path'],
          element['description']));
    });
    return list;
  }

  Future<List<advertiseClass>> getAdvertisebyUser(int id) async {
    list.clear();
    subUrl = url + '/getSpicificByUser/$id';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    print(temp);
    temp.forEach((element) {
      list.add(new advertiseClass(
          element['id'],
          element['name'],
          element['title'],
          element['palce'],
          element['contact_num'],
          element['price'],
          element['image_path'],
          element['description']));
    });
    return list;
  }

  Future<bool> deletAdvertise(int id) async {
    subUrl = url + '/delete/$id';
    final response = await http.delete(Uri.parse(subUrl));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.request);

      return true;
    } else
      return false;
  }

  Future<List<medicalTypesClass>> getDoctorTypes() async {
    subUrl = url + '/getDoctorTypes';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      medTypeList.add(new medicalTypesClass(element['id'], element['name']));
    });

    return medTypeList;
  }

  Future<List<medicalItemClass>> getMedicalsByType(int type) async {
    List<medicalItemClass> medList = [];
    subUrl = url + '/getMedByType/$type';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      medList.add(new medicalItemClass(element['id'], element['name'],
          element['adress'], element['phone_num'], element['file']));
    });
    print(medList);
    return medList;
  }

  Future<List<medicalItemClass>> getMedicalsBySpectial(int type) async {
    List<medicalItemClass> medList = [];
    subUrl = url + '/getMedBySpectial/$type';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      medList.add(new medicalItemClass(element['id'], element['name'],
          element['adress'], element['phone_num'], element['file']));
    });
    print(medList);
    return medList;
  }

  Future<List<medicalItemClass>> getMedByTypeSearch(
      int type, String search) async {
    List<medicalItemClass> medList = [];
    subUrl = url + '/getMedByTypeSearch/$type/$search';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      medList.add(new medicalItemClass(element['id'], element['name'],
          element['adress'], element['phone_num'], element['file']));
    });
    print(medList);
    return medList;
  }

  Future<List<medicalItemClass>> getMedBySpectialSearch(
      int type, String search) async {
    List<medicalItemClass> medList = [];
    subUrl = url + '/getMedBySpectialSearch/$type/$search';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      medList.add(new medicalItemClass(element['id'], element['name'],
          element['adress'], element['phone_num'], element['file']));
    });
    print(medList);
    return medList;
  }

  Future<bool> deletMedical(int id) async {
    subUrl = url + '/destroyMed/$id';
    final response = await http.delete(Uri.parse(subUrl));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.request);

      return true;
    } else {
      print(response.statusCode);
      print(response.request);
      print(response.body);
      return false;
    }
  }

  Future<bool> addMedical(Map<String, String> bodyNew, filename) async {
    subUrl = url + '/storeMed';
    print(bodyNew);
    print(filename);
    var res;
    if (filename == 'test') {
      print('i m in if');
      res = await http.post(Uri.parse(subUrl),
          headers: headers, body: jsonEncode(bodyNew));
    } else {
      print('i m in else');
      var request = http.MultipartRequest('POST', Uri.parse(subUrl));
      request.fields.addAll(bodyNew);
      request.headers.addAll(headersFile);
      request.files.add(await http.MultipartFile.fromPath('file', filename));
      res = await request.send();
    }
    print(res.statusCode);
    print(res.reasonPhrase);
    print(res.request);
    res.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    if (res.statusCode == 200 || res.statusCode == 201)
      return true;
    else
      return false;
  }

  Future<List<pharmacesClass>> getPharmaces() async {
    List<pharmacesClass> list = [];
    String pharmaces = '';
    subUrl = url + '/getPharmaces';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    print(temp);
    temp.forEach((element) {
      if (element['name'] == null)
        ;
      else
        list.add(new pharmacesClass(element['name'], element['palce']));
    });
    print('pharmacessssssssssssssssssssssssssssssssssssssssssssssssss');
    print(list);
    return list;
  }

  Future<bool> updatePharmases(Map<String, String> bodyNew, int id) async {
    subUrl = url + '/updatepharmacy/$id';
    final response = await http.put(Uri.parse(subUrl),
        headers: headers, body: jsonEncode(bodyNew));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('doooooooonnnnnnnnnnnnnneeeeeeeeeee');
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      print('nnnnooooooooooot');
      return false;
    }
  }

  /* getMony() async {
    List<monyClas> mony = [];

    mony.clear();
    int i = 0;
    subUrl = url + '/getMony';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      mony.add(new monyClass(
          element['sale'], element['buy'], int.parse(element['state'])));
    });
    print('here sub function');
    print(mony);
    return mony;
  }
*/
  Future<bool> updateMony(Map<String, String> bodyNew, int id) async {
    subUrl = url + '/updateMony/$id';
    final response = await http.put(Uri.parse(subUrl),
        headers: headers, body: jsonEncode(bodyNew));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('doooooooonnnnnnnnnnnnnneeeeeeeeeee');
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      print('nnnnooooooooooot');
      return false;
    }
  }

  Future<bool> postjob(Map<String, String> bodyNew) async {
    subUrl = url + '/storeJob';
    final response = await http.post(Uri.parse(subUrl),
        headers: headers, body: jsonEncode(bodyNew));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('doooooooonnnnnnnnnnnnnneeeeeeeeeee');
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      print('nnnnooooooooooot');
      return false;
    }
  }

  Future<List<jobClass>> getJobs() async {
    List<jobClass> jobs = [];
    subUrl = url + '/getjobs';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      jobs.add(new jobClass(
          element['id'],
          element['advertiser'],
          element['title'],
          element['place'],
          element['phone'],
          element['det']));
    });
    return jobs;
  }

  Future<bool> deletJob(int id) async {
    subUrl = url + '/deletJob/$id';
    final response = await http.delete(Uri.parse(subUrl));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.request);

      return true;
    } else
      return false;
  }

  Future<List<jobClass>> getJobsSearch(String job) async {
    List<jobClass> jobs = [];
    subUrl = url + '/getJobSearch/$job';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      jobs.add(new jobClass(
          element['id'],
          element['advertiser'],
          element['title'],
          element['place'],
          element['phone'],
          element['det']));
    });
    return jobs;
  }

  getContactNum() async {
    List<String> nums = [];
    subUrl = url + '/getContactNum';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      nums.add(element['phone']);
    });
    return nums;
  }

  updateContactNumMony(Map<String, String> bodyNew, int id) async {
    subUrl = url + '/updateContactNum/$id';
    final response = await http.put(Uri.parse(subUrl),
        headers: headers, body: jsonEncode(bodyNew));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('doooooooonnnnnnnnnnnnnneeeeeeeeeee');
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      print('nnnnooooooooooot');
      return false;
    }
  }

  getContactNumMony() async {
    List<String> nums = [];
    subUrl = url + '/getContactNumMony';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      nums.add(element['phone']);
    });
    return nums;
  }

  Future<bool> updateImage(String filename) async {
    subUrl = url + '/updateImage/1?_method=PUT';
    //  print(body);
    print(filename);
    print("editAd");
    print('eeeeeeeeeeeeddddddddddddddddddddiiiiiiiiiiiiiiitttttttttttteeeeee');
    var request = http.MultipartRequest('Post', Uri.parse(subUrl));
    request.headers.addAll(headersFile);
    request.files.add(await http.MultipartFile.fromPath('name', filename));
    var res = await request.send();
    //   print(res.statusCode);
    //   print(res.reasonPhrase);
    print(res.request);
    res.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    if (res.statusCode == 200 || res.statusCode == 201) return true;
    return false;
  }

  getImage() async {
    String img = '';
    subUrl = url + '/getImage';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    img = temp[0]['name'];
    return img;
  }

  Future<List<userClass>> getusers() async {
    List<userClass> users = [];
    subUrl = url + '/getUsers';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      users.add(new userClass(
          element['id'],
          element['user'],
          element['user_name'],
          element['password'],
          element['phone_num'],
          element['shopeName'],
          element['shopeNumber'],
          element['shopLocation']));
    });
    return users;
  }

  Future<List<userClass>> getuserSearch(String user) async {
    List<userClass> users = [];
    subUrl = url + '/getUserSearch/$user';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    temp.forEach((element) {
      users.add(new userClass(
          element['id'],
          element['user'],
          element['user_name'],
          element['password'],
          element['phone_num'],
          element['shopeName'],
          element['shopeNumber'],
          element['shopLocation']));
    });
    return users;
  }

  Future<bool> addNewUser(Map<String, String> bodyNew) async {
    subUrl = url + '/storeUser';
    final response = await http.post(Uri.parse(subUrl),
        headers: headers, body: jsonEncode(bodyNew));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('doooooooonnnnnnnnnnnnnneeeeeeeeeee');
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      print('nnnnooooooooooot');
      return false;
    }
  }

  Future<bool> updateUser(Map<String, String> bodyNew, int id) async {
    subUrl = url + '/updateUser/$id';
    final response = await http.put(Uri.parse(subUrl),
        headers: headers, body: jsonEncode(bodyNew));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('doooooooonnnnnnnnnnnnnneeeeeeeeeee');
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      print('nnnnooooooooooot');
      return false;
    }
  }

  Future<bool> deletUser(int id) async {
    subUrl = url + '/deletUser/$id';
    print('user id');
    print(id);
    final response = await http.delete(Uri.parse(subUrl));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.request);

      return true;
    } else {
      print(response.request);
      return false;
    }
  }

  Future<int> getUserId(String userName, String passWord) async {
    int id = 0;
    subUrl = url + '/findUser/$userName/$passWord';
    final response = await http.get(Uri.parse(subUrl));
    var responseData = json.decode(response.body);
    print(response.body);
    temp = responseData['data'];
    if (temp.isEmpty)
      id == 0;
    else
      id = temp[0]['id'];
    return id;
  }
}
