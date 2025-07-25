#!/bin/bash
set -e

echo "⏳ Esperando a que MySQL esté disponible..."
until mysql -h mysql -uuser -ppassword -e "SELECT 1;" demo_db; do
  sleep 2
done
echo "✅ MySQL está listo."

echo "⏳ Esperando a que MongoDB esté disponible..."
until nc -z mongo 27017; do
  sleep 2
done
echo "✅ MongoDB está listo."

echo "📦 Insertando datos iniciales en MySQL..."
mysql -h mysql -uuser -ppassword demo_db < .devcontainer/init-mysql.sql

echo "📦 Insertando datos iniciales en MongoDB..."
mongoimport --host mongo --port 27017 --db demo --collection users --jsonArray --file .devcontainer/init-mongo.json

echo "🚀 Ejecutando mvn code-gen..."
mvn code-gen
