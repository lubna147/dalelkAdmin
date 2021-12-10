class userClass {
  userClass(this._id, this._name, this._userName, this._passWord,
      this._phoneNumber, this._shopName, this._shopPhone, this._shopLocation);
  int _id = 0;

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  String _name = '';

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String _userName = '';

  String get userName => _userName;

  set userName(String userName) {
    _userName = userName;
  }

  String _passWord = '';

  String get passWord => _passWord;

  set passWord(String passWord) {
    _passWord = passWord;
  }

  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  String _shopName = '';

  String get shopName => _shopName;

  set shopName(String shopName) {
    _shopName = shopName;
  }

  String _shopPhone = '';

  String get shopPhone => _shopPhone;

  set shopPhone(String shopPhone) {
    _shopPhone = shopPhone;
  }

  String _shopLocation = '';

  String get shopLocation => _shopLocation;

  set shopLocation(String shopLocation) {
    _shopLocation = shopLocation;
  }
}
