const dbName = "demo";
const collectionName = "users";

// Conectar a MongoDB
const conn = new Mongo(); // mongosh ya provee esto
const db = conn.getDB(dbName);

// Crear la colección si no existe
if (!db.getCollectionNames().includes(collectionName)) {
  print(`📦 Creando colección '${collectionName}' en la base de datos '${dbName}'...`);
  db.createCollection(collectionName);
} else {
  print(`✅ La colección '${collectionName}' ya existe.`);
}

// Insertar datos solo si la colección está vacía
const count = db[collectionName].countDocuments({});
if (count === 0) {
  print("➕ Insertando registros iniciales...");
  db[collectionName].insertMany([
    { name: "Charlie", email: "charlie@mongo.com" },
    { name: "Dana", email: "dana@mongo.com" }
  ]);
} else {
  print(`✅ La colección '${collectionName}' ya tiene ${count} documentos. No se insertan duplicados.`);
}
