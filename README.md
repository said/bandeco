bandeco
=======

Sistema para gerenciamento de cardápio de Bandejão.


Guia de comandos e configurações:
=================================

rails new bandejao
cd bandejao

# para testar: criar este controller e descomentar a linha
rails generate controller welcome index
vi config/routes.rb
> root to: welcome#index

# se for configurar o bd em mysql
vi config/database.yml
>	production:
>   adapter: mysql
>   database: ***
>   username: <%= ENV['BANDECO_USER'] %>
>   password: <%= ENV['BANDECO_PASSWORD'] %>
>   host: ***
>   pool: 5
>   timeout: 5000

# para configurar o bd no Mac Osx, deve-se definir o socket assim:
vi config/database.yml
> default: &default
>   adapter: mysql2
>   encoding: utf8
>   pool: 5
>   username: <%= ENV['BANDECO_USER'] %>
>   password: <%= ENV['BANDECO_PASSWORD'] %>
>   socket: /tmp/mysql.sock

# após isso é preciso criar um arquivo com o login e senha, ou definir localmente
vi .env
> BANDECO_USER=db_password
> BANDECO_PASSWORD=db_password

# para finalizar, substitui o sqlite pelo mysql
vi Gemfile
>	gem 'mysql'

# comandos para gerar os modelos
rails generate model Campusunit name:string address:string
rails generate model Restaurant campusunit:references name:string address:string tel:string
rails generate model Meal name:string cost:string
rails generate model Menu day:date restaurant:references meal:references options:text kcal:string
rails generate model Menuscomment menu:references commenter:string message:string
rails generate model Restaurantopeninghour restaurant:references meal:references wday:integer open:string close:string
rails generate model Placescategory campusunit:references name:string abbreviation:string
rails generate model Place placescategory:references name:string address:string tel:string latitude:string longitude:string metatags:text

# comandos para gerar os controllers
rails generate controller campusunits index show new create edit update destroy
rails generate controller restaurants index show new create edit update destroy
rails generate controller meals index show new create edit update destroy
rails generate controller menus index show new create edit update destroy
rails generate controller menuscomments index show new create edit update destroy
rails generate controller restaurantopeninghours index show new create edit update destroy
rails generate controller placescategories index show new create edit update destroy
rails generate controller places index show new create edit update destroy

# se for rodar online
rake db:migrate RAILS_ENV="production"

# se for rodar development
rake db:migrate RAILS_ENV="development"

# acrescentar estas linhas
vi config/routes.rb
  resources :campusunits, :path => "campus"
  resources :restaurants, :path => "bandejao"
  resources :restaurantopeninghours, :path => "horariosrestaurante"
  resources :meals, :path => "refeicao"
  resources :menus, :path => "cardapio"
  resources :menuscomments, :path => "comentariosrefeicao"
  resources :placescategories, :path => "categoriaslocal"
  resources :places, :path => "local"

# para monitorar o sistema com o Google Analytics
vi Gemfile
> group :production do
>   gem 'rack-google_analytics', :require => "rack/google_analytics"
> end
# adicionar isso na definição da application class
vi config/application.rb
> if Rails.env == "production"
>   config.middleware.use("Rack::GoogleAnalytics", :web_property_id => "UA-0000000-1")
> end

# para configurar o secrets.yml
rake secret
# copia a chave gerada e edita o arquivo seguinte sem usar TAB no arquivo
vi config/secrets.yml
> development:
>   secret_key_base: __pasted from rake secret___
>
> test:
>   secret_key_base: __pasted from rake secret___
>
> production:
>  secret_key_base: __pasted token from config/initializers/secret_token.rb___

# para recarregar as novas configurações e iniciar o uso:
rm public/index.html
touch tmp/restart.txt
