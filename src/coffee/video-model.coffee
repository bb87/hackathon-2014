_ = require 'lodash'
models = require './models'
AmpersandModel = require 'ampersand-model'
AmpersandCollection = require 'ampersand-collection'


VideoEntryCollection = AmpersandCollection.extend
    model: VideoEntry

mediaCollection = AmpersandCollection.extend
    model: mediaModel

mediaModel = AmpersandModel.extend 
    props: {
        format: ['string', true, '']
        height: ['string', true, '']
        width: ['string', true, '']
        url: ['string', true, '']
    }

VideoEntry = AmpersandModel.extend
    props: {
        id: ['string', true, '']
        guid: ['string', true, '']
        title: ['string', true, '']
        author: ['string', true, '']
        description: ['string', true, '']
        categories: ['array', true, '']
    }
    collections: {
        thumbnails: mediaCollection
        content: mediaCollection
    }

VideoFeed = AmpersandModel.extend
    props: {
        title: ['string', true, '']
    }
    collections: {
        entries: VideoEntryCollection
    }

module.exports = {
    VideoFeed: VideoFeed
}
