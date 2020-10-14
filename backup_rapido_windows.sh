#!/bin/bash
############################################################################################################
############ o disco do windows deve ser reiniciado e antes de iniciar novamente                           #
############ deve ser removido da maquina que o backup será feito e montado na maquina que fará o backup   #
############ ou um live pendrive deve ser executado antes do boot ser feito no windows                     #
############################################################################################################
############ esse procedimento faz com que o hd windows possa ser reescrito pelo sistema linux             #
############ isso é necessário para que  os arquivos possam ser removidos a medida que o backup ocorre     #
############ isso acelera a velocidade do backup                                                           #
############################################################################################################


################################variaveis##############################################
#### $mount_point: ponto onde o hd windows foi montado no sistema linux ###############
#### não pode ser terminado com o caractere "/" isso irá atrapalhar o funcionamento ### 
################# ex: mount_point=/media/ubuntu/hd_windows ############################
### $dest : pasta de destino,até o momento apenas uma pasta é suportada ###############
#### não pode ser terminado com o caractere "/" isso irá atrapalhar o funcionamento ### 
################## ex: dest=/media/user/backup  #######################################
### $log : arquivo de log de saida,se estiver vazio não gera log ######################
###################### ex: log="$HOME/LOG/BACKUP" #####################################
#######################################################################################

#########executar,necessário para o funcionamento do sistema de logs ##################
if [ -z ${var+x} ]; then execute_log="--log-file=$log_output";else execute_log="";fi 

rsync -airu --compress-level=9 -- remove-source-files --no-links $mount_point/Windows.old*/Users/ $mount_point/Users/ $dest/backup/ --exclude=AppData --exclude=NTUSER $execute_log
