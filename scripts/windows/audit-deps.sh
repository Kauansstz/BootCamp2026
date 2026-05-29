#!/bin/bash
cd "$(dirname "$0")/../.."

echo -e "\n\033[1;33m🛡️  Verificando vulnerabilidades (Cargo Audit)...\033[0m"

# Verifica se o cargo-audit está instalado. Se não estiver, instala automaticamente.
if ! command -v cargo-audit &> /dev/null && ! cargo --list | grep -q "audit"; then
    echo "📥 cargo-audit não encontrado. Instalando ferramenta de segurança..."
    cargo install cargo-audit
fi

cargo audit