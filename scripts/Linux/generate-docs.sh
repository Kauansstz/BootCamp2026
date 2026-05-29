#!/bin/bash
cd "$(dirname "$0")/../.."

echo "📚 Gerando documentação do projeto..."

# Compila a documentação e abre no navegador padrão do Linux/macOS
cargo doc --no-deps --open

echo "✅ Documentação aberta no navegador!"