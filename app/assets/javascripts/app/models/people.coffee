window.Person = Backbone.Model.extend {}

window.PeopleList = Backbone.Collection.extend {
  model: Person
  url: 'assets/people.json'
}
