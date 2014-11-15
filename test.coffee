console.log "the files are in the computer:"

models = require './src/coffee/models.coffee'
airingData = require './data/ff5.json'

airingData.key = 'BZP1H20KHQ5'

module.exports = model = new models.AiringModel airingData

console.log "get drunk at 2", model.timeline.events.at 2