require 'sinatra'
require 'slim'
require 'sinatra/reloader'


get('/test') do
  @fruit = "Hugo Romeborn"
  slim(:test)
  

end

get('/bye') do
  slim(:about)

end

get('/fruits') do
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