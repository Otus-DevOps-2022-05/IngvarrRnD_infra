# IngvarrRnD_infra
IngvarrRnD Infra repository

# ДЗ 3
# Самостоятельное задание + доп. задание по bastion

# bastion_IP = 51.250.10.227
# someinternalhost_IP = 10.128.0.5

В файл /.ssh/config вносим (для unix систем в IdentityFile будет путь /home/username/.ssh)

Host PublicServer
        Hostname 51.250.10.227
        User appuser
        IdentityFile C:\Users\Igor\.ssh\yandex_cloud_p_key.ppk

Host someinternalhost
        Hostname 10.128.0.5

Host someinternalhost* 10.128.0.*
        Hostname %h
        User appuser
        #Compression yes
        #ForwardX11 no
        IdentityFile C:\Users\Igor\.ssh\yandex_cloud_p_key.ppk
        ProxyCommand ssh -W %h:%p PublicServer

# Демонстрация рез-та:

# Коннект с локальной машины по внутреннему IP someinternalhost

C:\Users\Igor\.ssh>ssh 10.128.0.5
The authenticity of host '51.250.10.227 (51.250.10.227)' can't be established.
ECDSA key fingerprint is SHA256:yP8VI/sNuPSPoelFCyqwpHTcUaw8fd80sd/lIx1bP+4.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
Warning: Permanently added '51.250.10.227' (ECDSA) to the list of known hosts.
Enter passphrase for key 'C:\Users\Igor\.ssh\yandex_cloud_p_key.ppk':
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.4.0-117-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Mon Jun 20 17:17:07 2022 from 10.128.0.12
appuser@someinternalhost:~$ logout
Connection to 10.128.0.5 closed.

# Коннект с локальной машины до someinternalhost по его имени:

C:\Users\Igor\.ssh>ssh someinternalhost
Enter passphrase for key 'C:\Users\Igor\.ssh\yandex_cloud_p_key.ppk':
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.4.0-117-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Mon Jun 20 19:23:43 2022 from 10.128.0.12
appuser@someinternalhost:~$ logout
Connection to 10.128.0.5 closed.