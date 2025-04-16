import re
import math

# Lista para armazenar os resultados anteriores
resultadoHalf = []
# Dicionário para simular memória
memoria = {}

def float_to_float16(value):
    import struct
    f = struct.unpack('>I', struct.pack('>f', value))[0]
    sign = (f >> 31) & 0x1
    exponent = (f >> 23) & 0xFF
    mantissa = f & 0x7FFFFF

    if exponent == 0:  # zero / subnormal
        exp16 = 0
        man16 = 0
    elif exponent == 0xFF:  # inf / NaN
        exp16 = 0x1F
        man16 = 0
    else:
        exp16 = exponent - 127 + 15
        if exp16 <= 0:
            exp16 = 0
            man16 = 0
        elif exp16 >= 0x1F:
            exp16 = 0x1F
            man16 = 0
        else:
            man16 = mantissa >> 13

    return (sign << 15) | (exp16 << 10) | man16

def float16_to_float(h):
    import struct
    s = int((h >> 15) & 0x00000001)    # sign
    e = int((h >> 10) & 0x0000001f)    # exponent
    f = int(h & 0x000003ff)           # fraction

    if e == 0:
        if f == 0:
            return float((-1)**s * 0.0)
        else:
            return (-1)**s * 2**(-14) * (f / 1024)
    elif e == 31:
        return float('inf') if f == 0 else float('nan')
    else:
        return (-1)**s * 2**(e - 15) * (1 + f / 1024)

def resolverExp(expressao):
    global resultadoHalf, memoria
    # Expressão regular: agrupando entre parênteses ou separando por espaços
    tokens = re.findall(r'\([^)]*\)|\S+', expressao)
    pilha = []

    for token in tokens:
        if token in ['+', '-', '*', '/', '^', '%']:
            if len(pilha) < 2:
                print("\tErro: elementos insuficientes na pilha")
                return 0
            b = pilha.pop()
            a = pilha.pop()

            if token == '+':
                pilha.append(a + b)
            elif token == '-':
                pilha.append(a - b)
            elif token == '*':
                pilha.append(a * b)
            elif token == '/':
                pilha.append(a / b if b != 0 else 0)
            elif token == '^':
                pilha.append(a ** b)
            elif token == '%':
                pilha.append(a % b)
        elif token.startswith('(') and token.endswith(')'):
            conteudo = token[1:-1].strip()
            if conteudo.endswith("RES"):
                idx = conteudo.split()[0]
                try:
                    index = int(idx)
                    valor = float16_to_float(resultadoHalf[index])
                    pilha.append(valor)
                except:
                    print(f"\tErro ao acessar resultado anterior: {token}")
                    return 0
            elif conteudo.startswith("MEM"):
                try:
                    endereco = int(conteudo.split()[1])
                    valor = memoria.get(endereco, 0)
                    pilha.append(valor)
                except:
                    print(f"\tErro ao acessar memória: {token}")
                    return 0
            elif conteudo.startswith("V MEM"):
                try:
                    partes = conteudo.split()
                    endereco = int(partes[2])
                    valor = float(partes[3])
                    memoria[endereco] = valor
                except:
                    print(f"\tErro ao salvar na memória: {token}")
                    return 0
        else:
            try:
                num = float(token)
                pilha.append(num)
            except:
                print(f"\tToken inválido: '{token}'")

    if len(pilha) == 0:
        print("\tPilha vazia!")
        return 0

    resultado = pilha[-1]
    resultadoHalf.append(float_to_float16(resultado))
    return resultado

def lerArquivos(nomes):
    for nome in nomes:
        print(f"\nResultados do arquivo {nome}:")
        with open(nome, 'r') as arquivo:
            for linha in arquivo:
                linha = linha.strip()
                if not linha:
                    continue
                resultado = resolverExp(linha)
                print(f"Expressao: {linha} = {int(resultado) if resultado.is_integer() else resultado}")

# Lista dos arquivos de entrada
arquivos = ["expressoes1.txt", "expressoes2.txt", "expressoes3.txt"]

# Executar a leitura e cálculo
if __name__ == "__main__":
    lerArquivos(arquivos)
