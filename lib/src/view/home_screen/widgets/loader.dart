import 'package:flutter/material.dart';


class SearchLoader extends StatelessWidget {
  const SearchLoader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.black12,
        ))
    );
  }
}