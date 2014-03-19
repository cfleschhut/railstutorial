$ ->

  # Infinite Scrolling in Rails
  # http://www.sitepoint.com/infinite-scrolling-rails-basics/
  # http://www.sitepoint.com/infinite-scrolling-rails-practice/

  if $('#infinite-scrolling').length
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination .next_page a').attr('href')
      # console.log more_posts_url
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading…">')
        $.getScript more_posts_url
