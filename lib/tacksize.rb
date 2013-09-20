require 'tacksize/version'
require 'httparty'

module Tacksize
  def self.tacks
    "some shit"
  end

  def self.itisPing
  	shit = HTTParty.get('http://www.itis.gov/ITISWebService/services/ITISService/getDescription')
  	shit.values
  end

  def self.gnrResolve(names='Homo sapiens', source=nil, format='json', resolve_once=false, with_context=false)
  	url = 'http://resolver.globalnames.org/name_resolvers'
  	out = HTTParty.get(url, :query => {:names => names, :data_source_ids => source, :format => format, :resolve_once => resolve_once, :with_context => with_context})
  	data = out.parsed_response['data'][0]['results']

  	myarray = []

  	data.each do |item|
      a=item['canonical_form']
      b=item['score']
      c=item['data_source_title']
      myarray << {'name' => a, 'score' => b, 'data_source' => c}
    end

    myarray
  end

# Tacksize.gniParse(names = ['Cyanistes caeruleus','Helianthus annuus'])
  def self.gniParse(names)
    url = 'http://gni.globalnames.org/parsers.json'
    names = names.join('|')
    out = HTTParty.get(url, :query => {:names => names})
    out.parsed_response
  end

# search_term = 'ani*'
# Tacksize.gniSearch(:search_term => 'ani*')
  def self.gniSearch(options={})
    url = 'http://gni.globalnames.org/name_strings.json'
    # out = HTTParty.get(url, :query => {:search_term => search_term})
    out = HTTParty.get(url, :query => options)
    out.parsed_response['name_strings']
  end

# Tacksize.gniDetails(:id => 17802847)
  def self.gniDetails(options={})
    url = 'http://gni.globalnames.org/name_strings/'
    url2 = [url, options[:id], '.json'].join('')
    out = HTTParty.get(url2)
    out.parsed_response['data'][0]
  end
end