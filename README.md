# master-degree
Códigos das disciplinas do mestrado

## Algumas erros comuns em Linux

ERRO /bin/bash^M AO EXECUTAR SCRIPT
Se aparecer algo do tipo '/bin/bash^M: interpretador inválido: Arquivo ou diretório inexistente' ao executar um script...

ERRO: /bin/bash^M (CONTROL+M no final)

Isso é típico de arquivo criado em Win e levado para o Linux.
Há duas opções:
1) Em um editor de textos, mande substituir todos os ^M por somente \n
2) Instale o pacote tofrodos e digite o comando para transformá-lo para o unix:
$ dos2unix arquivo_script

INSTALAÇÃO:
$ sudo apt-get install tofrodos
