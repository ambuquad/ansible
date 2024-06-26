1)add a file in your homedir called .vimrc and add this line.
autocmd FileType yaml setlocal ai ts=2 sw=2 et cuc nu

2)create aliases for speed(You will need all the time you will get)
put aliases in ~/.bashrc.d/bash_aliases
alias an='ansible-navigator'
alias aninv='ansible-navigator inventory'
alias anexe='ansible-navigator exec'
alias ancol='ansible-navigator collections'
Grep through a test config file and get some key

ansible-config init all --disabled 
grep -E "_user|become_" ansible.test