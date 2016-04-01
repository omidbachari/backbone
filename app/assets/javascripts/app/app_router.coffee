Router = Backbone.Router.extend {
  routes:
    ':name'   : 'show'

  show: (name) ->
    @showPage(name)

  showPage: (name) ->
    window.peopleList = new PeopleList
    peopleList.fetch().then ->
      $('.card').remove()
      $.each(peopleList._byId, (_prop, person_data) ->
        slug =  person_data.attributes._url.split('/')[2].split('.')[0]
        $('.backbone').html person_data.attributes.bio if name == slug
      )
}

window.router = new Router

$(document).ready ->
  Backbone.history.start(pushState: true)
