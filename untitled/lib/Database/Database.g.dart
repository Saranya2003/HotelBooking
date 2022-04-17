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
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
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
      if (username != null) 'user_name': username,
      if (password != null) 'password': password,
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
      map['user_name'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
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
      'user_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password =
      GeneratedColumn<String?>('password', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 8,
          ),
          type: const StringType(),
          requiredDuringInsert: true);
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
    if (data.containsKey('user_name')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['user_name']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
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

class RoomTableData extends DataClass implements Insertable<RoomTableData> {
  final int Roomid;
  final String Roomname;
  final int? maxoccupants;
  final int? Price;
  final String Roomtype;
  RoomTableData(
      {required this.Roomid,
      required this.Roomname,
      this.maxoccupants,
      this.Price,
      required this.Roomtype});
  factory RoomTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RoomTableData(
      Roomid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}roomid'])!,
      Roomname: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}roomname'])!,
      maxoccupants: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}maxoccupants']),
      Price: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price']),
      Roomtype: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}roomtype'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['roomid'] = Variable<int>(Roomid);
    map['roomname'] = Variable<String>(Roomname);
    if (!nullToAbsent || maxoccupants != null) {
      map['maxoccupants'] = Variable<int?>(maxoccupants);
    }
    if (!nullToAbsent || Price != null) {
      map['price'] = Variable<int?>(Price);
    }
    map['roomtype'] = Variable<String>(Roomtype);
    return map;
  }

  RoomTableCompanion toCompanion(bool nullToAbsent) {
    return RoomTableCompanion(
      Roomid: Value(Roomid),
      Roomname: Value(Roomname),
      maxoccupants: maxoccupants == null && nullToAbsent
          ? const Value.absent()
          : Value(maxoccupants),
      Price:
          Price == null && nullToAbsent ? const Value.absent() : Value(Price),
      Roomtype: Value(Roomtype),
    );
  }

  factory RoomTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomTableData(
      Roomid: serializer.fromJson<int>(json['Roomid']),
      Roomname: serializer.fromJson<String>(json['Roomname']),
      maxoccupants: serializer.fromJson<int?>(json['maxoccupants']),
      Price: serializer.fromJson<int?>(json['Price']),
      Roomtype: serializer.fromJson<String>(json['Roomtype']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'Roomid': serializer.toJson<int>(Roomid),
      'Roomname': serializer.toJson<String>(Roomname),
      'maxoccupants': serializer.toJson<int?>(maxoccupants),
      'Price': serializer.toJson<int?>(Price),
      'Roomtype': serializer.toJson<String>(Roomtype),
    };
  }

  RoomTableData copyWith(
          {int? Roomid,
          String? Roomname,
          int? maxoccupants,
          int? Price,
          String? Roomtype}) =>
      RoomTableData(
        Roomid: Roomid ?? this.Roomid,
        Roomname: Roomname ?? this.Roomname,
        maxoccupants: maxoccupants ?? this.maxoccupants,
        Price: Price ?? this.Price,
        Roomtype: Roomtype ?? this.Roomtype,
      );
  @override
  String toString() {
    return (StringBuffer('RoomTableData(')
          ..write('Roomid: $Roomid, ')
          ..write('Roomname: $Roomname, ')
          ..write('maxoccupants: $maxoccupants, ')
          ..write('Price: $Price, ')
          ..write('Roomtype: $Roomtype')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(Roomid, Roomname, maxoccupants, Price, Roomtype);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomTableData &&
          other.Roomid == this.Roomid &&
          other.Roomname == this.Roomname &&
          other.maxoccupants == this.maxoccupants &&
          other.Price == this.Price &&
          other.Roomtype == this.Roomtype);
}

class RoomTableCompanion extends UpdateCompanion<RoomTableData> {
  final Value<int> Roomid;
  final Value<String> Roomname;
  final Value<int?> maxoccupants;
  final Value<int?> Price;
  final Value<String> Roomtype;
  const RoomTableCompanion({
    this.Roomid = const Value.absent(),
    this.Roomname = const Value.absent(),
    this.maxoccupants = const Value.absent(),
    this.Price = const Value.absent(),
    this.Roomtype = const Value.absent(),
  });
  RoomTableCompanion.insert({
    this.Roomid = const Value.absent(),
    required String Roomname,
    this.maxoccupants = const Value.absent(),
    this.Price = const Value.absent(),
    required String Roomtype,
  })  : Roomname = Value(Roomname),
        Roomtype = Value(Roomtype);
  static Insertable<RoomTableData> custom({
    Expression<int>? Roomid,
    Expression<String>? Roomname,
    Expression<int?>? maxoccupants,
    Expression<int?>? Price,
    Expression<String>? Roomtype,
  }) {
    return RawValuesInsertable({
      if (Roomid != null) 'roomid': Roomid,
      if (Roomname != null) 'roomname': Roomname,
      if (maxoccupants != null) 'maxoccupants': maxoccupants,
      if (Price != null) 'price': Price,
      if (Roomtype != null) 'roomtype': Roomtype,
    });
  }

