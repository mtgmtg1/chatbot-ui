import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "firstMessage" field.
  bool? _firstMessage;
  bool get firstMessage => _firstMessage ?? false;
  bool hasFirstMessage() => _firstMessage != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "user" field.
  bool? _user;
  bool get user => _user ?? false;
  bool hasUser() => _user != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _firstMessage = snapshotData['firstMessage'] as bool?;
    _message = snapshotData['message'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _user = snapshotData['user'] as bool?;
    _email = snapshotData['email'] as String?;
    _pineconeNamespace = snapshotData['pineconeNamespace'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('messages').doc();

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DateTime? timestamp,
  bool? firstMessage,
  String? message,
  DocumentReference? uid,
  bool? user,
  String? email,
  String? pineconeNamespace,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'firstMessage': firstMessage,
      'message': message,
      'uid': uid,
      'user': user,
      'email': email,
      'pineconeNamespace': pineconeNamespace,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.firstMessage == e2?.firstMessage &&
        e1?.message == e2?.message &&
        e1?.uid == e2?.uid &&
        e1?.user == e2?.user &&
        e1?.email == e2?.email &&
        e1?.pineconeNamespace == e2?.pineconeNamespace &&
        e1?.title == e2?.title;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.firstMessage,
        e?.message,
        e?.uid,
        e?.user,
        e?.email,
        e?.pineconeNamespace,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
