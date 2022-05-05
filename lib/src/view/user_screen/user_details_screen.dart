import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_test/src/utilities/enums.dart';
import 'package:sky_test/src/view/user_screen/widgets/repo_deatail.dart';
import 'package:sky_test/src/view/user_screen/widgets/tab_buttons.dart';
import 'package:sky_test/src/view/user_screen/widgets/user_profile.dart';
import 'package:sky_test/src/view_model/search_user_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        centerTitle: true,
        title: CustomSwitch(),
      ),
      body: Consumer<SearchProvider>(
        builder: (context, provider, child) {
          return  provider.currentTab == CurrentTab.REPOSITORY ? UserPofileWidget() :RepoDetailWidget();
        }
      ),
    );
  }
}
