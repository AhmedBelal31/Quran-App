import 'package:quran_app/core/utils/cache_helper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

String arabicFont = 'quran';
double arabicFontSize = 28;
double mushafFontSize = 40;

Uri quranAppUrl = Uri.parse('https://github.com/ahmedbelal31');

int bookmarkedAyah = 1;
int bookmarkedSura = 1;
bool fabIsClicked = true;

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

Future saveSettings() async {
  await CacheHelper.saveData(
      key: 'arabicFontSize', value: arabicFontSize.toInt());
  await CacheHelper.saveData(
      key: 'mushafFontSize', value: mushafFontSize.toInt());
}

Future getSettings() async {
  try {
    CacheHelper.getData(key: 'arabicFontSize')!.toDouble();
    arabicFontSize = (CacheHelper.getData(key: 'arabicFontSize')) as double;
    mushafFontSize = CacheHelper.getData(key: 'mushafFontSize')!.toDouble();
  } catch (_) {
    arabicFontSize = 28;
    mushafFontSize = 40;
  }
}

saveBookMark(surah, ayah) async {
  // final prefs = await SharedPreferences.getInstance();
  // await prefs.setInt("surah", surah);
  // await prefs.setInt("ayah", ayah);

  CacheHelper.saveData(key: "surah", value: surah);
  CacheHelper.saveData(key: "ayah", value: ayah);
}

readBookmark() async {
  print("read book mark called");
  final prefs = await SharedPreferences.getInstance();
  try {
    bookmarkedAyah = prefs.getInt('ayah')!;
    bookmarkedSura = prefs.getInt('surah')!;
    return true;
  } catch (e) {
    return false;
  }
}
