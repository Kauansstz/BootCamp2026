#!/bin/bash
cd "$(dirname "$0")/../.."

echo "🧪 Iniciando monitoramento de testes (Cargo Watch)..."
echo "Pressione Ctrl+C para encerrar."

cargo watch -x test