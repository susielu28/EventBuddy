class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @elton = Event.where("venue ILIKE '%london%'").where("name ILIKE '%elton%'").first
    @brighton = Event.where("venue ILIKE '%london%'").where("name ILIKE '%tottenham%' AND name ILIKE '%brighton%'").first
    @rockofages = Event.where("venue ILIKE '%berlin%'").where("name ILIKE '%rock%'").first
  end
end
