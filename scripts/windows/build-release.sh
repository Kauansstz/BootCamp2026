#!/bin/bash
cd "$(dirname "$0")/../.."
echo -e "\n\033[1;31m🧹 Limpando compilações antigas...\033[0m"
cargo clean
echo -e "\n\033[1;32m⚙️  Compilando binário otimizado em modo Release...\033[0m\n"
cargo build --release