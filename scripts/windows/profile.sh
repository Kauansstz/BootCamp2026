#!/bin/bash
cd "$(dirname "$0")/../.."
PROJECT_NAME=$(grep -m 1 '^name =' Cargo.toml | cut -d '"' -f 2)

echo -e "\n\033[1;36m🛠️  Compilando projeto em modo otimizado (Release com símbolos de Debug)...\033[0m"
# RUSTFLAGS garante que o modo release salve as tabelas de símbolos para podermos medir a CPU
RUSTFLAGS="-g" cargo build --release

if [ $? -eq 0 ]; then
    echo -e "\n\033[1;32m⏱️  Iniciando análise de tempo de execução real da CPU...\033[0m"
    echo -e "\033[1;30m[O programa será executado medindo o tempo exato por comando]\033[0m\n"
    
    # Usa o utilitário time nativo do Git Bash para gerar métricas de CPU realistas
    time ./target/release/${PROJECT_NAME}.exe
    
    echo -e "\n\033[1;35m💡 Dica de mestre para Windows:\033[0m"
    echo -e "Para gráficos visuais completos de CPU (Flame Graphs), abra este projeto no"
    echo -e "VS Code, use a extensão 'Profile' ou use o menu 'Análise de Desempenho' do Visual Studio."
else
    echo -e "❌ Erro na compilação."
    exit 1
fi