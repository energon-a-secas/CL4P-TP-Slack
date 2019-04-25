require './actions/idle'
require './actions/sing'
require './actions/dance'
require './actions/report'
require './actions/recite'

#Ethics
#Personality

class Directive
  # Will does not refer to any particular desire, but rather to the mechanism for choosing from among one's directives.

  def self.serve(data)
    case data.text
    when /no eventos/
      Idle.quote(data)
    when /(bail[ea]|directive three)/
      Dance.disco(data)
    when /canta/
      Sing.song(data)
    when /recomienda una canci[oó]n/
      Sing.recommend(data)
    when /reporte/
      Report.status(data)
    when /beneficio/
      Recite.benefit(data)
    end
  end
end


