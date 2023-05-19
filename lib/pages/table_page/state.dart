import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:minto/services/database_service.dart';

class TablePageState {
  var peopleNumberSelectButtonIndex = 0.obs;

  Query<Map<String, dynamic>> query =
      DatabaseService.TableCollection.where('max', isEqualTo: '2')
          .orderBy('index');
}
