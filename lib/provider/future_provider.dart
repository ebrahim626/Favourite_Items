
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<List<String>>((ref) async {
  await Future.delayed(Duration(seconds: 3));
  return ["Enan",'Taslim','Dishat','Ebrahim'];
});