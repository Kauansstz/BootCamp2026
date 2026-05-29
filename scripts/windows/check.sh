#!/bin/bash
cd "$(dirname "$0")/../.."
echo -e "\n\033[1;36m✨ Formatando o código automaticamente...\033[0m"
cargo fmt
echo -e "\n\033[1;33m🔍 Rodando Clippy (Linter)...\033[0m"
cargo clippy -- -D warnings
echo -e "\n\033[1;35m🧪 Executando os testes unitários...\033[0m\n"
cargo test