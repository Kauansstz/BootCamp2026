#!/bin/bash
cd "$(dirname "$0")/../.."
PROJECT_NAME=$(grep -m 1 '^name =' Cargo.toml | cut -d '"' -f 2)

echo -e "\n\033[1;33m🔍 Verificando ferramenta Linux Perf...\033[0m"
if ! command -v perf &> /dev/null; then
    echo "📥 Instalando ferramentas de performance do Linux..."
    sudo apt-get update && sudo apt-get install -y linux-tools-generic linux-tools-$(uname -r)
fi

echo -e "\n\033[1;36m🛠️  Compilando binário em modo Release com símbolos ativos...\033[0m"
RUSTFLAGS="-g" cargo build --release

if [ $? -eq 0 ]; then
    echo -e "\n\033[1;32m⚡ Gravando amostragem de chamadas da CPU (perf record)...\033[0m"
    echo -e "\033[1;30m[Execute os comandos do seu app normalmente. Ao sair, o relatório abrirá]\033[0m\n"
    
    # Grava estatísticas de CPU usando os contadores do hardware
    sudo perf record --call-graph dwarf ./target/release/${PROJECT_NAME}
    
    echo -e "\n\033[1;36m📊 Abrindo Relatório Interativo do Perf...\033[0m"
    perf report
else
    exit 1
fi