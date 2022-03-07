// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/theme_model.dart';
import 'models/user_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2858139703729653879),
      name: 'ThemesModel',
      lastPropertyId: const IdUid(2, 7416763816876963643),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3518411691898815040),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7416763816876963643),
            name: 'appLang',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 2871331295712293126),
      name: 'UserModel',
      lastPropertyId: const IdUid(6, 1974263568147132260),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 835678537992739319),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6284280803918922076),
            name: 'fullName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3870909451951315406),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 380697650956085884),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7524703512837789337),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1974263568147132260),
            name: 'userType',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 2871331295712293126),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ThemesModel: EntityDefinition<ThemesModel>(
        model: _entities[0],
        toOneRelations: (ThemesModel object) => [],
        toManyRelations: (ThemesModel object) => {},
        getId: (ThemesModel object) => object.id,
        setId: (ThemesModel object, int id) {
          object.id = id;
        },
        objectToFB: (ThemesModel object, fb.Builder fbb) {
          final appLangOffset =
              object.appLang == null ? null : fbb.writeString(object.appLang!);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, appLangOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ThemesModel(
              appLang: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    UserModel: EntityDefinition<UserModel>(
        model: _entities[1],
        toOneRelations: (UserModel object) => [],
        toManyRelations: (UserModel object) => {},
        getId: (UserModel object) => object.id,
        setId: (UserModel object, int id) {
          object.id = id;
        },
        objectToFB: (UserModel object, fb.Builder fbb) {
          final fullNameOffset = object.fullName == null
              ? null
              : fbb.writeString(object.fullName!);
          final phoneOffset =
              object.phone == null ? null : fbb.writeString(object.phone!);
          final emailOffset =
              object.email == null ? null : fbb.writeString(object.email!);
          final passwordOffset = object.password == null
              ? null
              : fbb.writeString(object.password!);
          final userTypeOffset = object.userType == null
              ? null
              : fbb.writeString(object.userType!);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, fullNameOffset);
          fbb.addOffset(2, phoneOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addOffset(4, passwordOffset);
          fbb.addOffset(5, userTypeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = UserModel(
              fullName: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              phone: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              password: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              userType: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ThemesModel] entity fields to define ObjectBox queries.
class ThemesModel_ {
  /// see [ThemesModel.id]
  static final id =
      QueryIntegerProperty<ThemesModel>(_entities[0].properties[0]);

  /// see [ThemesModel.appLang]
  static final appLang =
      QueryStringProperty<ThemesModel>(_entities[0].properties[1]);
}

/// [UserModel] entity fields to define ObjectBox queries.
class UserModel_ {
  /// see [UserModel.id]
  static final id = QueryIntegerProperty<UserModel>(_entities[1].properties[0]);

  /// see [UserModel.fullName]
  static final fullName =
      QueryStringProperty<UserModel>(_entities[1].properties[1]);

  /// see [UserModel.phone]
  static final phone =
      QueryStringProperty<UserModel>(_entities[1].properties[2]);

  /// see [UserModel.email]
  static final email =
      QueryStringProperty<UserModel>(_entities[1].properties[3]);

  /// see [UserModel.password]
  static final password =
      QueryStringProperty<UserModel>(_entities[1].properties[4]);

  /// see [UserModel.userType]
  static final userType =
      QueryStringProperty<UserModel>(_entities[1].properties[5]);
}
