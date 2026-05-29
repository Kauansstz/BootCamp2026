#!/bin/bash
cd "$(dirname "$0")/../.."

echo "🛡️ Verificando vulnerabilidades de segurança (Cargo Audit)..."
if ! command -v cargo-audit &> /dev/null; then
    echo "Instalando cargo-audit..."
    cargo install cargo-audit
fi
cargo audit

echo -e "\n🔄 Verificando dependências desatualizadas..."
if ! command -v cargo-outdated &> /dev/null; then
    echo "Instalando cargo-outdated..."
    cargo install cargo-outdated
fi
cargo outdated

echo -e "\n📊 Análise de dependências concluída!"