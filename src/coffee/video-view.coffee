_ = require 'lodash'
AmpersandView = require 'ampersand-view'
VideoModel = require './video-model'

VideoView = AmpersandView.extend
    template: '<div><a data-hook="videoUrl">Furious Video</a></div>'
    bindings: 
        'model.url': 
            type: "text"
            hook: "videoUrl"



module.exports = VideoView