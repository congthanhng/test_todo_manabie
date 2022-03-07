import 'package:test_todo_manabie/shelf/all_import.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Get.put<AppRoute>(AppRoute());

  runApp(const MyApp());
}


