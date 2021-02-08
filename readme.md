# VSCode in browser

**CZ**

Tento ukázkový projekt demonstruje možnosti využití IDE Visual Studio Code v prohlížeči.

Základní set obsahuje:
- Nette Sandbox <a href="https://github.com/nette/sandbox"><img src="https://badgen.net/github/stars/nette/sandbox/"></a>
- Code Server (VS Code)
- Docker
    - PHP with Apache image <a href="https://hub.docker.com/layers/php/library/php/8.0.2-apache/images/sha256-f4d62ec3a22c49321851f985e270397ebbec114a24994b42de3f27d30041bfb3?context=explore"><img src="https://badgen.net/docker/stars/library/php/"></a>
  
## Podmínky pro lokální spuštění
1. Docker
2. Composer

## Spuštění
1. `docker-compose build`
2. `docker-compose up -d`
3. `composer install`

## Web
Ukázkový web běží na **localhost:8180/www**

Nastavení xdebugu - v přiložném .vscode/settings.json

## VSCode
VSCode běží na portu **8181**
Pokud chcete přistupovat z jiného zařízení je nutné upravit v `~/.config/code-server/config.yaml` 
`bind-addr: 127.0.0.1:8181` na IP kterou máte přidělenu nebo případně na `0.0.0.0:8181`

### Pluginy
Nainstalujeme tyto pluginy:
- PHP Intelephense
- PHP Debug

### Otevření projektu
- otevřeme si kořenový adresář projektu `CMD+O`

### Xdebug
1. vyvoláme příkazový panel `F1` a vyhledáme `Debug: open launch.json`
2. vybere PHP
3. vložíme konifgurační obsah níže

- port 9003 je výchozí port Xdebugu v kontejneru
- `pathMappings` je namapování adresáře s projektem lokálně oproti kontejneru

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for XDebug in Docker",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/var/www/html/": "${workspaceFolder}"
            }
        },
        {
            "name": "Launch currently open script",
            "type": "php",
            "request": "launch",
            "program": "${file}",
            "cwd": "${fileDirname}",
            "port": 9003
        }
    ]
}
```