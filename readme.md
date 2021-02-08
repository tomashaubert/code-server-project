# VSCode in browser (code-server)

**CZ**

Tento ukázkový projekt demonstruje možnosti využití IDE Visual Studio Code v prohlížeči na PHP ukázce Nette Frameworku s funkčním Xdebugem. I když je pro mě hlavním editorem PHPStorm, VSCode v prohlížeči se hodí skvěle třeba při práci na cestách pomocí iPadu nebo z jakéhokoliv jiného zařízení, disponujícím prohlížečem a to vše bez nutnosti instalace vývojářského prostředí. Do lokální sítě se můžeme připojit pomocí VPN a využívat tak místní server. Code server lze samozřejmě provozovat i na veřejně přístupném serveru.

Ukázka je v Docker kontejneru, ale VSCode lze v mutaci pro prohlížeč (Code Server) nainstalovat i dalšími běžnými způsoby viz. [dokumentace](https://github.com/cdr/code-server/blob/v3.8.1/docs/install.md).

Základní set obsahuje:
- Nette Sandbox <a href="https://github.com/nette/sandbox"><img src="https://badgen.net/github/stars/nette/sandbox/"></a>
    - [readme](readme-webproject.md)
- Code Server (VS Code) <a href="https://github.com/cdr/code-server"><img src="https://badgen.net/github/stars/cdr/code-server"></a>
- Docker
    - PHP with Apache image <a href="https://hub.docker.com/layers/php/library/php/8.0.2-apache/images/sha256-f4d62ec3a22c49321851f985e270397ebbec114a24994b42de3f27d30041bfb3?context=explore"><img src="https://badgen.net/docker/stars/library/php/"></a>
  
## Nainstalované aplikace pro lokální spuštění
1. Docker
2. Composer

## Spuštění
1. `docker-compose build`
2. `docker-compose up -d`
3. `composer install`

## Web
Ukázkový web běží na `localhost:8180/www`

## VSCode

### Konfigurace
V ukázce probíhá konfigurace v docker-compose.yml. U běžné instalace je většinou v souboru: `~/.config/code-server/config.yaml`

### Vzdálený přístup
VSCode běží na **localhost:8181**

Do této konfigurace lze přistupovat i z jiného zařízení.

Standartně je, ale v nastavení konfigurace `bind-addr: 127.0.0.1:8181` pro vzdálený přístup nastavíme na IP, ze které přistupujeme, případně pokud chceme otevřít bez omezení tak nastavíme lokální přidělenou IP nebo případně zvolíme `0.0.0.0:8181`

### Pluginy
Nainstalujeme základní pluginy pro práci s PHP:
- PHP Intelephense
- PHP Debug

### Otevření projektu
- otevřeme si kořenový adresář projektu `CMD+O` a vybere si podadreář projekt, aby se nám otevřel celý projekt hezky z kořenového adresáře a případně si uložíme záložku. Cesta k adresáři projektu je viditelná a přepisovatelná přímo v URL, takže je s tím snadná práce.

### Xdebug
1. vyvoláme příkazový panel `F1` a vyhledáme `Debug: open launch.json`
2. vybere `PHP`
3. vložíme obsah konfiguračního níže

- port `9003` je výchozí port Xdebugu v kontejneru
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