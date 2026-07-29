#!/usr/bin/env bash
set -euo pipefail

printf '\033[36mConfigurador do README animado - Nicholas Gil\033[0m\n'
read -r -p "Seu usuario exato no GitHub: " username
read -r -p "URL completa do LinkedIn (ou deixe vazio): " linkedin
read -r -p "URL completa do Instagram (ou deixe vazio): " instagram
read -r -p "Seu e-mail publico (ou deixe vazio): " email

if [[ -z "$username" ]]; then
  echo "O usuario do GitHub e obrigatorio." >&2
  exit 1
fi

linkedin="${linkedin:-https://github.com/$username}"
instagram="${instagram:-https://github.com/$username}"
email="${email:-contato@example.com}"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

find "$ROOT" -type f \( -name '*.md' -o -name '*.yml' -o -name '*.yaml' -o -name '*.svg' -o -name '*.sh' -o -name '*.ps1' \) -print0 |
while IFS= read -r -d '' file; do
  python3 - "$file" "$username" "$linkedin" "$instagram" "$email" <<'PY2'
from pathlib import Path
import sys
p = Path(sys.argv[1])
repl = {
    "SEU_USUARIO_GITHUB": sys.argv[2],
    "SEU_LINKEDIN": sys.argv[3],
    "SEU_INSTAGRAM": sys.argv[4],
    "SEU_EMAIL": sys.argv[5],
}
text = p.read_text(encoding="utf-8")
for old, new in repl.items():
    text = text.replace(old, new)
p.write_text(text, encoding="utf-8")
PY2
done

printf '\033[32mConfiguracao concluida.\033[0m\n'
echo "Agora copie os arquivos para o repositorio $username/$username e envie para a branch main."
