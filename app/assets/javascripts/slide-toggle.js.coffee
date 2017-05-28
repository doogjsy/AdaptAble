jQuery ->
  $(document).on 'click', '.js-more', ->
    $(this).parent('div').siblings('.js-hidden-body').slideToggle()
