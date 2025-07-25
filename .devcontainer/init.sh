#!/bin/bash

set -e

echo "⏳ Esperando a que MySQL esté disponible..."
until docker exec mysql mysql -uroot -pexample -e "SELECT 1"; do
  sleep 2
done

echo "✅ MySQL está listo."

echo "⏳ Esperando a que MongoDB esté disponible..."
until docker exec mongo mongosh --eval "db.stats()" > /dev/null 2>&1; do
  sleep 2
done

echo "✅ MongoDB está listo."

echo "📦 Insertando datos iniciales en MySQL..."
docker exec mysql mysql -uroot -pexample < /workspace/.devcontainer/init-mysql.sql

echo "📦 Insertando datos iniciales en MongoDB..."
docker exec mongo mongosh < /workspace/.devcontainer/init-mongo.js

echo "🚀 Ejecutando mvn code-gen..."
cd /workspace && mvn code-gen