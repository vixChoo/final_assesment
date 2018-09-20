require 'nokogiri'
require 'watir'
require 'httparty'

# require 'byebug'

class SearchController < ApplicationController

  def index
    #  browser = Watir::Browser.new(:chrome)
     browser = Watir::Browser.new :chrome, headless: true

     browser.goto("http://jobs.monster.com.my/")
     parsed_page = Nokogiri::HTML(browser.html)
     
     jobs = parsed_page.css("table.results tr") #20jobs perpages
     jobs_array = []
	    #---- grab each job -------#
      jobs.each do |job|
        detail = {
          title: job.css("a").text,
          link: job.css("a").first.attributes["href"].value,
          date:  job.css("span.txt_purple").text,
          company_name: job.css("span.txt_grey3").text,
          location: job.css("span.txt_green").text,
          delete: job.css("div span").remove,
          content: job.css("div").text          
        }
        jobs_array << detail
      end
      @jobs = jobs_array

      ###### close browser ####
	    browser.close
    end  #### close index ####
      
end
