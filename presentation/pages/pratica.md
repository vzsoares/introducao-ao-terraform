---
transition: fade
---

# Prática

Algumas informações serão omitidas em prol da didática.

<Logo />

````md magic-move {lines: true}
```
projeto/
```

```sh
projeto/ # módulo
├── main.tf
└── main.py
```

```tf
# main.tf
resource "aws_lambda_function" "test_lambda" {
  function_name = "lambda_exemplo"
  handler       = "main.handle"

  runtime = "python3.9"
}
```

```tf
# main.tf
resource "aws_lambda_function" "test_lambda" {
  function_name = "lambda_exemplo"
  handler       = "main.handle"

  filename      = "./function.zip"
  role          = "arn:aws:iam::1111111:role/lambdaRole"

  runtime = "python3.9"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "main.py"
  output_path = "function.zip"
}
```

```sh
projeto/
├── main.tf
├── provider.tf  
└── main.py
```

```tf
# provider.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuração do provider
provider "aws" {
  region = "us-east-1"
}
```

```sh

terraform init

terraform plan

terraform apply

```

````

---
transition: fade
---

# Prática

Algumas informações serão omitidas em prol da didática.

<Logo />

````md magic-move {lines: true}

```sh
projeto/
├── .terraform/
├── .terraform.lock.hcl
├── terraform.tfstate
├── main.tf
├── provider.tf  
└── main.py
```

```sh
projeto/
├── modules/
│   └── lambda/
│       └── main.tf
├── .terraform/
├── .terraform.lock.hcl
├── terraform.tfstate
├── main.tf
├── provider.tf  
└── main.py
```

```sh
projeto/
├── modules/
│   └── lambda/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── .terraform/
├── .terraform.lock.hcl
├── terraform.tfstate
├── main.tf
├── provider.tf  
└── main.py
```

```tf {*|3,6}
# modules/lambda/main.tf
resource "aws_lambda_function" "test_lambda" {
  function_name = var.name
  handler       = "main.handle"

  filename      = var.filePath
  role          = "arn:aws:iam::1111111:role/lambdaRole"

  runtime = "python3.9"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "main.py"
  output_path = "function.zip"
}
```

```tf
# main.tf

module "lambda_1" {
    source = "./modules/lambda"

    name     = "lambda_1"
    filePath = "./function.zip"
}

```

```tf
# main.tf

module "lambda_1" {
    source = "./modules/lambda"

    name     = "lambda_1"
    filePath = "./function.zip"
}

module "lambda_2" {
    source = "./modules/lambda"

    name     = "lambda_2"
    filePath = "./function2.zip"
}

```

````

<!--
E se eu quiser criar outra Lambda?

Necessita variáveis e outputs.
-->

---

# Prática

Algumas informações serão omitidas em prol da didática.

<Logo />

````md magic-move {lines: true}

```sh
projeto/
├── modules/
│   └── lambda/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── .terraform/
├── .terraform.lock.hcl
├── terraform.tfstate
├── main.tf
├── provider.tf  
└── main.py
```

```sh
projeto/
├── modules/
│   └── lambda/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   └── provider.tf
│   └── prod/
│       ├── main.tf
│       └── provider.tf
└── main.py
```

```sh
projeto/
├── modules/
│   └── lambda/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   └── provider.tf
│   └── prod/
│       ├── main.tf
│       └── provider.tf
├── services/
│   └── loja/
│       └── main.tf
└── main.py
```

```sh
projeto/
├── modules/
│   └── lambda/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   └── provider.tf
│   └── prod/
│       ├── main.tf
│       └── provider.tf
├── services/
│   ├── loja/
│   │   └── main.tf
│   └── editor/
│       └── main.tf
└── src/
    ├── loja/
    │   └── main.py
    └── editor/
        └── main.py
```

````

<!--
Cada ambiente deve ter seu próprio estado.

Mas então, copiamos a definição para cada environment?
-->
