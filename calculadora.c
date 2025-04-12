// Nome: Matheus Conzatti de Souza
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stdint.h>

// Representação do número em meia precisão
typedef uint16_t float16;
float16 conversaofloatHalf(float f);

typedef struct no{
    float valor;
    struct no *prox;
}No;

// Vetor que armazena os resultados
float16 resultadoHalf[100];
int contResultados = 0;
float memoria = 0.0; // Mémoria que auxilia os comandos especiais

// Função de conversão de float para half-float
float16 conversaofloatHalf(float f) {
    uint32_t bin;
    memcpy(&bin, &f, sizeof(bin)); // Faz as copia dos bits do float para inteiro
    uint16_t sinal = (bin >> 16) & 0x8000; // Bit de Sinal
    int16_t exp = ((bin >> 23) & 0xFF) - 127 + 15; // Ajusta os expoentes de 32 bit
    uint16_t mantissa = (bin >> 13) & 0x03FF; // 10 bits da matissa

    if (exp <= 0)
        return sinal; // Retorna o sinal de subnormal
    else if (exp >= 31)
        return sinal | 0x7C00; // Retorna Infinito o vazio
    return sinal | (exp << 10) | mantissa;
}

// Função que faz a conversão da float 16 para float 32 seguindo o IEEE754
float conversaohalfToFloat(uint16_t f16){
    uint16_t sinal = (f16 >> 15) & 0x0001;
    uint16_t exp = (f16 >> 10) & 0x001F;
    uint16_t frac = f16 & 0x03FF;
    uint32_t f32Sinal = (uint32_t)sinal << 31;
    uint32_t f32Exp, f32Frac;

    if(exp == 0){
        if(frac == 0){
            f32Exp = 0;
            f32Frac = 0;
        }else{
            exp = 1;
            while((frac & 0x0400) == 0){
                frac <<=1;
                exp--;
            }
            frac &= 0x03FF;
            f32Exp = (uint32_t)(127 - 15 + exp) << 23;
            f32Frac = (uint32_t)frac << 13;
        }
    }else if(exp == 0x1F){
        f32Exp = 0xFF << 23;
        f32Frac = (uint32_t)frac << 13;
    }else{
        f32Exp = (uint32_t)frac << 13;
        f32Frac = (uint32_t)frac << 13;
    }

    uint32_t f32Bits = f32Sinal | f32Exp | f32Frac;
    float resultado;
    memcpy(&resultado, &f32Bits, sizeof(resultado));
    return resultado;
}

// Função que faz o empilhamento dos valores ao topo da pilha
No *empilhar(No *pilha, float num) {
    No *novo = malloc(sizeof(No)); // Aloca memória para um novo nó
    if(novo){
        novo->valor = num; // Atribui valor
        novo->prox = pilha; // O novo nó aponta para o topo atual da pilha
        return novo; // Retorna o novo topo
    }else
        printf("\tErro na alocação de memória!\n");
    return NULL;
}

// Função para desempilhar o valor do topo da pilha
No *desempilhar(No **pilha) {
    No *remover = NULL;
    if(*pilha){
        remover = *pilha; // O nó a ser removido do topo da pilha
        *pilha = remover->prox; // O novo topo passa a ser o próximo elemento
    }else 
        printf("\tPilha vazia!\n");
    return remover; // Retorna o nó removido
}

// Função de operações matemáticas
float operacao(float a, float b, char x){
    switch (x) {
        case '+': return a + b; break;// Soma
        case '-': return a - b; break; // Subtração
        case '/': return (b != 0) ? a / b : NAN; break; // Divisão de numeros reais. Não deixa a divisão por zero
        case '*': return a * b; break; // Multiplicação
        case '^': return powf(a, b); break; // Exponenciação  
        case '&': return sqrtf(a); break; // Raiz quadrada
        case '%': return fmodf(a, b); break; // Resto da divisão
        default: return 0.0;
    }
}

