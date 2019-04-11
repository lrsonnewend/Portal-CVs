'''
INFORMAÇÕES GERAIS DOS CATÁLOGOS:
    Versões:
       Downes & Shara: 02/2006 -> https://archive.stsci.edu/prepds/cvcat/
       Ritter & Kolb: 12/2015 (7.24) -> https://wwwmpa.mpa-garching.mpg.de/RKcat/

    Número de objetos:
       Downes & Shara: 1361
       Ritter & Kolb: 1831
'''   
        
import pandas as pd
import numpy as np 
import csv

#vetores para armazenar nomes dos objetos
nomesRK = []
nomesDS = []

#vetores para armazenar RA dos objetos
raRK = []
raDS = []

#vetores para armazenar DEC dos objetos
decRK = []
decDS = []

#vetores auxiliares
meuRA = []
meuVet = []
auxRK = []
auxDS = []
aux = []
#abrindo arquivos CSV's
leituraRK = open('RitKb.csv')
leituraDS = open('Downes.csv')


#variáveis readerDS e readerRK fazem a leitura dos arquivos CSV's
readerDS = csv.reader(leituraDS)
readerRK = csv.reader(leituraRK)

#deixando as tabelas ordenadas em ordem alfabética
#readerRK = sorted(readerRK)
#readerDS = sorted(readerDS)


#adicionando os dados em seus determinados vetores
for i in readerRK:
    i[0] = i[0].strip()
    #i[0] = i[0].replace(' ', '')
    nomesRK.append(i[0])

    i[1] = i[1].strip()
    i[1] = i[1].split()
    raRK.append(i[1])

    i[2] = i[2].strip()
    i[2] = i[2].split()
    decRK.append(i[2])
    

for k in readerDS:
    k[0] = k[0].strip()
    #k[0] = k[0].replace(' ', '')
    nomesDS.append(k[0])

    k[1] = k[1].strip()
    k[1] = k[1].replace(':', ' ')
    k[1] = k[1].split()
    raDS.append(k[1])

    k[2] = k[2].strip()
    k[2] = k[2].replace(':', ' ')
    k[2] = k[2].split()
    decDS.append(k[2])


    
r = 0

for i in range(len(nomesDS)):
    for j in range(len(nomesRK)):
        if(nomesDS[i] == nomesRK[j] or nomesDS[i] != nomesRK[j]):
            if len(raDS[i]) == 3:
                tempDS = raDS[i]
                tempRK = raRK[j]
                
                if(tempDS[0] == tempRK[0] and tempDS[1] == tempRK[1]):
                    if abs(float(tempDS[2]) - float(tempRK[2])) < 0.40:
                        
                        if(len(decDS[i]) == 3):
                            temporDS = decDS[i]
                            temporRK = decRK[j]
                            
                            if(temporDS[0] == temporRK[0] and temporDS[1] == temporDS[1]):
                                if abs(float(temporDS[2]) - float(temporRK[2])) < 5.00:
                                    r+=1
                                    print(f'nomeRK: {nomesRK[j]}   RA: {raRK[j]}   DEC: {decRK[j]}')
                                    print(f'nomeDS: {nomesDS[i]}   RA: {raDS[i]}   DEC: {decDS[i]}\n')


print(f'\nquantidade de objetos em comum: {r}')
                                    
                       
                          
'''
#fazendo comparação de RA's dos catálogos
for i in raDS:
    d+=1
    for k in raRK:
        r+=1
        if len(i) == 3:
            if(i[0] == k[0] and i[1] == k[1]):
                if abs(float(i[2]) - float(k[2])) < 0.40:
                    print(f'rk {k} posicao: {r}')
                    print(f'ds {i} posicao: {d}')'''

'''#fazendo comparação de DEC's dos catálogos
for i in decRK:
    r+=1
    for k in decDS:
        d+=1
        if len(k) == 3:
            if(i[0] == k[0] and i[1] == k[1]):
                if abs(float(i[2]) - float(k[2])) < 5.0:
                    print(f'rk {k} posição: {r}')
                    print(f'ds {i} posição: {d}')'''
            

'''#total de dados em cada vetor
print(len(nomesRK))
print(len(raRK))
print('\n')
print(len(nomesDS))
print(len(raDS))
print('\n')
print(f"RA's iguais identificados: {r}")
print(f"DEC's iguais identificados: {d}")'''













#outros métodos para o merger

