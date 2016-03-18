PersonView = Backbone.View.extend {
  className: 'card'
  template: _.template "<img class='image' src='<%= imagePath %>'></img>" +
    "<a class='name virtual' id='<%= _url.split('/')[2].split('.')[0] %>' href='#'>" +
      "<%= name %>" +
    "</a>" +
    "<span class='title'><%= title %></span>"
  render: ->
    @$el.html @template(@model.toJSON())
    this
}

window.peopleList = new PeopleList

PeopleListView = Backbone.View.extend {
  collection: peopleList
  render: ->
    @collection.forEach(@addOne, this)
    this
  addOne: (person) ->
    personView = new PersonView {model: person}
    @$el.append(personView.render().el)
}

peopleListView = new PeopleListView

peopleList.fetch().then ->
  $('.backbone').html peopleListView.render().el
  $('a.virtual').click (e) ->
    e.preventDefault()
    router.navigate(e.currentTarget.id, {trigger: true});
