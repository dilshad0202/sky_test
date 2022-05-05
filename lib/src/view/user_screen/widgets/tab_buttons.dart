import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_test/src/utilities/enums.dart';
import 'package:sky_test/src/view_model/search_user_provider.dart';

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Consumer<SearchProvider>(
            builder: (context,provider,child)=>
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<SearchProvider>().changeCurrentTab(CurrentTab.PROFILE);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                       color: provider.currentTab == CurrentTab.PROFILE ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(.2),             
                      height: 33,
                      width: width * 100,
                      child: Center(
                          child: Text(
                        "Profile",style: TextStyle(color :provider.currentTab == CurrentTab.PROFILE ? Colors.white : Colors.black),
                      ))),
                ),
                 TextButton(
                  onPressed: () {
                    context.read<SearchProvider>().changeCurrentTab(CurrentTab.REPOSITORY);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                       color: provider.currentTab == CurrentTab.REPOSITORY ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(.2),             
                      height: 33,
                      width: width * 100,
                      child: Center(
                          child: Text(
                        "Repository",style: TextStyle(color :provider.currentTab == CurrentTab.REPOSITORY ? Colors.white : Colors.black),
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
