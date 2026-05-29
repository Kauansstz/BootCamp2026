#!/bin/bash
cd "$(dirname "$0")/../.."
PROJECT_NAME=$(grep -m 1 '^name =' Cargo.toml | cut -d '"' -f 2)

echo -e "\n\033[1;33m🔍 Verificando Valgrind no sistema...\033[0m"
if ! command -v valgrind &> /dev/null; then
    echo "📥 Instalando valgrind..."
    sudo apt-get update && sudo apt-get install -y valgrind
fi

echo -e "\n\033[1;36m🛠️  Compilando projeto em modo Debug...\033[0m"
cargo build

if [ $? -eq 0 ]; then
    echo -e "\n\033[1;32m🧠 Rodando Valgrind Extremo (Leak Check Full)...\033[0m\n"
    valgrind --leak-check=full \
             --show-leak-kinds=all \
             --track-origins=yes \
             ./target/debug/${PROJECT_NAME}
else
    exit 1
fi