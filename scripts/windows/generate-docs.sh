#!/bin/bash
cd "$(dirname "$0")/../.."
echo -e "\n\033[1;36m📚 Gerando documentação local do projeto...\033[0m"
cargo doc --no-deps --open
echo -e "\033[1;32m✅ Documentação aberta no navegador!\033[0m\n"