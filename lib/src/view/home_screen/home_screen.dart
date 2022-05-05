import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_test/main.dart';
import 'package:sky_test/src/utilities/enums.dart';
import 'package:sky_test/src/view/home_screen/widgets/loader.dart';
import 'package:sky_test/src/view/home_screen/widgets/network_error_screen.dart';
import 'package:sky_test/src/view/home_screen/widgets/search_field.dart';
import 'package:sky_test/src/view_model/search_user_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription connectivitySubscription;

  @override
  void initState() {
    super.initState();
    Connectivity().checkConnectivity().then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        globalNavigatorKey.currentState?.pushReplacement(MaterialPageRoute(
            builder: (BuildContext _) => NetWorkErrorScreen()));
      }
    });
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        globalNavigatorKey.currentState?.pushReplacement(MaterialPageRoute(
            builder: (BuildContext _) => NetWorkErrorScreen()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text("GitHub"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: Colors.white,
            ),
            Consumer<SearchProvider>(
                builder: (context, provider, child) =>
                    provider.searchStatus == ProviderStatus.LOADING
                        ? SearchLoader()
                        : SearchField()),
            Expanded(child: Image.asset("assets/images/github.png"))
          ],
        ),
      ),
    );
  }
}
