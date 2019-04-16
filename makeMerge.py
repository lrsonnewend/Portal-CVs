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

#vetores para armazenar dados complementares
#Ritter & Kolb
t1 = []
t2 = []
mag = []
orbPer = []
dist = []
perc1 = []
perc2 = []


#vetores auxiliares
auxRK = []
auxDS = []
aux = []
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
c = 0

for j in range(len(nomesRK)):
    for i in range(len(nomesDS)):
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
                                    raRK[j] = ' '.join(raRK[j])
                                    decRK[j] = ' '.join(decRK[j])
                                    auxRK[j] = ',  '.join(auxRK[j])
                                    raDS[i] = ' '.join(raDS[i])
                                    decDS[i]= ' '.join(decDS[i])
                                    auxDS[i] = ',  '.join(auxDS[i])
                                    
                                    print('{:<}{:<2}{:>10}{:>2}'.format('nomeRK:',f'{nomesRK[j]}','RA: ',f'{raRK[j]}','DEC:',f'{decRK[j]}'))
                                    print('{:<}{:<2}{:>10}{:>5}'.format('nomeDS:',f'{nomesDS[i]}','RA: ',f'{raDS[i]}','DEC:',f'{decDS[i]}'))
                                    print('\n')

                                    
                                    
                                    results = (str(nomesRK[j])+',  '+str(raRK[j])+',  '+str(decRK[j])+',  '+str(auxRK[j])
                                               +',  '+str(nomesDS[i])+',  '+str(raDS[i])+',  '+str(decDS[i])+',  '+str(auxDS[i]))
                                    
                                    
                                    
                                    resultados.append(results)

                                '''else:
                                    c+=1
                                    raRK[j] = ' '.join(raRK[j])
                                    decRK[j] = ' '.join(decRK[j])
                                    raDS[i] = ' '.join(raDS[i])
                                    decDS[i]= ' '.join(decDS[i])
                                    auxDS[i] = ',  '.join(auxDS[i])
                                    
                                    results = (str(nomesRK[j])+',  '+str(raRK[j])+',  '+str(decRK[j])+',  '+str(t1[j])+',  '+str(t2[j])+',  '+str(mag[j])+',  '+str(orbPer[j])+',  '
                                               +str(dist[j])+',  '+str(perc1[j])+',  '+str(perc2[j])+',  '+str(nomesDS[i])+',  '+str(raDS[i])+',  '+str(decDS[i])+',  '+str(auxDS[i]))
                                    
                                    
                                    auxRK.append(results)'''
                                    
        

                                    
#print(len(nomesRK))
#print(len(raRK))
#print(len(decRK))
                                    
'''for k in resultados:
    print (k+'\n')'''


print(f'\nquantidade de objetos em comum: {r}')
print(f'\nobjetos incomuns: {c}')
