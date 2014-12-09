export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ncloward/.rbenv/shims:/usr/local/heroku/bin:/Users/ncloward/bin/subl:/Users/ncloward/bin/modman:$PATH"

# Postgres env settings
export PGHOST=localhost
export PGDATA=/usr/local/var/postgres

# For rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
