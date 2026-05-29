#!/bin/bash
cd "$(dirname "$0")/../.."

# Pega o nome do projeto direto do Cargo.toml de forma dinâmica
PROJECT_NAME=$(grep -m 1 '^name =' Cargo.toml | cut -d '"' -f 2)

echo -e "\n\033[1;33m🔍 Verificando dependências do depurador (LLDB)...\033[0m"

# Verifica se o lldb está instalado no Windows
if ! command -v lldb &> /dev/null; then
    echo -e "\033[1;31m⚠️  rust-lldb ou lldb não encontrado no seu PATH.\033[0m"
    echo -e "💡 Dica para instalar no Windows:"
    echo -e "   Abra o PowerShell como Admin e rode: \033[1;36mscoop install llvm\033[0m"
    echo -e "   Ou certifique-se de que as ferramentas do C++ do Visual Studio (MSVC) estão instaladas.\n"
    read -p "Deseja tentar rodar mesmo assim? (s/n): " CONTINUAR
    if [[ "$CONTINUAR" != "s" && "$CONTINUAR" != "S" ]]; then
        exit 1
    fi
fi

echo -e "\n\033[1;36m🛠️  Compilando o projeto em modo Debug (com símbolos de depuração)...\033[0m"
cargo build

if [ $? -eq 0 ]; then
    echo -e "\n\033[1;32m🚀 Iniciando sessão do LLDB para o executável: ./target/debug/${PROJECT_NAME}.exe\033[0m"
    echo -e "\033[1;30m💡 Comandos úteis do LLDB:"
    echo -e "   - 'b main' (coloca breakpoint na função principal)"
    echo -e "   - 'r' (run - inicia a execução)"
    echo -e "   - 'n' (next - pula para a próxima linha)"
    echo -e "   - 'p variavel' (print - exibe o valor de uma variável)"
    echo -e "   - 'q' (quit - sai do debugger)\033[0m\n"
    
    # Executa o LLDB apontando para o binário recém gerado
    lldb ./target/debug/${PROJECT_NAME}.exe
else
    echo -e "\033[1;31m❌ Falha na compilação do projeto. Não foi possível depurar.\033[0m\n"
    exit 1
fi