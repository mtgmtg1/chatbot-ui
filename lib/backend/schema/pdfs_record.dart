import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PdfsRecord extends FirestoreRecord {
  PdfsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create" field.
  DateTime? _create;
  DateTime? get create => _create;
  bool hasCreate() => _create != null;

  // "pineconeNamespace" field.
  String? _pineconeNamespace;
  String get pineconeNamespace => _pineconeNamespace ?? '';
  bool hasPineconeNamespace() => _pineconeNamespace != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "chunkSize" field.
  int? _chunkSize;
  int get chunkSize => _chunkSize ?? 0;
  bool hasChunkSize() => _chunkSize != null;

  // "chunkoverwrap" field.
  int? _chunkoverwrap;
  int get chunkoverwrap => _chunkoverwrap ?? 0;
  bool hasChunkoverwrap() => _chunkoverwrap != null;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  bool hasTemperature() => _temperature != null;

  // "system" field.
  String? _system;
  String get system => _system ?? '';
  bool hasSystem() => _system != null;

  // "maxtoken" field.
  int? _maxtoken;
  int get maxtoken => _maxtoken ?? 0;
  bool hasMaxtoken() => _maxtoken != null;

  void _initializeFields() {
    _create = snapshotData['create'] as DateTime?;
    _pineconeNamespace = snapshotData['pineconeNamespace'] as String?;
    _title = snapshotData['title'] as String?;
    _model = snapshotData['model'] as String?;
    _chunkSize = castToType<int>(snapshotData['chunkSize']);
    _chunkoverwrap = castToType<int>(snapshotData['chunkoverwrap']);
    _temperature = castToType<double>(snapshotData['temperature']);
    _system = snapshotData['system'] as String?;
    _maxtoken = castToType<int>(snapshotData['maxtoken']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pdfs');

  static Stream<PdfsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PdfsRecord.fromSnapshot(s));

  static Future<PdfsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PdfsRecord.fromSnapshot(s));

  static PdfsRecord fromSnapshot(DocumentSnapshot snapshot) => PdfsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PdfsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PdfsRecord._(reference, mapFromFirestore(data));

  static PdfsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PdfsRecord.getDocumentFromData(
        {
          'create': convertAlgoliaParam(
            snapshot.data['create'],
            ParamType.DateTime,
            false,
          ),
          'pineconeNamespace': snapshot.data['pineconeNamespace'],
          'title': snapshot.data['title'],
          'model': snapshot.data['model'],
          'chunkSize': convertAlgoliaParam(
            snapshot.data['chunkSize'],
            ParamType.int,
            false,
          ),
          'chunkoverwrap': convertAlgoliaParam(
            snapshot.data['chunkoverwrap'],
            ParamType.int,
            false,
          ),
          'temperature': convertAlgoliaParam(
            snapshot.data['temperature'],
            ParamType.double,
            false,
          ),
          'system': snapshot.data['system'],
          'maxtoken': convertAlgoliaParam(
            snapshot.data['maxtoken'],
            ParamType.int,
            false,
          ),
        },
        PdfsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PdfsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'pdfs',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PdfsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PdfsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPdfsRecordData({
  DateTime? create,
  String? pineconeNamespace,
  String? title,
  String? model,
  int? chunkSize,
  int? chunkoverwrap,
  double? temperature,
  String? system,
  int? maxtoken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create': create,
      'pineconeNamespace': pineconeNamespace,
      'title': title,
      'model': model,
      'chunkSize': chunkSize,
      'chunkoverwrap': chunkoverwrap,
      'temperature': temperature,
      'system': system,
      'maxtoken': maxtoken,
    }.withoutNulls,
  );

  return firestoreData;
}

class PdfsRecordDocumentEquality implements Equality<PdfsRecord> {
  const PdfsRecordDocumentEquality();

  @override
  bool equals(PdfsRecord? e1, PdfsRecord? e2) {
    return e1?.create == e2?.create &&
        e1?.pineconeNamespace == e2?.pineconeNamespace &&
        e1?.title == e2?.title &&
        e1?.model == e2?.model &&
        e1?.chunkSize == e2?.chunkSize &&
        e1?.chunkoverwrap == e2?.chunkoverwrap &&
        e1?.temperature == e2?.temperature &&
        e1?.system == e2?.system &&
        e1?.maxtoken == e2?.maxtoken;
  }

  @override
  int hash(PdfsRecord? e) => const ListEquality().hash([
        e?.create,
        e?.pineconeNamespace,
        e?.title,
        e?.model,
        e?.chunkSize,
        e?.chunkoverwrap,
        e?.temperature,
        e?.system,
        e?.maxtoken
      ]);

  @override
  bool isValidKey(Object? o) => o is PdfsRecord;
}
