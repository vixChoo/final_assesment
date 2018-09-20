require 'nokogiri'
require 'watir'
require 'httparty'


class SearchController < ApplicationController

  def index
     browser = Watir::Browser.new(:chrome)
     browser.goto("http://jobs.monster.com.my/")
     parsed_page = Nokogiri::HTML(browser.html)
     
     jobs = parsed_page.css("table.results tr") #20jobs perpages
     jobs_array = []
	    #---- grab each job -------#
      jobs.each do |job|
        detail = {
          title: job.css("table.results a").text,
          link: job.css("table.results a").attributes["href"].value,
          date:  job.css("span.txt_purple").text,
          company_name: job.css("span.txt_grey3").text,
          location: job.css("span.txt_green").text,
          content: job.css("table.results div").text

        }
        jobs_array << detail
      end
      @jobs = jobs_array

      ###### close browser ####
	    browser.close
    end  #### close index ####
      
end
