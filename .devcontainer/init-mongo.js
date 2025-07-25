const dbName = "demo";
const collectionName = "users";

// Conectar a MongoDB
const db = connect(`mongodb://localhost:27017/${dbName}`);

// Crear la base de datos y la colección si no existen
const collections = db.getCollectionNames();

if (!collections.includes(collectionName)) {
  print(`📦 Creando colección '${collectionName}' en la base de datos '${dbName}'...`);
  db.createCollection(collectionName);
} else {
  print(`✅ La colección '${collectionName}' ya existe.`);
}

// Verificar si ya hay datos
const existing = db[collectionName].countDocuments({});
if (existing === 0) {
  print("➕ Insertando registros iniciales...");
  db[collectionName].insertMany([
    { name: "Charlie", email: "charlie@mongo.com" },
    { name: "Dana", email: "dana@mongo.com" }
  ]);
} else {
  print("✅ La colección ya contiene datos. No se insertan duplicados.");
}
