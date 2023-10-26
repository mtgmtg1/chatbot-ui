import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigureRecord extends FirestoreRecord {
  ConfigureRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "chunkover" field.
  int? _chunkover;
  int get chunkover => _chunkover ?? 0;
  bool hasChunkover() => _chunkover != null;

  // "chunksize" field.
  int? _chunksize;
  int get chunksize => _chunksize ?? 0;
  bool hasChunksize() => _chunksize != null;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  bool hasTemperature() => _temperature != null;

  // "system" field.
  String? _system;
  String get system => _system ?? '';
  bool hasSystem() => _system != null;

  // "create" field.
  DateTime? _create;
  DateTime? get create => _create;
  bool hasCreate() => _create != null;

  // "maxtoken" field.
  int? _maxtoken;
  int get maxtoken => _maxtoken ?? 0;
  bool hasMaxtoken() => _maxtoken != null;

  void _initializeFields() {
    _model = snapshotData['model'] as String?;
    _chunkover = castToType<int>(snapshotData['chunkover']);
    _chunksize = castToType<int>(snapshotData['chunksize']);
    _temperature = castToType<double>(snapshotData['temperature']);
    _system = snapshotData['system'] as String?;
    _create = snapshotData['create'] as DateTime?;
    _maxtoken = castToType<int>(snapshotData['maxtoken']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('configure');

  static Stream<ConfigureRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigureRecord.fromSnapshot(s));

  static Future<ConfigureRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigureRecord.fromSnapshot(s));

  static ConfigureRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfigureRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigureRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigureRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigureRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigureRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigureRecordData({
  String? model,
  int? chunkover,
  int? chunksize,
  double? temperature,
  String? system,
  DateTime? create,
  int? maxtoken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'model': model,
      'chunkover': chunkover,
      'chunksize': chunksize,
      'temperature': temperature,
      'system': system,
      'create': create,
      'maxtoken': maxtoken,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigureRecordDocumentEquality implements Equality<ConfigureRecord> {
  const ConfigureRecordDocumentEquality();

  @override
  bool equals(ConfigureRecord? e1, ConfigureRecord? e2) {
    return e1?.model == e2?.model &&
        e1?.chunkover == e2?.chunkover &&
        e1?.chunksize == e2?.chunksize &&
        e1?.temperature == e2?.temperature &&
        e1?.system == e2?.system &&
        e1?.create == e2?.create &&
        e1?.maxtoken == e2?.maxtoken;
  }

  @override
  int hash(ConfigureRecord? e) => const ListEquality().hash([
        e?.model,
        e?.chunkover,
        e?.chunksize,
        e?.temperature,
        e?.system,
        e?.create,
        e?.maxtoken
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfigureRecord;
}
