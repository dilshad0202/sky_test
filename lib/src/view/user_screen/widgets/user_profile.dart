import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_test/src/view_model/search_user_provider.dart';

class UserPofileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 812;
    SearchProvider provider = context.read<SearchProvider>();
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: _height * 25,
          ),
          CircleAvatar(
            radius: 75,
            onBackgroundImageError: (exception, stackTrace) =>
                Icon(Icons.person),
            backgroundImage: NetworkImage(provider.user!.profileUrl),
          ),
          SizedBox(
            height: _height * 15,
          ),
          Text(
            provider.user!.userName,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20,color: Colors.white),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(provider.user!.description,
                  style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Total Number of Repository : ${provider.repository.length.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ))
            ],
          )
        ],
      ),
    );
  }
}
