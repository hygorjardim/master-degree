# master-degree
Códigos das disciplinas do mestrado

## Algumas erros comuns em Linux

```
ERRO /bin/bash^M interpretador inválido: Arquivo ou diretório inexistente
```
Erro ao exercutar um script bash com sintax e semânica aparentemente correta, isso se deve ao transportar um código om caracteres que são nativamente utilizados no ambiente Windows para o Linux.

Há duas opções para solucionar:
1) Em um editor de textos, mande substituir todos os ^M por somente \n
2) Instale o pacote tofrodos e digite o comando para transformá-lo para o unix:

INSTALAÇÃO:
```bash
$ sudo apt-get install tofrodos
```
Logo depois 
```bash
$ dos2unix arquivo_script.sh
```

