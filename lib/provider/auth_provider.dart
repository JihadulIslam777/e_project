import 'package:e_project/route_pages/app_page.dart';
import 'package:e_project/services/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  bool isRequesting = false;

  void requesting() {
    isRequesting = !isRequesting;
    notifyListeners();
  }

  void getSignUp(String name, String password, String email) async {
    requesting();
    await FireBaseAuthentication.signUp(name, email, password)
        .then((authResponseModel) {
      if (authResponseModel.isSuccess == true) {
        requesting();
      }
    }).onError((error, stackTrace) {
      requesting();
    });
  }

  void getLogIn(String email, String password, BuildContext context) async {
    requesting();
    await FireBaseAuthentication.logIn(email, password).then((authResponse) {
      if (authResponse.isSuccess) {
        requesting();
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      } else {
        requesting();
        print(authResponse.message);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
