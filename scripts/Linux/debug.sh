#!/bin/bash
cd "$(dirname "$0")/../.."
PROJECT_NAME=$(grep -m 1 '^name =' Cargo.toml | cut -d '"' -f 2)

echo -e "\n\033[1;36m🛠️  Compilando em modo Debug...\033[0m"
cargo build

if [ $? -eq 0 ]; then
    echo -e "\n\033[1;32m🚀 Iniciando rust-lldb...\033[0m\n"
    rust-lldb ./target/debug/${PROJECT_NAME}
fi