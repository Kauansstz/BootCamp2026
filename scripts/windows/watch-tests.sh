#!/bin/bash
cd "$(dirname "$0")/../.."
echo -e "\n\033[1;35m🧪 Monitorando Testes em Tempo Real...\033[0m"
cargo watch -x test