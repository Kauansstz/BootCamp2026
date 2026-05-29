#!/bin/bash

echo -e "\n\033[1;36m🚀 Iniciando o setup do ambiente Rust no Windows...\033[0m"

# Garante que o Rust e o Cargo estão atualizados
echo -e "\n\033[1;33m🔄 Atualizando o Rust e o Cargo...\033[0m"
rustup update

# Instala ferramentas úteis se não existirem
echo -e "\n\033[1;33m📦 Verificando ferramentas auxiliares...\033[0m"
cargo install cargo-watch
rustup component add clippy rustfmt

echo -e "\n\033[1;32m✅ Ambiente configurado com sucesso!\033[0m\n"