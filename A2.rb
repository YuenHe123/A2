# bpm and scale
use_bpm 127
use_synth :piano
use_synth_defaults sustain: 0.3

# Reverb fx
with_fx :reverb do
  # define chord progression
  chord_progression = [(chord :D4, :minor), (chord :G4, :major), (chord :A4, :minor), (chord :Bb4, :major)]
  chord_duration = 2 # 2小节的持续时间
  
  # define intro
  in_thread do
    4.times do
      chord_progression.each do |chord|
        play_chord chord
        sleep chord_duration
      end
    end
  end
  
  
  # drums
  in_thread do
    4.times do
      sample :bd_boom
      sleep 1
      sample :sn_dub
      sleep 2
      sample :drum_cymbal_closed
      sleep 0.5
      sample :drum_cymbal_closed
      sleep 0.5
      sample :bd_boom
      sleep 0.5
      sample :bd_boom
      sleep 1
      sample :sn_dub
      sleep 0.5
    end
  end
  
  
  
  # insert my wav file
  in_thread do
    sleep 16 * chord_duration
    sample "C:/beats/A2.mp3"
  end
end