  RoomTableCompanion copyWith(
      {Value<int>? Roomid,
      Value<String>? Roomname,
      Value<int?>? maxoccupants,
      Value<int?>? Price,
      Value<String>? Roomtype}) {
    return RoomTableCompanion(
      Roomid: Roomid ?? this.Roomid,
      Roomname: Roomname ?? this.Roomname,
      maxoccupants: maxoccupants ?? this.maxoccupants,
      Price: Price ?? this.Price,
      Roomtype: Roomtype ?? this.Roomtype,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (Roomid.present) {
      map['roomid'] = Variable<int>(Roomid.value);
    }
    if (Roomname.present) {
      map['roomname'] = Variable<String>(Roomname.value);
    }
    if (maxoccupants.present) {
      map['maxoccupants'] = Variable<int?>(maxoccupants.value);
    }
    if (Price.present) {
      map['price'] = Variable<int?>(Price.value);
    }
    if (Roomtype.present) {
      map['roomtype'] = Variable<String>(Roomtype.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomTableCompanion(')
          ..write('Roomid: $Roomid, ')
          ..write('Roomname: $Roomname, ')
          ..write('maxoccupants: $maxoccupants, ')
          ..write('Price: $Price, ')
          ..write('Roomtype: $Roomtype')
          ..write(')'))
        .toString();
  }
}

class $RoomTableTable extends RoomTable
    with TableInfo<$RoomTableTable, RoomTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _RoomidMeta = const VerificationMeta('Roomid');
  @override
  late final GeneratedColumn<int?> Roomid = GeneratedColumn<int?>(
      'roomid', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _RoomnameMeta = const VerificationMeta('Roomname');
  @override
  late final GeneratedColumn<String?> Roomname = GeneratedColumn<String?>(
      'roomname', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _maxoccupantsMeta =
      const VerificationMeta('maxoccupants');
  @override
  late final GeneratedColumn<int?> maxoccupants = GeneratedColumn<int?>(
      'maxoccupants', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _PriceMeta = const VerificationMeta('Price');
  @override
  late final GeneratedColumn<int?> Price = GeneratedColumn<int?>(
      'price', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _RoomtypeMeta = const VerificationMeta('Roomtype');
  @override
  late final GeneratedColumn<String?> Roomtype = GeneratedColumn<String?>(
      'roomtype', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [Roomid, Roomname, maxoccupants, Price, Roomtype];
  @override
  String get aliasedName => _alias ?? 'room_table';
  @override
  String get actualTableName => 'room_table';
  @override
  VerificationContext validateIntegrity(Insertable<RoomTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('roomid')) {
      context.handle(_RoomidMeta,
          Roomid.isAcceptableOrUnknown(data['roomid']!, _RoomidMeta));
    }
    if (data.containsKey('roomname')) {
      context.handle(_RoomnameMeta,
          Roomname.isAcceptableOrUnknown(data['roomname']!, _RoomnameMeta));
    } else if (isInserting) {
      context.missing(_RoomnameMeta);
    }
    if (data.containsKey('maxoccupants')) {
      context.handle(
          _maxoccupantsMeta,
          maxoccupants.isAcceptableOrUnknown(
              data['maxoccupants']!, _maxoccupantsMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _PriceMeta, Price.isAcceptableOrUnknown(data['price']!, _PriceMeta));
    }
    if (data.containsKey('roomtype')) {
      context.handle(_RoomtypeMeta,
          Roomtype.isAcceptableOrUnknown(data['roomtype']!, _RoomtypeMeta));
    } else if (isInserting) {
      context.missing(_RoomtypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {Roomid};
  @override
  RoomTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RoomTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoomTableTable createAlias(String alias) {
    return $RoomTableTable(attachedDatabase, alias);
  }
}

abstract class _$HotelDatabase extends GeneratedDatabase {
  _$HotelDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $RoomTableTable roomTable = $RoomTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userTable, roomTable];
}
