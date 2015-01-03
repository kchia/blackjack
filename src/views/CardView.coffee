class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="img/<%= (revealed ? "cards/"+rankName + "-" + suitName : "card-back") %>.png"/>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

