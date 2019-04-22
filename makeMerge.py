'''
INFORMAÇÕES GERAIS DOS CATÁLOGOS:
    Versões:
       Downes & Shara: 02/2006 -> https://archive.stsci.edu/prepds/cvcat/
       Ritter & Kolb: 12/2015 (7.24) -> https://wwwmpa.mpa-garching.mpg.de/RKcat/
    Número de objetos:
       Downes & Shara: 1361
       Ritter & Kolb: 1830
'''   
        
import pandas as pd
import numpy as np 
import csv
import tabulator

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
    i[1] = i[1].split()
    raRK.append(i[1])

    i[2] = i[2].strip()
    i[2] = i[2].split()
    decRK.append(i[2])

    auxRK.append(i[3:])
    

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

    auxDS.append(k[3:])





r = 0
for j in range(len(nomesRK)):
    for i in range(len(nomesDS)):
        if(nomesDS[i] == nomesRK[j] or nomesDS[i] != nomesRK[j]):
            if len(raDS[i]) == 3:
                tempDS = raDS[i]
                tempRK = raRK[j]
                
                if(tempDS[0] == tempRK[0] and tempDS[1] == tempRK[1]):
                    if len(raDS[i]) == 3:
                        if abs(float(tempDS[2]) - float(tempRK[2])) < 0.40:
                        
                            if(len(decDS[i]) == 3):
                                temporDS = decDS[i]
                                temporRK = decRK[j]
                            
                                if(temporDS[0] == temporRK[0] and temporDS[1] == temporDS[1]):
                                    if abs(float(temporDS[2]) - float(temporRK[2])) < 5.00:
                                        r+=1
                                        tempoRArk = ' '.join(raRK[j])
                                        tempoDECrk = ' '.join(decRK[j])
                                        tempoAuxRK = ',  '.join(auxRK[j])
                                        tempoRAds = ' '.join(raDS[i])
                                        tempoDECds = ' '.join(decDS[i])
                                        tempoAuxDS = ',  '.join(auxDS[i])
                                    
                                        '''print('nomeRK: ' +str(nomesRK[j])+'  nomeDS: '+str(nomesDS[i]))
                                        print('RArk: '+str(raRK[j])+'   DECrk: '+str(decRK[j]))
                                        print('RAds: '+str(raDS[i])+'  DECds: '+str(decDS[i]))
                                    
                                        print('\n')'''                                    

                                        #print(f'Objeto RK- pos {j} Objeto DS - pos {i}')
                                    
                                        results = (str(nomesRK[j])+',  '+str(tempoRArk)+',  '+str(tempoDECrk)+',  '+str(tempoAuxRK)
                                               +',  '+str(nomesDS[i])+',  '+str(tempoRAds)+',  '+str(tempoDECds)+',  '+str(tempoAuxDS))
                                                                        
                                    
                                        resultados.append(results)

                                        break                                        

        
                                    
        
equalsCatalog = open('Lucas.csv')   

readerCat = csv.reader(equalsCatalog)

raRK.remove(raRK[0])
raDS.remove(raDS[0])

for k in readerCat:
    equalsRK.append(k[1].strip())
    equalsDS.append(k[11].strip())    


rk = 0
ds = 0


cont = 0
    
for i in range(len(raRK)):
    raRK[i] = ' '.join(raRK[i])
    if not raRK[i] in equalsRK:
        decRK[i] = ' '.join(decRK[i])
        auxRK[i] = ',  '.join(auxRK[i])

        results = (str(nomesRK[i])+',  '+str(raRK[i])+',  '+str(decRK[i])+',  '+str(auxRK[i]))

        noEqualsRK.append(results)
        #print(f'{raRK[i]} não tem par')
        rk+=1
        
for j in range(len(raDS)):
    raDS[j] = ' '.join(raDS[j])
    cont +=1
    if cont >= 2:
        if not raDS[j] in equalsDS:
            decDS[j]= ' '.join(decDS[j])
            auxDS[j] = ',  '.join(auxDS[j])

            results = (str(nomesDS[j])+',  '+str(raDS[j])+',  '+str(decDS[j])+',  '+str(auxDS[j]))

            noEqualsDS.append(results)
            #print(f'{j} não tem par')
            ds+=1



print(f'\nquantidade de objetos em comum: {r}')

print(f'\nobjetos incomuns de Ritter & Kolb: {rk}')

print(f'\nobjetos incomuns de Downes & Shara: {ds}')
