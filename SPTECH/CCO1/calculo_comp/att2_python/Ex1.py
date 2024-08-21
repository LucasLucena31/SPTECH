play = 0

while play == 0:
    peso = float(input('Quanto você pesa em Kg? (kg) '))
    altura = float(input('Quanto você mede em altura? (m)'))
    IMC = peso/(altura**2)
    print('O seu IMC é de {:.1f}'.format(IMC))
    escolha=int(input('Deseja continuar? \n 1 - Sim \n 2 - Não \n'))
    if escolha == 2:
        play = 1
