#!/bin/bash
set -e

echo "⏳ Esperando a que MySQL esté disponible..."
until mysql -h mysql -uuser -ppassword -e "SELECT 1;" demo_db; do
  sleep 2
done
echo "✅ MySQL está listo."

echo "⏳ Esperando a que MongoDB esté disponible..."
#until mongosh "mongodb://mongo:27017/" --eval "db.runCommand({ ping: 1 })" > /dev/null 2>&1; do
#  sleep 2
#done
echo "✅ MongoDB está listo."

echo "📦 Insertando datos iniciales en MySQL..."
mysql -h mysql -uuser -ppassword demo_db < .devcontainer/init-mysql.sql

echo "📦 Insertando datos iniciales en MongoDB..."
mongosh "mongodb://mongo:27017/demo" .devcontainer/init-mongo.js

echo "🚀 Ejecutando mvn generate-sources..."
mvn generate-sources
