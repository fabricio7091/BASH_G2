#!/bin/bash
#
# Script com funções variadas utilizando o comando rsync e scp
#
# Escrito por Fabrício da Silva Neves para a disciplina de Shell Script



principal() {                    # Função principal do programa
    clear                        # limpa a tela
    echo "[1] Rsync"             # imprime na tela as opções 
    echo "[2] SCP"               
    echo "[3] Sair"                                                                                                    
    echo
    echo -n "Qual a opcao desejada ? "
    read opcao          		# faz a leitura da variável "opcao", 
                        		# caso o valor da variável "opcao"...
    case $opcao in
        1)              		
            clear
            fun_1 ;;    		# executa os comandos da função "fun_1" e finaliza a opção do case com ";;"
        		
        2)
            clear
            fun_2 ;;	                # executa os comandos da função "fun_2" e finaliza a opção do case com ";;" 

        3)
            clear
            exit ;;

        *)              	# esta opçao existe para caso o usuário digite um 
                        	# valor diferente de 1, 2, 3.
            clear
            echo "Opcao desconhecida."
            read pause
            principal   	# volta para o menu inicial
            ;;
    esac
}


fun_1() {             					           # função fun_1 entra no case
    clear               					   # limpa a tela
    echo "[1] Copia de pasta local Utilizando o Rsync"             # imprime na tela as opções que serão abordadas
    echo "[2] Copia da pasta com SSH Utilizando o Rsync"              
    echo "[3] Copia da arquivo com SSH Utilizando o Rsync" 
    echo "[4] Copia de arquivo local Utilizando o Rsync"                       
    echo "[5] Sair"                                                                     
    echo
    echo -n "Qual a opcao desejada ? "
    read opcao1          		# faz a leitura da variável "opcao", 
                        		
                        		
    case $opcao1 in
        1)              		# seja igual a "1", então faça as instruções abaixo
            clear
            fun_R1 ;;   # usa a função fun_R1 e finaliza a opção do case com ";;"		
                        		
        2)
            clear
            fun_R2 ;;	# usa a função fun_R2 e finaliza a opção do case com ";;"
        
        3)
            clear
            fun_R3 ;;	# usa a função fun_R3 e finaliza a opção do case com ";;"

        4)
            clear
            fun_R4 ;;	# usa a função fun_R4 e finaliza a opção do case com ";;"
        
        5)
            clear
            exit ;;

        *)              	# esta opçao existe para caso o usuário digite um 
                        	# valor diferente de 1, 2, 3, ... 12
            clear
            echo "Opcao desconhecida."
            read pause
            principal   	# volta para o menu inicial
            ;;
    esac
}
    
fun_2() {             					# função da opção 5
    clear                                               # limpa a tela
    echo "[1] Copia de arquivo no mesmo local utilizando SCP"            # imprime na tela as opções que serão
    echo "[2] Copia de arquivo remota utilizando SCP"             # abordadas no comando case 
    echo "[3] Copia de pasta local utilizando SCP"            # imprime na tela as opções que serão
    echo "[4] Copia de pasta remota utilizando SCP"             # abordadas no comando case                            
    echo "[5] Sair"                                                                     
    echo
    echo -n "Qual a opcao desejada ? "
    read opcao2          		# faz a leitura da variável "opcao", 
                        		     		
                        		
    case $opcao2 in
        1)              		
            clear
            fun_S1 ;;    		# usa a função fun_S1 e finaliza a opção do case com ";;"

                        		
        2)
            clear
            fun_S2 ;;	                # usa a função fun_S2 e finaliza a opção do case com ";;"
       
        3)              		
            clear
            fun_S3 ;;    		# usa a função fun_S3 e finaliza a opção do case com ";;"

                        		
        4)
            clear
            fun_S4 ;;			# usa a função fun_S4 e finaliza a opção do case com ";;"

       
        5)
            clear
            exit ;;

        *)              	# esta opçao existe para caso o usuário digite um 
                        	# valor diferente de 1, 2, 3, 4, 5.
            clear
            echo "Opcao desconhecida."
            read pause
            principal   	# volta para o menu inicial
            ;;
    esac
}
    
fun_R1() {             					# função da opção fun_R1 copia de arquivos com rsync apenas local
    clear
    echo "digite o diretorio quer copiar com o caminho lembrando de não colocar no final a barra /" 	# imprime a mensagem entre "" na tela		
    read dir_1;				        # captura a palavra digitada 
    echo "digite o caminho de destino"		# imprime a mensagem entre "" na tela
    read des_1;					# captura a palavra digitada
    rsync -avr --progress $dir_1 $des_1   	    
    read pause
    principal
}

fun_R4() {             					# função da opção fun_R4 copia de pastas com rsync apenas local
    clear
    echo "digite o diretorio quer copiar com o caminho lembrando de não colocar no final a barra /" # imprime a mensagem entre "" na tela			
    read dir_1;				       # captura a palavra digitada 
    echo "digite o caminho de destino"	       # imprime a mensagem entre "" na tela
    read des_1;				       # captura a palavra digitada 
    rsync -av --progress $dir_1 $des_1   	    
    read pause
    principal
}

