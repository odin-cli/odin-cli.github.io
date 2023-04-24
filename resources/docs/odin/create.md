# Criando serviços

Para criar um serviço a partir do template utilize o comando:

```shell
odin create <SERVICE NAME>
```

Caso deseje definir o template que irá utilizar, adicione o parâmetro `--template`

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
  golang:
    repo: https://github.com/lbernardo/fx-webserver-example
    config:
      apiVersion: ""
      params:
        - name: package
      actions:
        - action: replace
          find: github.com/lbernardo/fx-webserver/v2
          replace: '{{ .package }}'
```

```shell
odin create <SERVICE NAME> --template golang
```

Você também pode fazer clone direto de repos remotos sem precisar fazer a configuração do template

```yaml
odin create <SERVICE NAME> --template https://github.com/lbernardo/fx-webserver-example
```

