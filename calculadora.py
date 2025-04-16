import numpy as np
import re

resultadoHalf = []
contResultado = 0
memoria = 0.0

class Pilha:
    def __init__(self, capacidade):
        self.capacidade = capacidade
        self.topo = -1
        self.valores = np.empty(self.capacidade, dtype=np.float32)

    def cheia(self):
        return self.topo == self.capacidade - 1
    
    def vazia(self):
        return self.topo == -1
    
    def empilhar(self, valor):
        if self.cheia():
            print('A pilha está cheia!')
        else:
            self.topo += 1
            self.valores[self.topo] = valor

    def desempilhar(self):
        if self.vazia():
            print('A pilha está vazia!')
            return None
        else:
            valor = self.valores[self.topo]
            self.topo -= 1
            return valor

def float32Tofloat16(valor):
    return np.float16(valor)

def float16Tofloat32(valor):
    return float(np.float32(valor))

def operacao(a, b, op):
    if op == '+': return a + b
    elif op == '-': return a - b
    elif op == '*': return a * b
    elif op == '/': return a / b if b != 0 else 0
    elif op == '^': return a ** b
    elif op == '%': return a % b
    else:
        raise ValueError(f"Operação inválida: {op}")

def resolveExp(expressao):
    global memoria, contResultado, resultadoHalf
    tokens = expressao.strip().split()
    pilha = Pilha(100)

    for token in tokens:
        if token.startswith('('):
            if 'RES' in token:
                match = re.search(r'\((\d+)\s*RES\)', token)
                if match:
                    n = int(match.group(1))
                    if 0 <= n < contResultado:
                        valor = float16Tofloat32(resultadoHalf[n])
                        pilha.empilhar(valor)
                    else:
                        print(f"Resultado {n} não encontrado.")
            elif 'V MEM' in token:
                match = re.search(r'\(V MEM\s+([-+]?\d*\.?\d+)\)', token)
                if match:
                    memoria = float(match.group(1))
            elif 'MEM' in token:
                pilha.empilhar(memoria)
        elif token in "+-/*^%":
            if pilha.topo >= 1:
                n1 = pilha.desempilhar()
                n2 = pilha.desempilhar()
                resultado = operacao(n2, n1, token)
                pilha.empilhar(resultado)
                h = float32Tofloat16(resultado)
                resultadoHalf.append(h)
                contResultado += 1
            else:
                print("Erro: Pilha não tem elementos suficientes.")
        else:
            try:
                valor = float(token)
                pilha.empilhar(valor)
                h = float32Tofloat16(valor)
                resultadoHalf.append(h)
                contResultado += 1
            except ValueError:
                print(f"Token inválido: {token}")
    
    if not pilha.vazia():
        return pilha.desempilhar()
    else:
        return 0.0

# Lista de arquivos a serem processados
arquivos = ['expressoes1.txt', 'expressoes2.txt', 'expressoes3.txt']

for nome in arquivos:
    print(f"\nArquivo: {nome}")
    try:
        with open(nome, 'r', encoding='utf-8') as f:
            linhas = f.readlines()
            for i, linha in enumerate(linhas, 1):
                if linha.strip() == "":
                    continue
                resultado = resolveExp(linha)
                print(f"Linha {i:2d}: {linha.strip():<30} => Resultado: {resultado}")
    except FileNotFoundError:
        print(f"Arquivo não encontrado: {nome}")
