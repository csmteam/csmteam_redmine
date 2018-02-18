set :branch, "master"

server 'csm-team.my-mall.club', user: 'deploy', roles: %w{web app db backend}, :primary => true
