#!/bin/bash
cd "$(dirname "$0")/../.."

echo "🧹 Limpando compilações antigas..."
cargo clean

echo "⚙️ Compilando o projeto em modo Release (Otimizado)..."
cargo build --release

if [ $? -eq 0 ]; then
    echo "📦 Build concluído com sucesso!"
    echo "O seu binário está em: ./target/release/"
else
    echo "❌ Falha no build."
fi