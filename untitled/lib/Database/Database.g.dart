// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String username;
  final String password;
  final int? category;
  UserTableData(
      {required this.id,
      required this.username,
      required this.password,
      this.category});
  factory UserTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['body'] = Variable<String>(password);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int?>(category);
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      category: serializer.fromJson<int?>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'category': serializer.toJson<int?>(category),
    };
  }

  UserTableData copyWith(
          {int? id, String? username, String? password, int? category}) =>
      UserTableData(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.category == this.category);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<int?> category;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.category = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    this.category = const Value.absent(),
  })  : username = Value(username),
        password = Value(password);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<int?>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'body': password,
      if (category != null) 'category': category,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? password,
      Value<int?>? category}) {
    return UserTableCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['body'] = Variable<String>(password.value);
    }
    if (category.present) {
      map['category'] = Variable<int?>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'body', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<int?> category = GeneratedColumn<int?>(
      'category', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, username, password, category];
  @override
  String get aliasedName => _alias ?? 'user_table';
  @override
  String get actualTableName => 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['body']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserTableTable userTable = $UserTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userTable];
}
