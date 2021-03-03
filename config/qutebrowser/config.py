config.load_autoconfig(True)
c.tabs.background = True
c.downloads.position = 'bottom'
#c.spellcheck.languages = ['en-US', 'pt-BR']
c.url.start_pages = "https://robertorolo.github.io"

c.url.searchengines = {"DEFAULT": "https://www.google.com.ar/search?q={}", "wa":"https://wiki.archlinux.org/?search={}", 're':'https://www.reddit.com/search?q={}'}

config.source('gruvbox.py')