module EventsHelper
  def get_image_url(genre)
    case genre
    when "conferences"
      "https://res.cloudinary.com/dqfn0qd93/image/upload/v1679924660/event-buddy/conferences_zcopuh.jpg"
    when "expos"
      "https://res.cloudinary.com/dqfn0qd93/image/upload/v1679924660/event-buddy/expos_b5yetg.jpg"
    when "community"
      "https://res.cloudinary.com/dqfn0qd93/image/upload/v1679924658/event-buddy/community_pefhrk.jpg"
    when "performing-arts"
      "https://res.cloudinary.com/dqfn0qd93/image/upload/v1679924656/event-buddy/performing-arts_dpsrgu.jpg"
    when "concerts"
      "https://res.cloudinary.com/dqfn0qd93/image/upload/v1679924655/event-buddy/concerts_nmxcei.jpg"
    when "festivals"
      "https://res.cloudinary.com/dqfn0qd93/image/upload/v1679924653/event-buddy/festivals_cxugfs.jpg"
    when "sports"
      "https://res.cloudinary.com/dqfn0qd93/image/upload/v1679924652/event-buddy/sports_riuh1m.jpg"
    else
      "https://res.cloudinary.com/dqfn0qd93/image/upload/v1678965507/cld-sample-2.jpg"
    end
  end
end
