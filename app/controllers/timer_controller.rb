  class TimerController < ApplicationController

    def index
      @timer = "Hello"
      @now = Time.now
      puts "tick"
    end

    def start
      time_started = Time.now
      seconds_to_wait = 1
      duration = 10 # seconds
      puts 'timer started'
      
      begin  
        puts 'timer: ' + Time.now.to_s
        sleep seconds_to_wait
        @timer = "Hello"
        @now = Time.now
        redirect_to :action => "index"
        #render :action => "index"
      end until Time.now > time_started + duration

      puts 'timer ended'
      #redirect_to :action => "index"
    end  

    def save
      puts "save"
      render(:layout => false)
    end
  end

