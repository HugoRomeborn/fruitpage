require 'sinatra'
require 'slim'
require 'sinatra/reloader'
require 'sqlite3'


post('/fruit') do
  name = params[:name]
  amount = params[:amount].to_i
  db = SQLite3::Database.new("db/fruits.db")

  datafrukt = db.execute("SELECT * FROM fruits WHERE name=?", namn)
  datafrukt.each do |frukt|
    frukt

  end

  db.execute("INSERT INTO fruits (name, amount) VALUES (?,?)", [name, amount])
  redirect('/fruits')
end

get('/fruits') do
  #Koppling till db
  db = SQLite3::Database.new("db/fruits.db")
  db.results_as_hash = true

  query = params[:q]

  if query && !query.empty?
    @datafrukt = db.execute("SELECT * FROM fruits WHERE name LIKE ?","%#{query}%")
  else
    #hämta från db
    @datafrukt = db.execute("SELECT * FROM fruits")
  end
  p @datafrukt

  #Visa med slim
  slim(:"fruits/index")
end

get('/new') do
  slim(:"fruits/new")
end

get('/test') do
  @fruit = "Hugo Romeborn"
  slim(:test)
end

get('/bye') do
  slim(:about)

end

get('/fruits1') do
  @fruits = ["banan", "apple", "pear"]
  slim(:fruits)

end

get('/fruits/:id') do
  @fruits = ["banan", "apple", "pear"]
  id = params[:id].to_i
  @fruit = @fruits[id]
  slim(:show_fruit)

end

get("/claws") do
  @cat = {
    "name" => "claws",
    "age" => 5
  }
  slim(:cats)
end

get("/dogs") do
  @dogs = [
    {
      "name" => "Kalle Anka",
      "age" => "55"
    },
    {
      "name" => "Fido",
      "age" => "55"
    },
    {
      "name" => "Hugo Karlsson",
      "age" => "55"
    },
    {
      "name" => "Addis",
      "age" => "55"
    },
    {
      "name" => "Fnatte Anka",
      "age" => "55"
    }
  ]

  slim(:dogs)
end