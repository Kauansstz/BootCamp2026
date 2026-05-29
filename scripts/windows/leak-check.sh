#!/bin/bash
cd "$(dirname "$0")/../.."
PROJECT_NAME=$(grep -m 1 '^name =' Cargo.toml | cut -d '"' -f 2)

echo -e "\n\033[1;33m🔍 Verificando DrMemory (Substituto do Valgrind para Windows)...\033[0m"

if ! command -v drmemory &> /dev/null; then
    echo -e "⚠️  DrMemory não encontrado."
    echo -e "💡 Instale abrindo o PowerShell como Admin e rodando: \033[1;36mscoop install drmemory\033[0m"
    exit 1
fi

echo -e "\n\033[1;36m🛠️  Compilando binário de teste...\033[0m"
cargo build

if [ $? -eq 0 ]; then
    echo -e "\n\033[1;32m🧠 Iniciando DrMemory para caçar Memory Leaks...\033[0m\n"
    drmemory -- ./target/debug/${PROJECT_NAME}.exe
else
    echo -e "❌ Erro na compilação."
    exit 1
fi