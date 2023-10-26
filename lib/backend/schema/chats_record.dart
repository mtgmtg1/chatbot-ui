import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "pineconeNamespace" field.
  String? _pineconeNamespace;
  String get pineconeNamespace => _pineconeNamespace ?? '';
  bool hasPineconeNamespace() => _pineconeNamespace != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _pineconeNamespace = snapshotData['pineconeNamespace'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  static ChatsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ChatsRecord.getDocumentFromData(
        {
          'uid': convertAlgoliaParam(
            snapshot.data['uid'],
            ParamType.DocumentReference,
            false,
          ),
          'timestamp': convertAlgoliaParam(
            snapshot.data['timestamp'],
            ParamType.DateTime,
            false,
          ),
          'email': snapshot.data['email'],
          'pineconeNamespace': snapshot.data['pineconeNamespace'],
          'title': snapshot.data['title'],
        },
        ChatsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ChatsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'chats',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? uid,
  DateTime? timestamp,
  String? email,
  String? pineconeNamespace,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'timestamp': timestamp,
      'email': email,
      'pineconeNamespace': pineconeNamespace,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.timestamp == e2?.timestamp &&
        e1?.email == e2?.email &&
        e1?.pineconeNamespace == e2?.pineconeNamespace &&
        e1?.title == e2?.title;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality()
      .hash([e?.uid, e?.timestamp, e?.email, e?.pineconeNamespace, e?.title]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
