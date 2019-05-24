import pandas as pd
import numpy as np 
import csv

nomes = []
coordRArk = []
coordDECrk = []
coordRAds = []
coordDECds = []

#abrindo arquivos CSV
leituraObjetos = open('Lucas.csv')


#variáveis readerDS e readerRK fazem a leitura dos arquivos CSV's
leitor = csv.reader(leituraObjetos)


            
for k in leitor:
    k[0] = k[0].strip()

    k[1] = k[1].strip()
    k[1] = k[1].split()

    k[2] = k[2].strip()
    k[2] = k[2].split()

    k[4] = k[4].strip()
    k[4] = k[4].split()

    k[5] = k[5].strip()
    k[5] = k[5].split()

    nomes.append(k[0])
    coordRArk.append(k[1])
    coordDECrk.append(k[2])
    coordRAds.append(k[4])
    coordDECds.append(k[5])



maiorRA = 0
maiorDEC = 0

print('OBJETOS COM NOMES IGUAIS E COORDENADAS DIFERENTES:')
for i in range(len(nomes)):

    tempRK = coordRArk[i]
    tempDS = coordRAds[i]

    temporRK = coordDECrk[i]
    temporDS = coordDECds[i]

    if temporRK[0] != temporDS[0] or temporRK[1] != temporDS[1]:
        print(f'diferença encontrada em declinação\n{nomes[i]}\n\tRA_RK{coordRArk[i]}\tDEC_RK{coordDECrk[i]}\n\tRA_DS{coordRAds[i]}\tDEC_DS{coordDECds[i]}\n')

    if tempRK[0] != tempDS[0] or tempRK[1] != tempDS[1]:
        print(f'diferença encontrada em ascenção reta\n{nomes[i]}\n\tRA_RK{coordRArk[i]}\tDEC_RK{coordDECrk[i]}\n\tRA_DS{coordRAds[i]}\tDEC_DS{coordDECds[i]}\n')

print('\n\n\n\n')

maiorRA = 0
maiorDEC = 0
print('MAIOR DIFERENÇA EM RA:')
for i in range(len(nomes)):
    tempRK = coordRArk[i]
    tempDS = coordRAds[i]


    if tempRK[0] == tempDS[0] and tempRK[1] == tempDS[1]:
        valorRA = abs(float(tempRK[2]) - float(tempDS[2]))

        if valorRA > maiorRA:
            maiorRA = valorRA
            print(f'{nomes[i]}\n\tRA_RK{coordRArk[i]}\tDEC_RK{coordDECrk[i]}\n\tRA_DS{coordRAds[i]}\tDEC_DS{coordDECds[i]}')
            print(f'maior diferença: {maiorRA}\n')

print('\n\n\n\n')

print('MAIOR DIFERENÇA EM DEC:')
for i in range(len(nomes)):
    temporDS = coordDECds[i]
    temporRK = coordDECrk[i]


    if temporRK[0] == temporDS[0] and temporRK[1] == temporDS[1]:
        valorDEC = abs(float(temporRK[2]) - float(temporDS[2]))
        
        if valorDEC > maiorDEC:
            maiorDEC = valorDEC
            print(f'{nomes[i]}\n\tRA_RK{coordRArk[i]}\tDEC_RK{coordDECrk[i]}\n\tRA_DS{coordRAds[i]}\tDEC_DS{coordDECds[i]}')
            print(f'maior diferença: {maiorDEC}\n')

        
        





    
'''equalsCatalog = open('Lucas.csv')   

readerCat = csv.reader(equalsCatalog)

raRK.remove(raRK[0])
raDS.remove(raDS[0])
nomesRK.remove(nomesRK[0])
nomesDS.remove(nomesDS[0])
decRK.remove(decRK[0])
decDS.remove(decDS[0])

for k in readerCat:
    equalsRK.append(k[1].strip())
    equalsDS.append(k[11].strip())'''
    