fun_R2() {             					# função da opção fun_R2 copia de pastas com rsync apenas em redes
    clear
    echo "digite o diretorio quer copiar com o caminho lembrando de não colocar no final a barra /" 			
    read dir_2;				       # captura a palavra digitada 
    echo "digite o caminho de destino"		# imprime a mensagem entre "" na tela
    read des_2;					# captura a palavra digitada 
    echo "digite o usuário da maquina remoto"   # imprime a mensagem entre "" na tela
    read mac_1;					# captura a palavra digitada 
    echo "digite o ip da maquina remota "	# imprime a mensagem entre "" na tela	
    read ip_1;					# captura a palavra digitada 
    echo "digite a porta ssh"			# imprime a mensagem entre "" na tela
    read port_1;				# captura a palavra digitada 
    rsync -avr --progress $dir_2 -e "ssh -p$port_1" $mac_1@$ip_1:$des_2    	    
    read pause
    principal
}

fun_R3() {             					# função da opção fun_R3 copia de arquivos com rsync apenas em redes
    clear
    echo "digite o arquivo quer copiar com o caminho " 	# imprime a mensagem entre "" na tela		
    read arq_3;				       		# captura a palavra digitada
    echo "digite o caminho de destino"			# imprime a mensagem entre "" na tela
    read des_3;						# captura a palavra digitada
    echo "digite o usuário da maquina remoto"		# imprime a mensagem entre "" na tela
    read mac_3;						# captura a palavra digitada
    echo "digite o ip da maquina remota "		# imprime a mensagem entre "" na tela	
    read ip_3;						# captura a palavra digitada
    echo "digite a porta ssh"				# imprime a mensagem entre "" na tela
    read port_3;					# captura a palavra digitada
    rsync -av --progress $arq_3 -e "ssh -p$port_3" $mac_3@$ip_3:$des_3    	    
    read pause
    principal
}

fun_S1() {             					# função da opção fun_S1 copia de arquivos com scp apenas local
    clear
    echo "digite o arquivo quer copiar com o caminho " # imprime a mensagem entre "" na tela		
    read dir1;				               # captura a palavra digitada
    echo "digite o caminho de destino"		       # imprime a mensagem entre "" na tela
    read des1;					       # captura a palavra digitada
    scp  $dir1 $des1   	    
    read pause
    principal
}

fun_S2() {             					# função da opção fun_S2 copia de arquivos com scp apenas local
    clear
    echo "digite o arquivo quer copiar com o caminho " 	# imprime a mensagem entre "" na tela		
    read dir2;				       		# captura a palavra digitada
    echo "digite o caminho de destino"		        # imprime a mensagem entre "" na tela
    read des2;						# captura a palavra digitada
    echo "digite o usuário da maquina remoto"		# imprime a mensagem entre "" na tela
    read mac3;   					# captura a palavra digitada
    echo "digite o ip da maquina remota "		# imprime a mensagem entre "" na tela	
    read ip3;						# captura a palavra digitada
    echo "digite a porta ssh"				# imprime a mensagem entre "" na tela
    read port3;						# captura a palavra digitada
    scp  -P$port3  $dir2 $mac3@$ip3:$des2    	    
    read pause
    principal
}

fun_S3() {             					# função da opção fun_S3 copia de pastas com scp apenas local
    clear
    echo "digite o diretorio quer copiar com o caminho" # imprime a mensagem entre "" na tela			
    read dir5;				                # captura a palavra digitada
    echo "digite o caminho de destino"			# imprime a mensagem entre "" na tela
    read des5;						# captura a palavra digitada
    scp -r $dir5 $des5   	    
    read pause
    principal
}

fun_S4() {             					# função da opção fun_S4 copia de pastas com scp apenas local
    clear
    echo "digite o diretorio quer copiar com o caminho" # imprime a mensagem entre "" na tela			
    read dir4;				             	# captura a palavra digitada
    echo "digite o caminho de destino"			# imprime a mensagem entre "" na tela
    read des4;						# captura a palavra digitada
    echo "digite o usuário da maquina remoto"		# imprime a mensagem entre "" na tela
    read mac4;   					# captura a palavra digitada
    echo "digite o ip da maquina remota "		# imprime a mensagem entre "" na tela
    read ip4;						# captura a palavra digitada
    echo "digite a porta ssh"				# imprime a mensagem entre "" na tela
    read port4;						# captura a palavra digitada
    scp -r -P$port4  $dir4 $mac4@$ip4:$des4   
    read pause
    principal
}

opcao_invalida() {      # função da opção inválida3
    clear
    echo "Opcao desconhecida."
    read pause
    principal
}

principal               # o script começa aqui, as funções das linhas anteriores
                        # são lidas pelo interpretador bash e armazenadas em memória.

                        # o bash não tem como adivinhar qual das funções ele deve 
                        # executar, por isto a execução do script realmente começa
                        # quando aparece uma instrução fora de uma função, neste caso,
			# chamando a função principal
