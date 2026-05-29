#!/bin/bash
set -e
cd "$(dirname "$0")/../.."

echo "🔨 Iniciando o setup do ambiente Rust no Linux..."

# Atualiza o Rust
rustup update

# Instala componentes indispensáveis
echo "📦 Verificando ferramentas auxiliares..."
cargo install cargo-watch
rustup component add clippy rustfmt

echo "✅ Ambiente configurado com sucesso!"