# Bashrc Termux - Estilo Kali Linux

Bashrc personalizado para Termux com tema visual do Kali Linux, aliases úteis e funções avançadas.

## Funcionalidades

### Prompt Visual
- Usuário normal: verde com formato `┌──(user@host)-(~/pasta)`
- Root: vermelho com formato `┌──(root@host)-(~/pasta)`
- Exibe branch do Git automaticamente
- Título da janela personalizado

### Aliases de Navegação
- `..` - Sobe um nível
- `...` - Sobe dois níveis
- `....` - Sobe três níveis
- `back` - Volta para pasta anterior
- `home` - Vai para home

### Aliases de Listagem
- `ll` - Lista detalhado
- `la` - Lista incluindo ocultos
- `lh` - Lista com tamanho legível
- `lt` - Lista ordenado por data
- `l.` - Lista apenas ocultos

### Aliases de Sistema
- `update` - Atualiza todos os pacotes
- `install` - Instala pacotes
- `search` - Busca pacotes
- `clean` - Limpa cache
- `sys` - Informações do sistema
- `ports` - Mostra portas abertas
- `allports` - Mostra todas as conexões

### Funções Avançadas
- `mkexec` - Cria script executável
- `backup-home` - Backup da sua home
- `topcmds` - Mostra comandos mais usados
- `usage` - Análise de espaço em disco

### Aliases de Rede
- `myip` - IP público
- `localip` - IP local
- `connections` - Conexões ativas

### Segurança
- `chmod` e `chown` com proteção `--preserve-root`
- `rm`, `cp`, `mv` com confirmação (`-i`)

## Instalação

```bash
# Clone o repositório
git clone https://github.com/Kaique071sx/bashrc-termux.git

# Copie para sua home
cp bashrc-termux/.bashrc ~/

# Recarregue
source ~/.bashrc
