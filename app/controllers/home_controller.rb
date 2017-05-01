class HomeController < ApplicationController
  def index
  end

  def about
  end

  def faq
    @faqs = Faq.all
  end
end
