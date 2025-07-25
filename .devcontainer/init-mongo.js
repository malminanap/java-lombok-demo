const db = db.getSiblingDB("demo");
const collectionName = "users";

if (!db.getCollectionNames().includes(collectionName)) {
  print(`📦 Creando colección '${collectionName}'...`);
  db.createCollection(collectionName);
}

if (db[collectionName].countDocuments() === 0) {
  print("➕ Insertando registros iniciales...");
  db[collectionName].insertMany([
    { name: "Charlie", email: "charlie@mongo.com" },
    { name: "Dana", email: "dana@mongo.com" }
  ]);
} else {
  print("✅ La colección ya contiene datos.");
}
