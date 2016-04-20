# Fortigate-backup
Backup da configuração do Fortigate

Editar o arquivo fortigate-backup.sh e mudar o usuário e senha

Exceutar:

./fortigate-backup.sh ip:portahttps nomedoarquivo


./fortigate-backup.sh 192.168.0.1:443 fortigate-empresa

Gera na pasta um arquivo fortigate-empresa-20-04-2016.conf

Para deixar automatico você coloca no contrab para executar 1x por dia ou 1x por semana
depende da quantidade de vezes que você muda a configuração, assim sempre o backup vai
estar atualizado.



https://br.linkedin.com/pub/diego-santos-maia/2b/b60/173
