_ = require 'lodash'
models = require './models'
AmpersandModel = require 'ampersand-model'

VideoModel = AmpersandModel.extend
    props: {
        videoUrl: ['string', true, '']
        title: ['string', true, '']
        description: ['string', true, '']
    }
    

    url: ()->
        return 'http://feed.media.theplatform.com/f/JStuSC/universalpicturesdm_hackathon'

module.exports = VideoModel