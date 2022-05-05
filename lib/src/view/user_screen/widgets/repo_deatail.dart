import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_test/src/view_model/search_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoDetailWidget extends StatelessWidget {
  const RepoDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchProvider provider = context.read<SearchProvider>();
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children:[
           Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  child: TextButton(
                    onPressed: ()  {
                     provider.launchURL(provider.repository[index].url);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          provider.repository[index].name,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                        Text(provider.repository[index].fullName)
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 0.5, blurRadius: 2),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: provider.repository.length),
        ),]
      ),
    );
  }
 
}
