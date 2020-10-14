#!/bin/bash
#########################variaveis necessárias#####################################
# $source : pasta de origem,podem ser multiplas separadas por espaço entre aspas ##
##### ex: source="/media/user/folder1 /media/user/folder2"    #####################
### $dest : pasta de destino,até o momento apenas uma pasta é suportada ###########
################## ex: dest=/media/user/backup  ###################################
### $log : arquivo de log de saida,se estiver vazio não gera log ##################
###################### ex: log="$HOME/LOG/BACKUP" #################################
###################################################################################

if [ -z ${var+x} ]; then execute_log="--log-file=$log_output";else execute_log="";fi 

regex_image_video=".*\.\(gif\|jpe?g\|tiff?\|png\|webp\|bmp\|jpg\|mov\|avi\|wmv\|flv\|rmvb\|3gp\|mp4\|mpg\|mpeg\|mkv\|webm\|flv\|vob\|ogg\|ogv\|drc\|gifv\|mng\|avi\|mov\|qt\|wmv\|yuv\|rm\|rmvb\|asf\|amv\|mp4\|m4v\|m\?v\|svi\|3gp\|flv\|f4v\)"
## copia todos os formatos de foto e video descobertos até o momento , da pasta origem e seus subdiretórios,para a pasta destino,SEM HIERARQUIA DE DIRETÓRIOS
sudo find $source -regex $regex_image_video -type f -exec sudo rsync $execute_log -bairu --compress-level=9 {} $dest  \;

## copia todos os formatos de foto e video descobertos até o momento , da pasta origem e seus subdiretórios,para a pasta destino,COM HIERARQUIA DE DIRETÓRIOS
 sudo rsync $execute_log -airu --compress-level=9 --files-from=<(sudo find $source -regex $regex_image_video -type f -exec echo {} \;) / $dest  \;
