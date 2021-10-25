# Exercise 5 Part 1 (Exception Handling)

class MentalState
  ## Hoping I understand correctly that we assume these methods
  ## would work and we only need to do the exception handling in the non-class methods
  def auditable?
    # true if the external service is online, otherwise false
  end
  def audit!
    # Could fail if external service is offline      
    end
  end
  def do_work
    # Amazing stuff...
  end
end

def audit_sanity(bedtime_mental_state)
  return 0 unless bedtime_mental_state.auditable?
  begin
    bedtime_mental_state.audit!.ok?
    MorningMentalState.new(:ok)
  rescue => exception
    MorningMentalState.new(:not_ok)

end

if audit_sanity(bedtime_mental_state) == 0
  puts "error: sanity not found."
else
  new_state = audit_sanity(bedtime_mental_state)
end





# Exercise 5 Part 2 (Don't Return Null / Null Object Pattern)

class BedtimeMentalState < MentalState ; end

class MorningMentalState < MentalState ; end

class NullMentalState < MentalState
  def auditable?
    # true if the external service is online, otherwise false
    false
  end
  def audit!
    # Could fail if external service is offline      
    puts "error: NullMentalState" # only :not_ok
  end
  end
  def do_work
    puts "error: NullMentalState"
  end
end

def audit_sanity(bedtime_mental_state)
  return NullMentalState.new(:not_ok) unless bedtime_mental_state.auditable?
  if bedtime_mental_state.audit!.ok?
    MorningMentalState.new(:ok)
  else 
    MorningMentalState.new(:not_ok)
  end
end

new_state = audit_sanity(bedtime_mental_state)
new_state.do_work




# Exercise 5 Part 3 (Wrapping APIs)

require 'candy_service'

class MyCandyMachine

  def initialize
    @CandyMachine = CandyMachine.new  
  end

  def prepare 
    @CandyMachine.prepare
  end

  def make!
    if @CandyMachine.ready?
      @CandyMachine.make!
    else
      puts "sadness. Not ready yet."
    end
  end
  
end

machine = MyCandyMachine.new
machine.prepare
machine.make!
