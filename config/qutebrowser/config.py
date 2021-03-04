config.load_autoconfig(True)
c.tabs.background = True
c.downloads.position = 'bottom'
c.spellcheck.languages = ['en-US']
c.url.start_pages = "~/git/robertorolo.github.io/index.html"

c.url.searchengines = {"DEFAULT": "https://www.google.com.ar/search?q={}",
                       "wa":"https://wiki.archlinux.org/?search={}",
                       're':'https://www.reddit.com/search?q={}', 
                       'yt':'https://www.youtube.com/results?search_query={}',
                       'gs':'https://scholar.google.com.br/scholar?hl=pt-BR&as_sdt=0%2C5&q={}&btnG=&oq='}

#config.source('gruvbox.py')

config.bind('f', 'hint all tab')
config.bind('F', 'hint')
config.bind('p', 'spawn mpv {url}')
