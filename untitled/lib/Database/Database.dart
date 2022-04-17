import 'dart:io';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'Database.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().named('user_name').withLength(min: 6, max: 32)();
  TextColumn get password => text().named('password').withLength(min: 8)();
  IntColumn get category => integer().nullable()();
}

class RoomTable extends Table{
  IntColumn get Roomid => integer().autoIncrement()();
  TextColumn get Roomname => text().withLength(max: 32)();
  IntColumn get maxoccupants => integer().nullable()();
  IntColumn get Price => integer().nullable()();
  TextColumn get Roomtype => text().withLength(max: 32)();

}

// This will make drift generate a class called "Category" to represent a row in
// this table. By default, "Categorie" would have been used because it only
//strips away the trailing "s" in the table name.


// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(
  tables: [UserTable,RoomTable]
)

//@DriftDatabase(tables: Tables.drift) //
class HotelDatabase extends _$HotelDatabase {
  // we tell the database where to store the data with this constructor
  HotelDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
  Future<List<UserTableData>> getUserList() async {
    return await select(userTable).get();
  }

  Future<UserTableData> getUser(int id) async{
    return await (select(userTable)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateUser(UserTableCompanion entity) async{ //UserTableCompanion มาจากใน Database.g ที่ระบบสร้างไว้ให้
    return await update(userTable).replace(entity);
  }

  Future<int> insertUser(UserTableCompanion entity) async{
    return await into(userTable).insert(entity);
  }
  Future<int> deleteUser(int id) async{
    return (delete(userTable)..where((t) => t.id.equals(id))).go();
  }


  Future<List<RoomTableData>> getRoomList() async {
    return await select(roomTable).get();
  }

  Future<int> deleteRoom(int id) async{
    return (delete(roomTable)..where((t) => t.Roomid.equals(id))).go();
  }
  Future<RoomTableData> getRoom(int id) async{
    return await (select(roomTable)..where((tbl) => tbl.Roomid.equals(id))).getSingle();
  }

  Future<bool> updateRoom(RoomTableCompanion entity) async{ //UserTableCompanion มาจากใน Database.g ที่ระบบสร้างไว้ให้
    return await update(roomTable).replace(entity);
  }

  Future<int> insertRoom(RoomTableCompanion entity) async{
    return await into(roomTable).insert(entity);
  }


}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'hoteldb.sqlite'));
    return NativeDatabase(file);
  });
}
