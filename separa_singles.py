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
auxRK = []
auxDS = []
difRK = []
difDS = []
equalsRK = []
equalsDS = []
noEqualsRK = []
noEqualsDS = []
resultados = []

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
    #i[1] = i[1].split()
    raRK.append(i[1])

    i[2] = i[2].strip()
    #i[2] = i[2].split()
    decRK.append(i[2])

    auxRK.append(i[3:])
    

for k in readerDS:
    k[0] = k[0].strip()
    #k[0] = k[0].replace(' ', '')
    nomesDS.append(k[0])

    k[1] = k[1].strip()
    k[1] = k[1].replace(':', ' ')
    #k[1] = k[1].split()
    raDS.append(k[1])

    k[2] = k[2].strip()
    k[2] = k[2].replace(':', ' ')
    #k[2] = k[2].split()
    decDS.append(k[2])

    auxDS.append(k[3:])


#removendo headers e colunas sem informações
raRK.remove(raRK[0])
nomesRK.remove(nomesRK[0])
decRK.remove(decRK[0])

raDS.remove(raDS[1])
raDS.remove(raDS[0])


nomesDS.remove(nomesDS[1])
nomesDS.remove(nomesDS[0])


decDS.remove(decDS[1])
decDS.remove(decDS[0])

auxDS.remove(auxDS[1])
auxDS.remove(auxDS[0])

equalsCatalog = open('objects_novaConferencia.csv')   

readerCat = csv.reader(equalsCatalog)

nomeIguaisRK = []
nomeIguaisDS = []
equalsRK = []
equalsDS = []


for k in readerCat:
    nomeIguaisRK.append(k[0].strip())
    nomeIguaisDS.append(k[3].strip())
    equalsRK.append(k[1].strip())
    equalsDS.append(k[4].strip())

s1 = 0
s2 = 0

for i in range(len(raDS)):
    if raDS[i] not in equalsDS:
        auxDS[i] = ', '.join(auxDS[i])
        s1 +=1
        print(f'{nomesDS[i]}, {raDS[i]}, {decDS[i]}, {auxDS[i]}')

print('\n\n')

for i in range(len(raRK)):
    if raRK[i] not in equalsRK:
        auxRK[i] =', '.join(auxRK[i])
        s2+=1
        #print(f'{nomesRK[i]}, {raRK[i]}, {decRK[i]}, {auxRK[i]}')
    

print(f'solteiros DS {s1}\nsolteiros RK {s2}')




    
