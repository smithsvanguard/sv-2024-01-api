# CRM API

## Installation

Install the required softwares

System update and required system libraries
```
sudo apt update

sudo apt upgrade -y

sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
```

ASDF
Is a version management tool. Which can be used to manage softwares like Ruby and Node.
```
cd
git clone https://github.com/excid3/asdf.git ~/.asdf
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
echo 'legacy_version_file = yes' >> ~/.asdfrc
echo 'export EDITOR="code --wait"' >> ~/.bashrc
exec $SHELL
```

Ruby 
```
asdf plugin add ruby

asdf install ruby 3.3.0
asdf global ruby 3.3.0

# Update to the latest Rubygems version
gem update --system
```

Verify that ruby is installed by checking where it is located and the version installed. 
```
which ruby
#=> /home/username/.asdf/shims/ruby

ruby -v
#=> 3.3.0
```

NodeJS
```
asdf plugin add nodejs

asdf install nodejs 20.10.0
asdf global nodejs 20.10.0

# Install yarn for Rails jsbundling/cssbundling or webpacker
npm install -g yarn
```

Verify that Node has been installed by checking where it is located and the installed version.
```
which node

node -v
```

Rails
```
gem install rails -v 7.1.2
```

Check the version installed
```
rails -v
```

NGINX
```
sudo apt-get install -y nginx-full 
```

Verify that NGINX is installed by checking the version
```
nginx -v
```

## Running

01: Clone this repository. 

02: Checkout the development repository branch
Open the application in the JetBrains RubyMine IDE or any text editor

03: Navigate to the CrmAPI directory on a terminal.
This directory contains the app, bin, config, etc.

04: Run the following command in the shell/terminal
```
rails server
```

05: It should start the local server and you would be able to open the following on a browser
```
http://127.0.0.1:3000
```

06: Visiting the URL should show a Ruby logo. Along with the version for Ruby and Rails.
