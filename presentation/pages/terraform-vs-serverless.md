---
layout: two-cols-header
---

<Logo />

# Serverless vs Terraform

Lambda

::left::

### Serverless
- ✅ **Criar/excluir Lambda**
- ✅ **Publicar Lambda**
- ⚠️ **Empacotar zip/imagem**
- ✅ **Upload para S3/ECR**
- ✅ **Gateway**
- ⚠️ **Warmup**
- ✅ **Desenvolvimento local (invoke/start)**
- ✅ **IAM**
- ✅ **Versionamento de ambiente (dev, prod)**
- ⚠️ **Domínio customizado**

::right::

### Terraform
- ✅ **Criar/excluir Lambda**
- ✅ **Publicar Lambda**
- ❌ **Empacotar zip/imagem**
- ⚠️ **Upload para S3/ECR**
- ✅ **Gateway**
- ✅ **Warmup**
- ❌ **Desenvolvimento local (invoke/start)**
- ✅ **IAM**
- ✅ **Versionamento de ambiente (dev, prod)**
- ✅ **Domínio customizado**
