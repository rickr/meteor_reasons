Reasons  = new Meteor.Collection('reasons')

if (Meteor.isClient)
  Template.header.heading = ->
    count = Reasons.find().count()
    reason_string = " Reason"
    reason_string += "s" if count > 1 and count != 0
    return count + reason_string

  Template.reasons.reasons = ->
    return Reasons.find()

  Template.newReason.events =
    'keypress input#newReason': (e, template) ->
      if(e.which == 13)
        newReason = $('#newReason').val().trim()

        if(newReason.length > 0)
          Reasons.insert({reason: newReason})
          $('#newReason').val('')

  Template.reasons.events =
    'click .destroy': (e) ->
      id = $(e.currentTarget).closest('li').attr('id')
      Reasons.remove _id: id
