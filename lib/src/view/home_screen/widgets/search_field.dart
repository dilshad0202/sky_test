import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_test/main.dart';
import 'package:sky_test/src/view/user_screen/user_details_screen.dart';
import 'package:sky_test/src/view_model/search_user_provider.dart';

class SearchField extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: TextField(
        controller: controller,
        cursorColor: Colors.black54,
        style: TextStyle(
          color: Colors.black54,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          suffixIcon: InkWell(
            onTap: () async {
              await context.read<SearchProvider>().getUserData(controller.text).then((value) {
                if (value) {
                  Navigator.push(globalNavigatorKey.currentContext!,
                      MaterialPageRoute(builder: (context) => UserScreen()));
                } else {
                  ScaffoldMessenger.of(globalNavigatorKey.currentContext!).showSnackBar(SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        "Unable to fetch User Data",
                        style: TextStyle(color: Colors.black),
                      )));
                }
              });
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          border: InputBorder.none,
          hintText: "Search User",
        ),
      ),
    );
  }
}