'''for linhaRK in readerRK:
    
    #o vetor nomesRK adiciona os índices linhaRK na posição 0 (nome dos astros)
    nomesRK.append(linhaRK[0])

    #o vetor raRK adiciona os índices linhaRK na posição 1 (RA dos astros)
    raRK.append(linhaRK[1])

    #o vetor decRK adiciona os índices linhaRK na posição 2 (DEC dos astros)
    decRK.append(linhaRK[2])


for linhaDS in readerDS:

    #o vetor nomesDS adiciona os índices linhaDS na posição 0 (nome dos astros)
    nomesDS.append(linhaDS[0])

    #o vetor raDS adiciona os índices linhaDS na posição 1 (RA dos astros)
    raDS.append(linhaDS[1])

    #o vetor decDS adiciona os índices linhaDS na posição 2 (DEC dos astros)
    decDS.append(linhaDS[2])


#utilizando vetor auxiliar para receber os nomes dos astros de um catálogo
#(usando como base o catálogo Ritter e Kolb)
for i in nomesRK:

    #adicionando elementos
    meuVet.append(i)


#retirando espaços extras que contêm em algumas strings
for k in nomesDS:
    k = k.strip()
    k = k.split()


for j in nomesRK:
    j = j.strip()
    j = j.split()


for i in meuVet:
    i = i.strip()


#verifica se há semelhanças nos entre os nomes dos dois catálogos
#e adiciona aqueles que são em comuns e os que sobraram do catálogo
#downes e shara
for k in nomesDS:
    if not k in meuVet:
        meuVet.append(k)


#remove o cabeçalho das colunas de cada catálogo
meuVet.remove('Name')
nomesRK.remove('Name')
meuVet.remove('GCVS-Name')
nomesDS.remove('GCVS-Name')
raRK.remove('RAJ2000')
raDS.remove('RA(2000)')
decRK.remove('DEJ2000')
decDS.remove('Dec(2000)')

#imprimi os nomes comparados
for k in meuVet:
    print(k)

#imprime o tamanho dos vetores
print(len(meuVet))
print(len(raRK))
print(len(raDS))
print(len(decRK))
print(len(decDS))


#adicionando valores de RA Ritter e Kolb em um vetor auxiliar
for i in raRK:
    meuRA.append(i)


#fazendo a comparação entre RA's dos catálogos

#vetores auxiliares
auxiliarDS = []
auxiliarRK = []

#separando os valores do catálogo Downes e Shara e pegando o último elemento para fazer
#a comparação do valor absoluto entre os RA's dos catálogos
for k in raDS:
    #remove espaços extras nos dados
    k = str(k).strip()

    #substitui ':' por um espaço (' ')
    k = str(k).replace(':', ' ')

    #faz a separação dos valores
    k = str(k).split()

    #se o tamanho do RA for maior que 3, então adiciono a posição 2 convertida
    #em float desse valor no vetor auxiliar
    if len(k) == 3:
        auxiliarDS.append(float(k[2]))
        

#separando os valores do catálogo Downes e Shara e pegando o último elemento para fazer
#a comparação do valor absoluto entre os RA's dos catálogos
for k in raRK:
    #remove espaços extras nos dados
    k = str(k).strip()

    #faz a separação dos valores
    k = k.split()

    #adicionando posição 2 convertida em float do valor 
    auxiliarRK.append(float(k[2]))



#estrutura de repetição para fazer a comparação entre os valores de RA
#comparando a posição do número de ponto flutuante, a qual define se um
#RA é igual ou diferente ao outro
i = 0
for k in range(len(raDS)):
        
    if(i <= 1361):
        raDS[k] = str(raDS[k]).strip()
        raDS[k] = str(raDS[k]).replace(':', ' ')
        raDS[k] = str(raDS[k]).split()

        raRK[i] = str(raRK[i]).strip()
        raRK[i] = str(raRK[i]).split()
        #se o valor absoluto entre o valor do RA de um objeto Ritter e Kolb
        #e o valor do RA de um objeto Downes e Shara for menor que 0.4,
        #o vetor meuRA adiciona o RA de Ritter e Kolb na posição que foi
        #comparada
        
        print(raRK[2]+'      '+raDS[2])    
        if abs(auxiliarRK[i] - auxiliarDS[k]) < 0.40:
            meuRA.append(str(raRK[i]).strip())
            k = 0
            i+=1
        
            
    else:
        break


#mostra na tela os RA's comparados
for i in meuRA:
    print(i)


    

Esta é uma segunda formna de fazer o merge dos catálogos:
    faz a concatenação de todos os valores em uma string só, porém a manipulação ainda está em desenvolvimento.

#faz a concatenação dos elementos da tabela Ritter e Kolb em uma string só, separando-os em campos
for k in range(len(nomesRK)):
    nomesRK[k] = str(nomesRK[k]).split()
    raRK[k] = str(raRK[k]).split()
    decRK[k] = str(decRK[k]).split()
    auxRK.append(str(nomesRK[k])+str(raRK[k])+str(decRK[k]))


#faz a concatenação dos elementos da tabela Downes e Shara em uma string só, separando-os em campos
for i in range(len(nomesDS)):
    nomesDS[i] = str(nomesDS[i]).split()
    decDS[i] = str(decDS[i]).replace(':',' ')
    decDS[i] = str(decDS[i]).split()
    raDS[i] = str(raDS[i]).replace(':', ' ')   
    raDS[i] = str(raDS[i]).split()
    
    auxDS.append(str(nomesDS[i])+str(raDS[i])+str(decDS[i]))

#imprime os dados concatenados na tela
for i in auxRK:
    print(i)

for k in auxDS:
    print(k)

'''
