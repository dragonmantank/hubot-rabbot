# Description
#   A robotic helper for @coderabbi and his IRC channel
#
# Configuration:
#
# Commands:
#   hubot does [handle] get it? - Checks to see if a person gets it
#   silly rabbot - Makes a snarky remark
#   hubot teach me - Hubot will return an insightful message
#
# Notes:
#   No extfa notes
#
# Author:
#   Chris Tankersley <chris@ctankersley.com>

people_who_get_it = 
  'coderabbi': 'Of course coderabbi gets it, it is his channel.'
  'coderebbetzin': 'Of course she does. That was a dumb question.'
  'dragonmantank': 'I am programmed to say he gets it.'
  'dcousineau': 'He is one with the brisket.'
  'MANCHUCK': 'As the The secretary of WurstCon, he gets it '

maxims = [
  'Cultivate for yourself a mentor; Acquire for yourself a colleague.',
  'Much did I learn from my mentors, even more from my colleagues, but from my students I learn most of all.',
  'Teach the student according to their way.',
  'Do not separate from the community.',
  'Who is wise? One who learns from everyone.',
  'In a place where there is nobody, endeavor to be somebody.',
  'The timid does not learn.',
  'All beginnings are difficult',
  'If I am not for myself, who will be for me? If I am only for myself, what am I? If not now, when?'
]

module.exports = (robot) ->
  robot.respond /does (.*) get it?/i, (msg) ->
      handle = msg.match[1]
      if handle == robot.name
        msg.reply 'PHP Fatal Error: Nesting level too deep'
        return

      if people_who_get_it.handle?
        msg.reply people_who_get_it.handle
        return

      decision = (Math.floor((Math.random() * 10) + 1)) % 2
      if decision == 0
        msg.reply "Yes, " + handle + " gets it"
      else 
        msg.reply "No, " + handle + " doesn't get it";
  
  robot.respond /teach me/i, (msg) ->
    msg.reply msg.random maxims

  robot.hear /silly rabbot/, ->
    msg.send "Trix are for kids."
