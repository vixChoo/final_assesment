require 'nokogiri'
require 'watir'
require 'httparty'


class SearchController < ApplicationController

  def index
  
    #  browser = Watir::Browser.new(:chrome)
    #  browser = Watir::Browser.new :chrome, headless: true
    	# herouku browser
          opts = {
            headless: true
        }

        if (chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil))
          opts.merge!( options: {binary: chrome_bin})
        end 

        browser = Watir::Browser.new :chrome, opts
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


    
    def show

      if params[:searchword]
        security_name = params[:searchword]
          # Autorefresh Ajax#
          respond_to do |format|
            format.html
            format.js
          end
    
      else
        security_name = "engineer"
      end
      
			##### automated browsing ######
      # browser = Watir::Browser.new(:chrome)
      # browser = Watir::Browser.new :chrome, headless: true

      	# herouku browser
        opts = {
          headless: true
      }

      if (chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil))
        opts.merge!( options: {binary: chrome_bin})
      end 

      security_name = security_name
      
      
      
       browser = Watir::Browser.new :chrome, opts 
      browser.goto("https://www.monster.com.my/#{security_name}-jobs.html")
      parsed_page = Nokogiri::HTML(browser.html)
      
     jobs = parsed_page.css("div#hightlightedKeyword ul.ullilist li")[0..20] #102jobs perpages
     jobs_array = []

	    #---- grab each job -------#
      jobs.each do |job|
        detail = {
          title: job.css("div.jtitle").text,
          link:job.css("div.jtitle a").attribute("href").value,
          company_name: job.css("div.jtxt a").text,
          company_link: job.css("div.jtxt a").attribute("href").value,
          keyskill:job.css("div.jtxt:nth-child(5)").text,
          location: job.css("div.jtxt:nth-child(7)").text,
          date: job.css("div.job_optitem")[1].text,
          content:job.css("div.jtxt:nth-child(6)").text
        }

        jobs_array << detail
        end
        @jobs = jobs_array
  
        ###### close browser ####
        browser.close
  
      end  #### close show ####


        




end
