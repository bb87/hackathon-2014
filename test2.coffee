video = require './src/coffee/video-model.coffee'
data = require './data/universal.json'
console.log video.VideoFeed, '<----- video'
module.exports = new video.VideoFeed(data)
