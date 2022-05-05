import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_test/main.dart';
import 'package:sky_test/src/models/repository_model.dart';
import 'package:sky_test/src/models/user_model.dart';
import 'package:sky_test/src/services/api_service.dart';
import 'package:sky_test/src/utilities/api_constants.dart';
import 'package:sky_test/src/utilities/enums.dart';
import 'package:sky_test/src/view/user_screen/user_details_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchProvider extends ChangeNotifier {
  ProviderStatus searchStatus = ProviderStatus.IDLE;
  CurrentTab currentTab = CurrentTab.PROFILE;

  UserModel? _user;
  UserModel? get user => _user;
  List<Repository> _repository = [];
  List<Repository> get repository => _repository;

  launchURL(urL) async {
    var url = urL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void changeCurrentTab(CurrentTab newTab) {
    currentTab = newTab;
    notifyListeners();
  }

  Future<bool> getUserData(String userName) async {
    bool loaded = true;
    searchStatus = ProviderStatus.LOADING;
    notifyListeners();
    _repository.clear();
    try {
      var userResponse = await ApiService.getApiData(
          url: ApiConstants.getUserApi(userName));
      _user = UserModel.fromJson(userResponse.data);
      var repoResponse = await ApiService.getApiData(
          url: ApiConstants.getRepoApi(userName));
      repoResponse.data.forEach((data) {
        _repository.add(Repository.fromJson(data));
      });
      searchStatus = ProviderStatus.LOADED;
      notifyListeners();
    } catch (e) {
      loaded = false;
      debugPrint("$e");
      searchStatus = ProviderStatus.ERROR;
      notifyListeners();
    }
    return loaded;
  }
}
