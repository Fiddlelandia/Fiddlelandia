# Instalação do README de perfil

## 1. Crie o repositório de perfil

No GitHub, crie um repositório **público** com o mesmo nome exato do seu usuário.

Exemplo: se seu usuário for `nicholasgil`, o repositório deverá ser:

```text
nicholasgil/nicholasgil
```

## 2. Personalize automaticamente

### Windows

Abra o PowerShell dentro desta pasta e execute:

```powershell
powershell -ExecutionPolicy Bypass -File .\configurar.ps1
```

### Linux ou macOS

```bash
chmod +x configurar.sh
./configurar.sh
```

Os scripts substituem:

- `SEU_USUARIO_GITHUB`
- `SEU_LINKEDIN`
- `SEU_INSTAGRAM`
- `SEU_EMAIL`

## 3. Envie os arquivos ao GitHub

Copie tudo para a raiz do repositório de perfil e faça commit na branch `main`.

```bash
git add .
git commit -m "feat: create animated profile README"
git push origin main
```

## 4. Ative a cobra animada

1. Abra a aba **Actions** do repositório.
2. Ative os workflows, caso o GitHub solicite.
3. Abra **Generate contribution snake**.
4. Clique em **Run workflow**.
5. Aguarde a criação da branch `output`.

Depois disso, a animação também será atualizada automaticamente a cada 12 horas.

## Observações

- As animações principais ficam nos SVGs dentro de `assets/`.
- Os cards de estatísticas dependem de serviços externos e podem sofrer indisponibilidade temporária.
- Caso os cards públicos do GitHub Readme Stats fiquem instáveis, considere gerar os cards por GitHub Actions ou hospedar uma instância própria.
- Edite os textos diretamente no `README.md` quando quiser alterar apresentação, projetos ou tecnologias.
