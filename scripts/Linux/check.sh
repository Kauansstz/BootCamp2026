#!/bin/bash
cd "$(dirname "$0")/../.."

echo "✨ Formatando o código..."
cargo fmt

echo "🔍 Rodando o Clippy (Linter)..."
cargo clippy -- -D warnings

echo "🧪 Executando os testes unitários..."
cargo test

echo "🚀 Tudo limpo e pronto!"