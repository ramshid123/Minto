import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static final db = FirebaseFirestore.instance;

  static final userCollection = db.collection('Users');
  static final TableCollection = db.collection('Tables');
}
