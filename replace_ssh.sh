#!/bin/bash

#每年要替换一次ssl证书， 有多台机器， 手动替换太麻烦了，写了这个简单的脚本。
#思路： 1.首先把证书放到某台机器上，用wget可以下载。   2.进入放证书的地址，下载证书 3.进入nginx的配置文件，将配置文件中老证书名替换为新证书名，  4. 重启nginx.

cd "/nginx/cert/" || exit
wget "xx/2024ssl.pem"
wget "xx/2024ssl.key"

cd "/nginx/conf/vhosts/"



find ./ -type f -exec sed -i.bak 's/2023ssl.pem/2024ssl.pem/g' {} +
find ./ -type f -exec sed -i.bak 's/2023ssl.key/2024ssl.key/g' {} +

nginx -s reload
