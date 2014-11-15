_ = require 'lodash'
AmpersandModel = require 'ampersand-model'
AmpersandCollection = require 'ampersand-collection'

ImageModel = AmpersandModel.extend
    props:
        uri: ['string', true]
        width: ['number', true]
        height: ['number', true]
    parse: (attrs)->
        if attrs.url?
            attrs.uri = attrs.url
            delete attrs.url
        return attrs
    initialize: (attrs, opts)->
        if attrs?
            attrs = @parse attrs
        AmpersandModel::initialize.call @, [attrs, opts]
        return @


CardObjectModel = AmpersandModel.extend
    props: {
        title: ['string', true]
        uuid: ['string', true]
        objectType: ['string', false]
    }
    children:
        image: ImageModel

CardModel = AmpersandModel.extend
    idAttribute: 'rcdbId'
    props: {
        type: ['string', true]
        rcdbId: ['string', true]
        source: ['string', true]
    }

EventModel = AmpersandModel.extend
    idAttribute: 'rcdbId'
    props: {
        in: ['number', true]
        out: ['number', true]
        rcdbId: ['string', true]
        cardRcdbId: ['string', true]
    }
    children: {
        card: CardModel
    }

EventCollection = AmpersandCollection.extend
    model: EventModel

TimelineModel = AmpersandModel.extend
    props: {
        cards: ['object', true]
    }
    collections: {
        events: EventCollection 
    }

AiringModel = AmpersandModel.extend
    idAttribute: 'uuid'
    props: {
        cards: ['object']
        uuid: ['string', true]
        duration: ['number', true, 0]
        title: ['string', true, '']
        startDateUtc: ['number', true]
    }
    children: {
        timeline: TimelineModel
    }
    derived:
        endDateUtc:
            deps: [
                'startDateUtc'
                'duration'
            ]
            cache: true
            fn: ()->
                if _.isNumber(@startDateUtc) and _.isNumber(@duration)
                    return @duration + @startDateUtc

module.exports = {
    ImageModel: ImageModel
    CardObjectModel: CardObjectModel
    CardModel: CardModel
    EventModel: EventModel
    EventCollection: EventCollection
    TimelineModel: TimelineModel
    AiringModel: AiringModel
}