# Automação de testes com Robot Framework - Plataforma Smartbit

Projeto de automação de testes end-to-end utilizando as bibliotecas **Browser** (Playwright) para testes web e **AppiumLibrary** para testes mobile. Além disso, também utilizei a biblioteca **RequestsLibrary** para a execução de chamadas de API.

Esse projeto foi desenvolvido durante o curso "Universo Robot Framework", em que implementei diversos cenários de testes para a plataforma **Smartbit**, um software fictício que simula a gestão de academias.

### Tecnologias utilizadas:
- **Robot Framework** com bibliotecas Browser, AppiumLibrary e RequestsLibrary
- **Faker** para geração de massa de dados dinâmica
- Organização de massa de testes em JSON utilizando **JSONLibrary**
- Programação em **Python** para criação de scripts auxiliares
- Banco de dados **Postgres** em um container **Docker**
- Biblioteca **dotenv** para uso de variáveis de ambiente
- Padrão de projeto **Page Object Model**

### Cenários de testes automatizados:
- **Aplicação web:** Login, Pré-cadastro e realização de matrículas
- **Aplicação mobile:** Login e cadastro de medidas

### Pré-requisitos
- **Python** (versão recomendada: 3.13.7 ou superior)
- **Android Studio** (versão Otter 2025 ou superior)
- **Docker Desktop** (versão 4.45.0 ou superior)

---

## Sistema alvo dos testes

O Smartbit é um sistema fictício de gestão de academias, que contempla:
- Uma versão web para pré-cadastro de clientes e uma área logada para gestão de matrículas
- Um aplicativo mobile para que os usuários possam fazer login e registrar suas medidas

Obtenha o código da aplicação e veja como subi-la localmente [neste repositório](https://github.com/cmath0/smartbit).

---

## Como executar o projeto de testes

### Clonar o repositório

```
git clone https://github.com/cmath0/robot-smartbit-automation.git
cd robot-smartbit-automation
```

### Instalar dependências

```
pip install -r requirements.txt
```

### Configurar variáveis de ambiente

Criar arquivo `.env` na raiz do projeto com os valores:

```
# Database
DB_HOST=localhost
DB_NAME=smartbit
DB_USER=postgres
DB_PASS=QAx@123

# API
API_URL=http://localhost:3333

# Web
BASE_URL=http://localhost:3000
BROWSER=chromium
HEADLESS=False
```

### Executar testes web

```
cd web
robot -d ./logs tests/
```

### Executar testes mobile

Abrir o Android Studio, ir em More Actions > Virtual Device Manager e iniciar o dispositivo mobile.

Então:

```
cd mobile
robot -d ./logs tests/
```