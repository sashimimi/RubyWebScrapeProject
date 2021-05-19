class PolicelogController < ApplicationController
  def index
    @incidents = []
    response = HTTParty.get('https://webapps.siouxfalls.org/policecalllog')

    doc = Nokogiri::HTML(response.body)
    
    tr = doc.css("tbody > tr")
    
    tr.each do |section|
        incident = {}
        td = section.css("td")
    
        incident["dateTime"] = td[0].content
        incident["streetName"] = td[1].content
        incident["closestIntersection"] = td[2].content
        incident["callType"] = td[3].content
        incident["incidentNumber"] = td[4].content
        incident["cfsDispo"] = td[5].content

        @incidents.push(incident)
    end
  end
end
