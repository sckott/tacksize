require 'tacksize/version'
require 'httparty'

module Tacksize
  def self.tacks
    "some shit"
  end

  def self.itis_ping
  	shit = HTTParty.get('http://www.itis.gov/ITISWebService/services/ITISService/getDescription')
  	shit.values
  end

  def self.gnr_resolve(names='Homo sapiens', source=nil, format='json', resolve_once=false, with_context=false)
  	url = 'http://resolver.globalnames.org/name_resolvers'
  	out = HTTParty.get(url, :query => {:names => names, :data_source_ids => source, :format => format, :resolve_once => resolve_once, :with_context => with_context})
  	data = out.parsed_response['data'][0]['results']

  	myarray = []

  	data.each do |item|
      a=item['canonical_form']
      b=item['score']
      c=item['data_source_title']
      myarray << {'name' => a, 'score' => b, 'data_source' => c}
      # puts a + ',' + b
    end

    myarray
  end
end