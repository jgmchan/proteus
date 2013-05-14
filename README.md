# Proteus

Sick of typing `git commit --amend --author` because you've once again committed 
work into a non-Github repo with your Github username and email?

Yeah me too. So I present to you Proteus.

Proteus is a simple tool to manage your various git configurations.

It reads a configuration file and applies the correct git configuration
by matching rules which you have defined.

## Installation

I haven't released a gem to RubyGems.org yet so you will need to build
and install it from source at the moment.

Clone this repository:

    git clone https://github.com/jgmchan/proteus.git

Build the gem file:

    gem build proteus.gemspec

Install it locally:
   
    gem install proteus

## Usage

Proteus is fairly easy to use. It requires a YAML configuration file to be located at ~/.proteus.yaml.
This file will describe the rules to match and the git configs to apply.

Sample ~/.proteus.yaml:
    - rules:
        remote_origin: github.com
      config:
        user.name: jgmchan
        user.email: jgmchan@gmail.com
    
    - rules:
        remote_origin: git.example.com
      config:
        user.name: jeffrey
        user.email: jeffrey.chan@example.com

With the above configuration file, proteus will look at the remote origin of your git repository and
if it matches 'github.com', it will change user.name to 'jgmchan' and user.email to 'jgmchan@gmail.com'.
If it matches 'git.example.com' it will change the user.name to 'jeffrey' and user.email to 'jeffrey.chan@example.com'.

To run proteus, go into your git repository and run:
    
    proteus start

You can also alias your git command to do this automatically by adding this to your shell rc file:

    alias git='proteus start || git $@'

Note: This will eventually be done automatically for you when you execute `proteus init`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
