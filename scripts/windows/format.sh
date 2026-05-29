#!/bin/bash
cd "$(dirname "$0")/../.."

echo -e "\n\033[1;36m✨ Formatando todo o código fonte do projeto...\033[0m"

# Executa o formatador oficial do Rust
cargo fmt

if [ $? -eq 0 ]; then
    echo -e "\033[1;32m✅ Código formatado com sucesso seguindo o padrão oficial Rust!\033[0m\n"
else
    echo -e "\033[1;31m❌ Falha ao tentar executar a formatação.\033[0m\n"
fi