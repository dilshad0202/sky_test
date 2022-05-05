import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_test/src/services/api_service.dart';
import 'package:sky_test/src/utilities/api_constants.dart';
import 'package:sky_test/src/view/home_screen/home_screen.dart';
import 'package:sky_test/src/view_model/search_user_provider.dart';

void main() {
  runApp(MyApp());
}
final globalNavigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SearchProvider())],
      child: MaterialApp(
        navigatorKey: globalNavigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Skyislimit Test',
          home: HomeScreen()),
    );
  }
}
