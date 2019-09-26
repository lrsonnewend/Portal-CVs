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


#removendo headers e colunas sem informações
raRK.remove(raRK[0])
nomesRK.remove(nomesRK[0])
decRK.remove(decRK[0])
auxRK.remove(auxRK[0])

auxDS.remove(auxDS[1])
auxDS.remove(auxDS[0])
raDS.remove(raDS[1])
raDS.remove(raDS[0])
nomesDS.remove(nomesDS[1])
nomesDS.remove(nomesDS[0])
decDS.remove(decDS[1])
decDS.remove(decDS[0])



#bloco para capturar objetos com o mesmo nome e objetos com coordenadas dentro do critério
rN = 0
rC = 0
vetor = []
for j in range(len(nomesRK)):
    for i in range(len(nomesDS)):
        nomeTempRK = nomesRK[j].replace(' ','')
        nomeTempDS = nomesDS[i].replace(' ','')
        
        if(nomeTempDS == nomeTempRK):
            if len(raDS[i]) >=3 and len(decDS[i]) >= 3:
                #caso os objetos tenham o mesmo nome:
                rN+=1 #contador de objetos
                tempoRArk = ' '.join(raRK[j])#recebe o valor do RA formatado em espaço e sem ponto e vírgula (;)
                tempoDECrk = ' '.join(decRK[j])#recebe o valor do DEC formatado em espaço e sem ponto e vírgula (;)
                tempoAuxRK = ', '.join(auxRK[j])#junta as informações adicionais do objeto separando-as em vírgula (,)

                tempoRAds = ' '.join(raDS[i])#recebe o valor do RA formatado em espaço e sem ponto e vírgula (;)
                tempoDECds = ' '.join(decDS[i])#recebe o valor do DEC formatado em espaço e sem ponto e vírgula (;)
                tempoAuxDS = ', '.join(auxDS[i])#junta as informações adicionais do objeto separando-as em vírgula (,)
                #print(f'Objeto RK- pos {j} Objeto DS - pos {i}')

                #armazena em uma variável os dados necessários para montar o arquivo csv (catálogo)
                nomesRK[j].replace('  ', ' ')
                vetor.append(f'query id {nomesRK[j]}')
                      
                #passa para o próximo objeto

vetor = sorted(vetor)

for i in vetor:
    print(i)


'''for j in range(len(nomesRK)):
    for i in range(len(nomesDS)):
        nomeTempRK = nomesRK[j].replace(' ','')
        nomeTempDS = nomesDS[i].replace(' ','')
        
        if nomeTempDS != nomeTempRK:
            #caso os objetos tenham nomes diferentes:
            if len(raDS[i]) >= 3 and len(decDS[i]) >= 3:
                tempDS = raDS[i] #variável temporária recebe RA do objeto
                tempRK = raRK[j] #variável temporária recebe RA do objeto
                
                tempDrk = decRK[j] #variável temporária recebe DEC do objeto
                tempDds = decDS[i] #variável temporária recebe DEC do objeto
                
                ra_arcsecRK = 15*(3600.0*int(tempRK[0])+60.0*int(tempRK[1])+float(tempRK[2])) #transformando coordenada RA em segundos de arco (arcsec)
                
                ra_arcsecDS = 15*(3600.0*int(tempDS[0])+60.0*int(tempDS[1])+float(tempDS[2])) #transformando coordenada RA em segundos de arco (arcsec)

                dec_arcsecRK = 3600.0*int(tempDrk[0])+60.0*int(tempDrk[1])+float(tempDrk[2]) #transformando coordenada DEC em segundos de arco (arcsec)
                
                dec_arcsecDS = 3600.0*int(tempDds[0])+60.0*int(tempDds[1])+float(tempDds[2]) #transformando coordenada DEC em segundos de arco (arcsec)
                
                #subRA = float(ra_arcsecDS) - float(ra_arcsecRK)
                #subDEC = float(dec_arcsecDS) - float(dec_arcsecRK)
                
                if abs(ra_arcsecRK - ra_arcsecDS) < 20 and abs(dec_arcsecRK - dec_arcsecDS) < 20: #caso a diferença seja menor do que 20 segundos de arco:
                    
                    rC+=1 #contador de objetos
                    tempoRArk = ' '.join(raRK[j]) #recebe o valor do RA formatado em espaço e sem ponto e vírgula (;)
                    tempoDECrk = ' '.join(decRK[j]) #recebe o valor do DEC formatado em espaço e sem ponto e vírgula (;)
                    tempoAuxRK = ', '.join(auxRK[j]) #junta as informações adicionais do objeto separando-as em vírgula (,)
                    
                    tempoRAds = ' '.join(raDS[i]) #recebe o valor do RA formatado em espaço e sem ponto e vírgula (;)
                    tempoDECds = ' '.join(decDS[i]) #recebe o valor do DEC formatado em espaço e sem ponto e vírgula (;)
                    tempoAuxDS = ', '.join(auxDS[i]) #junta as informações adicionais do objeto separando-as em vírgula (,)                                    

                    #print(f'Objeto RK- pos {j} Objeto DS - pos {i}')
                    
                    #armazena em uma variável os dados necessários para montar o arquivo csv (catálogo)
                    #print(f'{nomesRK[j]}, {tempoRArk}, {tempoDECrk}, {tempoAuxRK}, {nomesDS[i]}, {tempoRAds}, {tempoDECds}, {tempoAuxDS}, 0,, http://simbad.u-strasbg.fr/simbad/sim-coo?Coord={tempoRAds}++{tempoDECds}&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=')
                                        
                    #passa para o próximo objeto
                    break
                    
             
print(f'\nquantidade de objetos com o mesmo nome: {rN}')
print(f'\nquantidade de objetos dentro do critério de coordenada: {rC}')
print(f'\nTotal: {rN+rC}')'''


    

