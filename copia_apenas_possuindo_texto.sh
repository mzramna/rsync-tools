#!/bin/bash
#########################variaveis necessárias#####################################
# $source : pasta de origem,podem ser multiplas separadas por espaço entre aspas ##
##### ex: source="/media/user/folder1 /media/user/folder2"    #####################
### $dest : pasta de destino,até o momento apenas uma pasta é suportada ###########
################## ex: dest=/media/user/backup  ###################################
### $log : arquivo de log de saida,se estiver vazio não gera log ##################
###################### ex: log="$HOME/LOG/BACKUP" #################################
### $include : texto que deve existir no titulo do arquivo que sera copiado #######
#################### ex: include="*file*" #########################################
#### observação: suporta expressão regular ########################################
###################################################################################

#########executar,necessário para o funcionamento do sistema de logs ##############

if [ -z ${var+x} ]; then execute_log="--log-file=$log_output";else execute_log="";fi 

rsync --compress-level=9 -airu --exclude="*" --include="$include" $source $dest $execute_log
