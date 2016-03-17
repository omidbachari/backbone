PersonView = Backbone.View.extend {
  className: 'card'
  template: _.template "<img class='image' src='<%= imagePath %>'></img>" +
    "<span class='name'><%= name %></span>" +
    "<span class='title'><%= title %></span>" +
    "<span class='bio'><%= bio %></span>"

  render: ->
    @$el.html @template(@model.toJSON())
    this
}

peopleList = new PeopleList

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
