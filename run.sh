#!/bin/bash

# 1. Detecta o Sistema Operacional atual
OS_TYPE="unknown"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_TYPE="linux"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "win32" ]]; then
    OS_TYPE="windows"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="mac"
fi

echo "========================================="
echo "🎛️  PAINEL DE CONTROLE DO PROJETO RUST"
echo "========================================="
echo "💻 Sistema Detectado: $OS_TYPE"
echo "----------------------------------------"
echo "1) Setup (Configurar Ambiente)"
echo "2) Watch (Executar Projeto em Tempo Real)"
echo "3) Format (Formatar Código de forma Forçada)"
echo "4) Check (Linter e Testes)"
echo "5) Watch-Tests (Testar em Tempo Real)"
echo "6) Docs (Gerar e Abrir Documentação)"
echo "7) Audit-Deps (Segurança e Dependências)"
echo "8) Build-Release (Compilar para Produção)"
echo "9) Debug (Instalar/Rodar Debugger LLDB)"
echo "10) Leak-Check (Análise de Memória/Vazamentos)"
echo "11) Profile (Perfilamento de CPU/Gargalos)"
echo "========================================="
read -p "Escolha uma opção (1-11): " OPCAO
echo "----------------------------------------"

# Mapeia o nome do script correspondente
SCRIPT_NAME=""
case $OPCAO in
    1) SCRIPT_NAME="setup" ;;
    2) SCRIPT_NAME="rodarCargoWatch" ;;
    3) SCRIPT_NAME="format" ;;
    4) SCRIPT_NAME="check" ;;
    5) SCRIPT_NAME="watch-tests" ;;
    6) SCRIPT_NAME="generate-docs" ;;
    7) SCRIPT_NAME="audit-deps" ;;
    8) SCRIPT_NAME="build-release" ;;
    9) SCRIPT_NAME="debug" ;;
   10) SCRIPT_NAME="leak-check" ;;
   11) SCRIPT_NAME="profile" ;;
    *) echo "❌ Opção inválida!"; exit 1 ;;
esac
# 3. Execução Direcionada
# 3. Execução Direcionada
if [ "$OS_TYPE" == "windows" ]; then
    # Ajuste específico apenas para o nome do arquivo de setup do Windows
    if [ "$OPCAO" -eq 1 ]; then 
        SCRIPT_NAME="setup-win"
    fi
    
    # Executa o script .sh direto no Git Bash, sem PowerShell!
    chmod +x "./scripts/windows/${SCRIPT_NAME}.sh"
    ./scripts/windows/${SCRIPT_NAME}.sh
else
    chmod +x "./scripts/linux/${SCRIPT_NAME}.sh"
    ./scripts/linux/${SCRIPT_NAME}.sh
fi