# Configurações

Antes de utilizar o odin-cli, você precisa ativar suas configurações padrões. 
Utilize o comando abaixo para iniciar as configurações

```shell
odin config
```

Este comando irá criar o arquivo `.odin.config.yaml` no seu diretório `$HOME`

```yaml
# $HOME/.odin.config.yaml
templates:
    default:
        repo: https://github.com/lbernardo/fx-webserver-example
        config:
            apiVersion: ""
            params:
                - name: package
            actions:
                - action: replace
                  find: github.com/lbernardo/fx-webserver
                  replace: '{{ .package }}'
```

Estas configuraçãos definem as templates que você vai utilizar ao executar o comando de criação de serviços.


## .odin.config.yaml

### templates
Você irá criar um `map` com os nomes de templates que vai utilizar. 

> **OBS:** Por padrão quando você não especificar um nome na
hora da criação do serviço, o `odin` irá interpretar que você esta utilizando o template `default`


### templates.$NAME.repo

Caso sua template esteja hospedada remotamente através de um repo git, 
você pode utilizar esse parâmetro para definir o local do template

### templates.$NAME.local

Utilize esse parâmetro para definir um template que esteja hospedado localmente.

> Você só deve definir se o template é local ou se é repo.

### templates.$NAME.config

Quando você não tem acesso ao repositório do template, você pode configurar o que vai ser modificado
ao realizar a criação do seu serviço a partir do template remoto. 
Por exemplo, existe o repo `github.com/lbernardo/fx-webserver-example` e você deseja criar seu 
service a partir dele. Mas precisa substituir o `package` pelo seu próprio. Então com o `templates.$NAME.config` você 
vai definir quais valores você vai querer substituir no conteudo do repo.

```yaml
templates:
  default:
    repo: https://github.com/lbernardo/fx-webserver-example
    config:
      apiVersion: ""
      params:
        - name: package
      actions:
        - action: replace
          find: github.com/lbernardo/fx-webserver
          replace: '{{ .package }}'
```
Utilizando a configuração acima, quando você executar o comando `odin create <MEU SERVICE>` o cli irá pedir para você
definir um valor para `package` e então substituir o `github.com/lbernardo/fx-webserver` pelo valor que esta em `package`

> Você pode definir quantos parâmetros desejar, como também quantos `action: replace` vai querer fazer

Essas configurações (config) podem ser adicionadas dentro do repo, criando um arquivo chamado `.odin.yaml` na raiz do repo.

```yaml
# .odin.yaml
config:
  apiVersion: ""
  params:
    - name: package
  actions:
    - action: replace
      find: github.com/lbernardo/fx-webserver
      replace: '{{ .package }}'
```