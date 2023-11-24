import 'package:flutter/material.dart';
import 'package:quran_app/screens/home_screen.dart';
import 'constants.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/models/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Quran-Al-Kareem ',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