// Função que resolve os cálculos da calculadora RPN
float resolverExp(char x[]){
    char *ponteiro;
    float num;
    No *n1, *n2, *pilha = NULL;

    ponteiro = strtok(x, " "); // Divide as strings usando um espaçamento.
    while (ponteiro) {
        if(ponteiro[0] == '('){
            if(strstr(ponteiro, "RES")){
                // Processa o comando (N RES)
                int n = atoi(ponteiro + 5); // Captura o número após "N RES"
                if(n >= 0 && n < contResultados) {
                    num = conversaohalfToFloat(resultadoHalf[n]);
                    pilha = empilhar(pilha, num);
                }else printf("\tResultado N não foi encontrado.\n");
            }else if(strstr(ponteiro, "MEM")){
                // Processa o comando (MEM)
                pilha = empilhar(pilha, memoria); // Utiliza o valor da memória
            }else if(strstr(ponteiro, "V MEM")){ // O strstr é para subtrings dentor da string
                // Processa o comando (V MEM)
                float v = atof(ponteiro + 6); // Captura o número após "V MEM"
                memoria = v;
            }
        }else if(strchr("+-/*^&%", ponteiro[0])){
            if (pilha && pilha->prox) {  // Verifica se há pelo menos dois elementos na pilha
                n1 = desempilhar(&pilha); // Desempilha o topo da pilha
                n2 = desempilhar(&pilha); // Desempilha o próximo valor da pilha

                num = operacao(n2->valor, n1->valor, ponteiro[0]); // Realiza a operação
                pilha = empilhar(pilha, num);

                float16 h = conversaofloatHalf(num);
                resultadoHalf[contResultados++] = h; // Armazena o resultado
                //printf("\tResultado (16-bit): 0x%04X => %.4f\n", h, conversaohalfToFloat(h));

                free(n1); // Para evitar o consumo desnecessário de memória
                free(n2); // Para evitar o consumo desnecessário de memória
            }else 
                printf("\tErro: Pilha nao contem elementos suficientes para a operacao!\n");
        }else{
            num = atof(ponteiro); // Converte a string em número
            pilha = empilhar(pilha, num);
            float16 h = conversaofloatHalf(num);
            resultadoHalf[contResultados++] = h; // Armazena o resultado
            //printf("\tEmpilhado (16-bit): 0x%04X => %.4f\n", h, conversaohalfToFloat(h));
        }
        ponteiro = strtok(NULL, " "); // Divide as strings usando um espaçamento.
    }

    if(pilha){
        n1 = desempilhar(&pilha); // Pega o último valor da pilha
        num = n1->valor;
        free(n1);// Para evitar o consumo desnecessário de memória
    }else{
        num = 0.0;
        printf("\tErro: Pilha final vazia!\n");
    }
    return num;
}

// Função que faz a leitura dos arquivos txt, resolvendo as expressões numéricas
void lerArquivos(char *nomeArquivos[], int numeroArquivos){
    FILE *arquivo;
    char linha[100];
    char expressaoOriginal[100];
    int i;

    for(i = 0; i < numeroArquivos; i++){
        arquivo = fopen(nomeArquivos[i], "r"); // Abre o arquivo texto

        if(arquivo == NULL){
            printf("Erro ao abrir o arquivo %s.\n", nomeArquivos[i]);
            continue;
        }
        printf("Resultados do arquivo %s:\n", nomeArquivos[i]);
        while(fgets(linha, sizeof(linha), arquivo) != NULL){
            linha[strcspn(linha, "\n")] = 0; // Remove a quebra de linha
            strcpy(expressaoOriginal, linha);
            printf("Expressao: %s = %.0f\n", expressaoOriginal, resolverExp(linha));
        }
        printf("\n"); // Quebra de linha
        fclose(arquivo); // Fecha o arquivo de texto
    }
}

