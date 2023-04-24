
import 'package:flutter/foundation.dart';

class MyAppState extends ChangeNotifier
{
  String _customerAction = "";
  String username = "";

  String getCustomerAction() => _customerAction;

  customerAdded()
  {
    _customerAction = "ADDED";
    notifyListeners();
  }

  customerDeleted()
  {
    _customerAction = "DELETED";
    notifyListeners();
  }

  clearCustomerAction()
  {
    _customerAction = "";
  }

  loggedOut()
  {
    username = "";
  }

  loggedIn(String user)
  {
    username =  user;
  }

}