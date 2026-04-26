# Bashrc Termux - Estilo Kali Linux

Bashrc personalizado para Termux com tema visual do Kali Linux, aliases uteis e funcoes avancadas.

## Funcionalidades

### Prompt Visual
- Usuario normal: verde com formato ┌──(user@host)-(~/pasta)
- Root: vermelho com formato ┌──(root@host)-(~/pasta)
- Exibe branch do Git automaticamente
- Titulo da janela personalizado

### Aliases de Navegacao
- .. - Sobe um nivel
- ... - Sobe dois niveis
- .... - Sobe tres niveis
- back - Volta para pasta anterior
- home - Vai para home

### Aliases de Listagem
- ll - Lista detalhado
- la - Lista incluindo ocultos
- lh - Lista com tamanho legivel
- lt - Lista ordenado por data
- l. - Lista apenas ocultos

### Aliases de Sistema
- update - Atualiza todos os pacotes
- install - Instala pacotes
- search - Busca pacotes
- clean - Limpa cache
- sys - Informacoes do sistema
- ports - Mostra portas abertas
- allports - Mostra todas as conexoes

### Funcoes Avancadas
- mkexec - Cria script executavel
- backup-home - Backup da sua home
- topcmds - Mostra comandos mais usados
- usage - Analise de espaco em disco

### Aliases de Rede
- myip - IP publico
- localip - IP local
- connections - Conexoes ativas

### Seguranca
- chmod e chown com protecao --preserve-root
- rm, cp, mv com confirmacao (-i)

## Instalacao

```bash
# Clone o repositorio
git clone https://github.com/seu-usuario/bashrc-termux.git

# Copie para sua home
cp bashrc-termux/.bashrc ~/

# Recarregue
source ~/.bashrc