// Função que faz a leitura e gera o arquivo Assembly
void geraAssembly(char *exp, FILE *arqAssembly){
    static int escritaMain = 0;
    static int escritaEnd = 0;

    if(!escritaMain){
        fprintf(arqAssembly, ".global main\n");
        fprintf(arqAssembly, "main:\n");
        escritaMain = 1;

        // Configuração UART 9600 baud
        fprintf(arqAssembly, "    ldi r16, 103 ; UBRR0L = 103\n");
        fprintf(arqAssembly, "    out 0x0A, r16,\n");
        fprintf(arqAssembly, "    ldi r16, 0x08 ; (1<<TXEN0)\n");
        fprintf(arqAssembly, "    out 0x0A, r16\n");
        fprintf(arqAssembly, "    ldi r16, 0x06 ; (1<<UCSZ01)|(1<<UCSZ00)\n");
        fprintf(arqAssembly, "    sts 0xC2, r16 ; UCSR0C\n");
    }

    char *token = strtok(exp, " ");
    float pilha[50];
    int topo = -1;

    while(token){
        if(strcmp(token, "+") == 0 || strcmp(token, "-") == 0 || strcmp(token, "*") == 0 || strcmp(token, "/") == 0 || strcmp(token, "^") == 0 || strcmp(token, "%") == 0){
            if(topo < 1){
                fprintf(stderr, "Erro: Operadores insuficiente para a pilha.\n");
                return;
            }
        
            float b = pilha[topo--];
            float a = pilha[topo--];

            float16 hA = conversaofloatHalf(a);
            float16 hB = conversaofloatHalf(b);

            fprintf(arqAssembly, "    ; Carrega A em r16 (LSB) e r17 (MSB)\n");
            fprintf(arqAssembly, "    ldi r16, 0x%02X\n", hA & 0xFF);
            fprintf(arqAssembly, "    ldi r17, 0x%02X\n", (hA >> 8) & 0xFF);
            fprintf(arqAssembly, "    ; Carrega B em r18 (LSB) e r19 (MSB)\n");
            fprintf(arqAssembly, "    ldi r18, 0x%02X\n", hB & 0xFF);
            fprintf(arqAssembly, "    ldi r19, 0x%02X\n", (hB >> 8) & 0xFF);

            // Chama as sub-rotinas
            if(strcmp(token, "+") == 0) fprintf(arqAssembly, "    call add_avr\n");
            else if(strcmp(token, "-") == 0) fprintf(arqAssembly, "    call sub_avr\n");
            else if(strcmp(token, "*") == 0) fprintf(arqAssembly, "    call mul_avr\n");
            else if(strcmp(token, "/") == 0) fprintf(arqAssembly, "    call div_avr\n");
            else if(strcmp(token, "^") == 0) fprintf(arqAssembly, "    call pow_avr\n");
            else if(strcmp(token, "%") == 0) fprintf(arqAssembly, "    call mod_avr\n");

            fprintf(arqAssembly, "    ; Envia resultado via UART (em hexadecimal)\n");
            fprintf(arqAssembly, "    mov r30, r20 ; LSB -> r30\n");
            fprintf(arqAssembly, "    mov r31, r21 ; MSB -> r31\n");
            fprintf(arqAssembly, "    call print_hex\n");

            // Faz o empilhamento dos resultados
            float resultado = operacao(a, b, token[0]);
            pilha[++topo] = resultado;
        }else{
            float valor = atof(token);
            pilha[++topo] = valor;
        }
        token = strtok(NULL, " ");
    }

    if(!escritaEnd){
        fprintf(arqAssembly, "    call uart_send_result\n");
        fprintf(arqAssembly, "end:\n");
        fprintf(arqAssembly, "    rjmp end\n");
        escritaEnd = 1;
    }
}

void lerArqGeradoAssembly(FILE* arqAssembly, const char* nomeArquivoEntrada) {
    FILE* arquivo = fopen(nomeArquivoEntrada, "r");
    if(!arquivo){
        perror("Erro ao abrir o arquivo!");
        return;
    } 

    char linha[256];
    while(fgets(linha, sizeof(linha), arquivo)){
        linha[strcspn(linha, "\n")] = 0;
        geraAssembly(linha, arqAssembly);
    }

    fclose(arquivo);
}

int main(){
    char *arquivos[] = {"expressoes1.txt", "expressoes2.txt", "expressoes3.txt"};
    int calcQtd = sizeof(arquivos) / sizeof(arquivos[0]);

    lerArquivos(arquivos, calcQtd);

    FILE *arqAsm = fopen("calculadora.asm", "w");
    if (!arqAsm) {
        perror("Erro ao abrir calculadora.asm");
        return 1;
    }

    for(int i = 0; i < calcQtd; i++){
        lerArqGeradoAssembly(arqAsm, arquivos[i]);
    }

    fclose(arqAsm);
    return 0;
}