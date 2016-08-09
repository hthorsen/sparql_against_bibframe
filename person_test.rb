require 'rubygems'
require 'rdf'
require 'linkeddata'


g = RDF::Graph.load("my.rdf")

puts "The graph object: #{(g.inspect)}"

q = "
PREFIX bf: <http://bibframe.org/vocab/>
SELECT *
WHERE {
	?person a bf:Person .
}
"

s = SPARQL.parse(q)
puts "The sparql query: #{s.inspect}"

s.execute(g) do |result|
	puts result.person
end
