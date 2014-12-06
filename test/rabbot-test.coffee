Robot = require("hubot/src/robot")
TextMessage = require("hubot/src/message").TextMessage

chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'rabbot', ->
  @robot = null
  user = null

  beforeEach ->
    @robot = new Robot null, 'mock-adapter', yes, 'TestHubot'
    require('../src/rabbot')(@robot)
    user = @robot.brain.userForId '1', {
      name: 'dragonmantank'
      room: '#coderabbi'
    }

  afterEach ->
    @robot.server.close()
    @robot.shutdown()

  it 'responds to coderabbi', (done)->
    @robot.adapter.on 'send', (envelope, strings)->
      try
        expect(strings[0]).to.equal 'Of course coderabbi gets it, it is his channel.'
        do done
      catch e
        done e
    @robot.adapter.receive new TextMessage user, 'TestHubot does coderabbi get it?'
